package com.lunwen.service;

import org.springframework.stereotype.Service;
import java.io.File;
import java.io.IOException;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.UnsupportedAudioFileException;

/**
 * MFCC特征提取服务 - Java纯实现版本
 *
 * 提取39维MFCC特征：
 * - 13维 MFCC系数
 * - 13维 一阶差分（delta）
 * - 13维 二阶差分（delta-delta）
 */
@Service
public class MFCCFeatureExtractionService {

    // MFCC参数
    private static final int SAMPLE_RATE = 16000;           // 采样率
    private static final int FRAME_LENGTH = 400;            // 帧长（25ms）
    private static final int FRAME_SHIFT = 160;             // 帧移（10ms）
    private static final int N_MFCC = 13;                   // MFCC系数数
    private static final int N_FILTERS = 40;                // 梅尔滤波器组数
    private static final float PRE_EMPHASIS = 0.97f;        // 预加重系数
    private static final int FFT_SIZE = 512;                // FFT大小
    private static final float ENERGY_THRESHOLD_RATIO = 0.12f; // 短时能量阈值比例
    private static final float ZCR_THRESHOLD_RATIO = 0.35f;    // 过零率阈值比例
    private static final int MIN_SPEECH_FRAMES = 5;            // 最少保留语音帧数

    /**
     * 从音频文件提取MFCC特征
     *
     * @param audioFile 音频文件路径
     * @return 39维特征向量矩阵 [帧数][39]
     */
    public float[][] extractMFCC(String audioFile) throws Exception {
        // 1. 读取音频
        float[] audioData = readAudioFile(audioFile);

        // 2. 预加重处理
        float[] emphasized = preEmphasis(audioData);

        // 3. 端点检测，裁剪前后静音段
        float[] speechSegment = detectSpeechSegment(emphasized);

        // 4. 分帧和加窗
        float[][] frames = frameAndWindow(speechSegment);

        // 5. FFT
        float[][] spectrum = computeSpectrum(frames);

        // 6. 梅尔滤波
        float[][] melSpec = melFilterBank(spectrum);

        // 7. 对数处理
        float[][] logSpec = logScale(melSpec);

        // 8. DCT变换得到MFCC
        float[][] mfcc = discreteCosineTransform(logSpec);

        // 9. 计算一阶和二阶差分
        float[][] deltaFeatures = computeDeltaFeatures(mfcc);
        float[][] deltaDeltaFeatures = computeDeltaFeatures(deltaFeatures);

        // 10. 合并39维特征
        return concatenateFeatures(mfcc, deltaFeatures, deltaDeltaFeatures);
    }

    /**
     * 读取WAV音频文件
     */
    private float[] readAudioFile(String filePath) throws UnsupportedAudioFileException, IOException {
        File file = new File(filePath);
        AudioInputStream audioInputStream = AudioSystem.getAudioInputStream(file);

        int bytesPerFrame = audioInputStream.getFormat().getFrameSize();
        int numFrames = (int) audioInputStream.getFrameLength();
        byte[] audioBytes = new byte[bytesPerFrame * numFrames];

        audioInputStream.read(audioBytes);
        audioInputStream.close();

        // 转换为float数组（16-bit PCM）
        float[] audioData = new float[numFrames];
        for (int i = 0; i < numFrames; i++) {
            int sample = (audioBytes[2*i] & 0xFF) | (audioBytes[2*i+1] << 8);
            audioData[i] = sample / 32768.0f;
        }

        return audioData;
    }

    /**
     * 预加重处理
     * y[n] = x[n] - α*x[n-1]
     */
    private float[] preEmphasis(float[] signal) {
        float[] emphasized = new float[signal.length];
        emphasized[0] = signal[0];

        for (int i = 1; i < signal.length; i++) {
            emphasized[i] = signal[i] - PRE_EMPHASIS * signal[i - 1];
        }

        return emphasized;
    }

    /**
     * 端点检测（VAD）
     *
     * 使用短时能量作为主判据，过零率作为辅判据，裁剪首尾静音。
     * 若未检测到稳定语音段，则回退到原始信号，避免识别流程中断。
     */
    private float[] detectSpeechSegment(float[] signal) {
        if (signal.length <= FRAME_LENGTH) {
            return signal;
        }

        int numFrames = Math.max(1, (signal.length - FRAME_LENGTH) / FRAME_SHIFT + 1);
        float[] energies = new float[numFrames];
        float[] zcrs = new float[numFrames];
        float maxEnergy = 0f;
        float maxZcr = 0f;

        for (int frameIndex = 0; frameIndex < numFrames; frameIndex++) {
            int start = frameIndex * FRAME_SHIFT;
            float energy = 0f;
            int zeroCrossings = 0;

            for (int i = 0; i < FRAME_LENGTH; i++) {
                float current = signal[start + i];
                energy += current * current;

                if (i > 0) {
                    float previous = signal[start + i - 1];
                    if ((current >= 0 && previous < 0) || (current < 0 && previous >= 0)) {
                        zeroCrossings++;
                    }
                }
            }

            energies[frameIndex] = energy / FRAME_LENGTH;
            zcrs[frameIndex] = zeroCrossings / (float) FRAME_LENGTH;
            maxEnergy = Math.max(maxEnergy, energies[frameIndex]);
            maxZcr = Math.max(maxZcr, zcrs[frameIndex]);
        }

        if (maxEnergy == 0f) {
            return signal;
        }

        float energyThreshold = maxEnergy * ENERGY_THRESHOLD_RATIO;
        float zcrThreshold = maxZcr * ZCR_THRESHOLD_RATIO;

        int startFrame = -1;
        int endFrame = -1;
        for (int i = 0; i < numFrames; i++) {
            if (isSpeechFrame(energies[i], zcrs[i], energyThreshold, zcrThreshold)) {
                startFrame = i;
                break;
            }
        }

        for (int i = numFrames - 1; i >= 0; i--) {
            if (isSpeechFrame(energies[i], zcrs[i], energyThreshold, zcrThreshold)) {
                endFrame = i;
                break;
            }
        }

        if (startFrame < 0 || endFrame < 0 || endFrame < startFrame) {
            return signal;
        }

        if (endFrame - startFrame + 1 < MIN_SPEECH_FRAMES) {
            return signal;
        }

        // 适当向前后扩一帧，避免把弱起始音和尾音裁掉。
        startFrame = Math.max(0, startFrame - 1);
        endFrame = Math.min(numFrames - 1, endFrame + 1);

        int startSample = startFrame * FRAME_SHIFT;
        int endSample = Math.min(signal.length, endFrame * FRAME_SHIFT + FRAME_LENGTH);
        int speechLength = endSample - startSample;

        if (speechLength <= FRAME_LENGTH) {
            return signal;
        }

        float[] speech = new float[speechLength];
        System.arraycopy(signal, startSample, speech, 0, speechLength);
        return speech;
    }

    private boolean isSpeechFrame(float energy, float zcr, float energyThreshold, float zcrThreshold) {
        return energy >= energyThreshold || (energy >= energyThreshold * 0.6f && zcr >= zcrThreshold);
    }

    /**
     * 分帧和加汉宁窗
     */
    private float[][] frameAndWindow(float[] signal) {
        int numFrames = Math.max(1, (signal.length - FRAME_LENGTH) / FRAME_SHIFT + 1);
        float[][] frames = new float[numFrames][FRAME_LENGTH];

        // 汉宁窗
        float[] window = new float[FRAME_LENGTH];
        for (int i = 0; i < FRAME_LENGTH; i++) {
            window[i] = 0.54f - 0.46f * (float) Math.cos(2 * Math.PI * i / (FRAME_LENGTH - 1));
        }

        for (int f = 0; f < numFrames; f++) {
            int start = f * FRAME_SHIFT;
            for (int i = 0; i < FRAME_LENGTH; i++) {
                int sampleIndex = Math.min(start + i, signal.length - 1);
                frames[f][i] = signal[sampleIndex] * window[i];
            }
        }

        return frames;
    }

    /**
     * 计算功率谱
     */
    private float[][] computeSpectrum(float[][] frames) {
        int numFrames = frames.length;
        int numBins = FFT_SIZE / 2 + 1;
        float[][] spectrum = new float[numFrames][numBins];

        for (int f = 0; f < numFrames; f++) {
            // 简单的FFT实现（可使用Apache Commons或JTransforms库）
            float[] power = computeFFT(frames[f]);
            System.arraycopy(power, 0, spectrum[f], 0, numBins);
        }

        return spectrum;
    }

    /**
     * 简化的FFT功率计算
     */
    private float[] computeFFT(float[] frame) {
        int numBins = FFT_SIZE / 2 + 1;
        float[] power = new float[numBins];

        // 为了简化，这里使用Goertzel算法计算特定频率的幅度
        // 实际项目中应使用完整的FFT库（如JTransforms）
        for (int k = 0; k < numBins; k++) {
            float real = 0, imag = 0;
            for (int n = 0; n < FRAME_LENGTH; n++) {
                float angle = -2 * (float) Math.PI * k * n / FFT_SIZE;
                real += frame[n] * (float) Math.cos(angle);
                imag += frame[n] * (float) Math.sin(angle);
            }
            power[k] = (real * real + imag * imag) / (FRAME_LENGTH * FRAME_LENGTH);
        }

        return power;
    }

    /**
     * 梅尔滤波器组
     */
    private float[][] melFilterBank(float[][] spectrum) {
        int numFrames = spectrum.length;
        float[][] melSpec = new float[numFrames][N_FILTERS];

        // 转换为Mel标度
        float[] melBins = linspace(0, hzToMel(SAMPLE_RATE / 2), N_FILTERS + 2);

        for (int f = 0; f < numFrames; f++) {
            for (int m = 0; m < N_FILTERS; m++) {
                float leftMel = melBins[m];
                float centerMel = melBins[m + 1];
                float rightMel = melBins[m + 2];

                float leftHz = melToHz(leftMel);
                float centerHz = melToHz(centerMel);
                float rightHz = melToHz(rightMel);

                // 三角滤波器
                for (int k = 0; k < spectrum[f].length; k++) {
                    float hz = k * SAMPLE_RATE / FFT_SIZE;
                    float weight = 0;

                    if (hz >= leftHz && hz <= centerHz) {
                        weight = (hz - leftHz) / (centerHz - leftHz);
                    } else if (hz >= centerHz && hz <= rightHz) {
                        weight = (rightHz - hz) / (rightHz - centerHz);
                    }

                    melSpec[f][m] += spectrum[f][k] * weight;
                }
            }
        }

        return melSpec;
    }

    /**
     * 对数处理（避免log(0)）
     */
    private float[][] logScale(float[][] data) {
        float[][] result = new float[data.length][data[0].length];
        for (int i = 0; i < data.length; i++) {
            for (int j = 0; j < data[i].length; j++) {
                result[i][j] = (float) Math.log(data[i][j] + 1e-10);
            }
        }
        return result;
    }

    /**
     * DCT变换提取MFCC
     */
    private float[][] discreteCosineTransform(float[][] data) {
        int numFrames = data.length;
        int numBands = data[0].length;
        float[][] mfcc = new float[numFrames][N_MFCC];

        for (int f = 0; f < numFrames; f++) {
            for (int i = 0; i < N_MFCC; i++) {
                float sum = 0;
                for (int j = 0; j < numBands; j++) {
                    sum += data[f][j] * (float) Math.cos(Math.PI * i * (j + 0.5) / numBands);
                }
                mfcc[f][i] = (float) (Math.sqrt(2.0 / numBands) * sum);
            }
        }

        return mfcc;
    }

    /**
     * 计算一阶差分（delta）
     */
    private float[][] computeDeltaFeatures(float[][] features) {
        int numFrames = features.length;
        int numCoeffs = features[0].length;
        float[][] delta = new float[numFrames][numCoeffs];

        int N = 2;  // 差分窗口
        for (int t = 0; t < numFrames; t++) {
            for (int c = 0; c < numCoeffs; c++) {
                float sum = 0;
                for (int n = 1; n <= N; n++) {
                    int tPlus = Math.min(t + n, numFrames - 1);
                    int tMinus = Math.max(t - n, 0);
                    sum += n * (features[tPlus][c] - features[tMinus][c]);
                }
                delta[t][c] = sum / (2 * N * N);
            }
        }

        return delta;
    }

    /**
     * 合并39维特征
     */
    private float[][] concatenateFeatures(float[][] mfcc, float[][] delta, float[][] deltaDelta) {
        int numFrames = mfcc.length;
        float[][] features39 = new float[numFrames][39];

        for (int f = 0; f < numFrames; f++) {
            // 13维MFCC
            System.arraycopy(mfcc[f], 0, features39[f], 0, 13);
            // 13维Delta
            System.arraycopy(delta[f], 0, features39[f], 13, 13);
            // 13维Delta-Delta
            System.arraycopy(deltaDelta[f], 0, features39[f], 26, 13);
        }

        return features39;
    }

    /**
     * 频率转换函数
     */
    private float hzToMel(float hz) {
        return 2595 * (float) Math.log10(1 + hz / 700);
    }

    private float melToHz(float mel) {
        return 700 * ((float) Math.pow(10, mel / 2595) - 1);
    }

    private float[] linspace(float start, float end, int num) {
        float[] result = new float[num];
        for (int i = 0; i < num; i++) {
            result[i] = start + (end - start) * i / (num - 1);
        }
        return result;
    }
}
