package com.lunwen.service;

import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

/**
 * DTW (动态时间规整) 匹配服务 - Java纯实现版本
 *
 * 使用Sakoe-Chiba带约束优化性能
 */
@Service
public class DTWMatchingService {

    // 约束带宽参数
    private static final float BAND_WIDTH_RATIO = 0.5f;  // 带宽占比

    /**
     * 计算两个序列之间的DTW距离
     *
     * @param testFeatures 测试特征 [帧数][特征维数]
     * @param templateFeatures 模板特征 [帧数][特征维数]
     * @return 归一化的DTW距离
     */
    public float calculateDTWDistance(float[][] testFeatures, float[][] templateFeatures) {
        int M = testFeatures.length;
        int N = templateFeatures.length;

        // 计算所有帧之间的欧氏距离
        float[][] cost = computeCostMatrix(testFeatures, templateFeatures);

        // 使用Sakoe-Chiba带约束的DTW
        float[][] dtw = dtwWithBandConstraint(cost, M, N);

        // 获取DTW距离
        float distance = dtw[M - 1][N - 1];

        // 路径长度归一化
        float normalized = distance / (M + N);

        return normalized;
    }

    /**
     * 计算帧间距离矩阵（欧氏距离）
     */
    private float[][] computeCostMatrix(float[][] testFeatures, float[][] templateFeatures) {
        int M = testFeatures.length;
        int N = templateFeatures.length;
        float[][] cost = new float[M][N];

        for (int i = 0; i < M; i++) {
            for (int j = 0; j < N; j++) {
                cost[i][j] = euclideanDistance(testFeatures[i], templateFeatures[j]);
            }
        }

        return cost;
    }

    /**
     * 欧氏距离
     */
    private float euclideanDistance(float[] a, float[] b) {
        float sum = 0;
        for (int i = 0; i < a.length; i++) {
            float diff = a[i] - b[i];
            sum += diff * diff;
        }
        return (float) Math.sqrt(sum);
    }

    /**
     * DTW动态规划 + Sakoe-Chiba带约束
     *
     * Sakoe-Chiba带约束：只在对角线附近计算，减少计算量
     * 带宽 = max(M, N) * BAND_WIDTH_RATIO
     */
    private float[][] dtwWithBandConstraint(float[][] cost, int M, int N) {
        float[][] dtw = new float[M][N];

        // 初始化为无穷大
        for (int i = 0; i < M; i++) {
            for (int j = 0; j < N; j++) {
                dtw[i][j] = Float.MAX_VALUE;
            }
        }

        dtw[0][0] = cost[0][0];

        // 计算带宽
        int bandWidth = (int) Math.ceil(Math.max(M, N) * BAND_WIDTH_RATIO);

        // 动态规划计算DTW
        for (int i = 0; i < M; i++) {
            for (int j = 0; j < N; j++) {
                // Sakoe-Chiba约束：检查是否在带内
                if (Math.abs(i - j) > bandWidth) {
                    continue;
                }

                if (i == 0 && j == 0) {
                    continue;
                }

                float minPrev = Float.MAX_VALUE;

                // 检查三个方向：上、左、左上
                if (i > 0) minPrev = Math.min(minPrev, dtw[i - 1][j]);
                if (j > 0) minPrev = Math.min(minPrev, dtw[i][j - 1]);
                if (i > 0 && j > 0) minPrev = Math.min(minPrev, dtw[i - 1][j - 1]);

                if (minPrev != Float.MAX_VALUE) {
                    dtw[i][j] = cost[i][j] + minPrev;
                }
            }
        }

        return dtw;
    }

    /**
     * 获取DTW对齐路径
     * （用于调试和可视化）
     */
    public List<int[]> getAlignmentPath(float[][] testFeatures, float[][] templateFeatures) {
        int M = testFeatures.length;
        int N = templateFeatures.length;

        float[][] cost = computeCostMatrix(testFeatures, templateFeatures);
        float[][] dtw = dtwWithBandConstraint(cost, M, N);

        // 回溯找到最优路径
        List<int[]> path = new ArrayList<>();
        int i = M - 1;
        int j = N - 1;

        while (i > 0 || j > 0) {
            path.add(0, new int[]{i, j});

            if (i == 0) {
                j--;
            } else if (j == 0) {
                i--;
            } else {
                // 选择最小的前驱
                float diagValue = dtw[i - 1][j - 1];
                float upValue = dtw[i - 1][j];
                float leftValue = dtw[i][j - 1];

                if (diagValue <= upValue && diagValue <= leftValue) {
                    i--;
                    j--;
                } else if (upValue <= leftValue) {
                    i--;
                } else {
                    j--;
                }
            }
        }

        path.add(0, new int[]{0, 0});
        return path;
    }

    /**
     * 批量计算DTW距离
     *
     * @param testFeatures 测试特征
     * @param templates 模板库（多个模板）
     * @return 与各模板的DTW距离数组
     */
    public float[] batchCalculateDTW(float[][] testFeatures, List<float[][]> templates) {
        float[] distances = new float[templates.size()];

        for (int i = 0; i < templates.size(); i++) {
            distances[i] = calculateDTWDistance(testFeatures, templates.get(i));
        }

        return distances;
    }

    /**
     * 找到最接近的模板
     *
     * @param testFeatures 测试特征
     * @param templates 模板库
     * @return [最接近的模板索引, 距离值]
     */
    public int[] findClosestTemplate(float[][] testFeatures, List<float[][]> templates) {
        float[] distances = batchCalculateDTW(testFeatures, templates);

        float minDistance = Float.MAX_VALUE;
        int minIndex = -1;

        for (int i = 0; i < distances.length; i++) {
            if (distances[i] < minDistance) {
                minDistance = distances[i];
                minIndex = i;
            }
        }

        return new int[]{minIndex, (int) minDistance};
    }

    /**
     * 计算置信度
     * 置信度 = 1 - (最小距离 / 次小距离)
     *
     * @param distances 所有模板的距离值
     * @return 置信度 (0-1)
     */
    public float calculateConfidence(float[] distances) {
        if (distances.length < 2) {
            return 0.5f;  // 只有一个模板时，置信度为0.5
        }

        // 找最小和次小
        float minDist = Float.MAX_VALUE;
        float secondMinDist = Float.MAX_VALUE;

        for (float dist : distances) {
            if (dist < minDist) {
                secondMinDist = minDist;
                minDist = dist;
            } else if (dist < secondMinDist) {
                secondMinDist = dist;
            }
        }

        if (secondMinDist == Float.MAX_VALUE) {
            return 0.5f;
        }

        // 置信度 = 1 - (min / secondMin)
        float confidence = 1 - (minDist / secondMinDist);
        return Math.max(0, Math.min(1, confidence));  // 限制在[0,1]
    }

    /**
     * 获取匹配统计信息
     */
    public DTWStats getStatistics(float[][] testFeatures, List<float[][]> templates) {
        float[] distances = batchCalculateDTW(testFeatures, templates);

        float minDist = Float.MAX_VALUE;
        float maxDist = Float.MIN_VALUE;
        float sumDist = 0;

        for (float dist : distances) {
            minDist = Math.min(minDist, dist);
            maxDist = Math.max(maxDist, dist);
            sumDist += dist;
        }

        float avgDist = sumDist / distances.length;

        return new DTWStats(minDist, maxDist, avgDist, distances.length);
    }

    /**
     * DTW统计信息
     */
    public static class DTWStats {
        public float minDistance;
        public float maxDistance;
        public float avgDistance;
        public int templateCount;

        public DTWStats(float minDistance, float maxDistance, float avgDistance, int templateCount) {
            this.minDistance = minDistance;
            this.maxDistance = maxDistance;
            this.avgDistance = avgDistance;
            this.templateCount = templateCount;
        }

        @Override
        public String toString() {
            return String.format("DTWStats{min=%.3f, max=%.3f, avg=%.3f, templates=%d}",
                    minDistance, maxDistance, avgDistance, templateCount);
        }
    }
}
