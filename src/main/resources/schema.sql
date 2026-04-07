-- 创建数据库
CREATE DATABASE IF NOT EXISTS zhijin_miao
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE zhijin_miao;

-- 用户表
CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_username (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 发音人表
CREATE TABLE speakers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    speaker_id VARCHAR(10) UNIQUE NOT NULL,
    name VARCHAR(50),
    age INT,
    gender ENUM('M', 'F'),
    dialect_background VARCHAR(100),
    phonetic_quality VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_speaker_id (speaker_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 词汇表
CREATE TABLE vocabulary (
    id INT PRIMARY KEY AUTO_INCREMENT,
    word_id VARCHAR(10) UNIQUE NOT NULL,
    word_text VARCHAR(100) NOT NULL,
    pinyin VARCHAR(100),
    tone VARCHAR(20),
    pos_tag VARCHAR(20),
    category VARCHAR(50),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_word_id (word_id),
    INDEX idx_tone (tone),
    INDEX idx_category (category)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 语音样本表
CREATE TABLE audio_samples (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    sample_id VARCHAR(50) UNIQUE NOT NULL,
    speaker_id INT NOT NULL,
    word_id INT NOT NULL,
    audio_path VARCHAR(255),
    duration_ms FLOAT,
    sample_rate INT DEFAULT 16000,
    bit_depth INT DEFAULT 16,
    channels INT DEFAULT 1,
    quality_flag VARCHAR(10) DEFAULT 'OK',
    quality_score FLOAT,
    noise_level FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (speaker_id) REFERENCES speakers(id),
    FOREIGN KEY (word_id) REFERENCES vocabulary(id),
    INDEX idx_speaker_word (speaker_id, word_id),
    INDEX idx_sample_id (sample_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 识别模板表
CREATE TABLE templates (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    template_id VARCHAR(50) UNIQUE NOT NULL,
    word_id INT NOT NULL,
    speaker_id INT NOT NULL,
    audio_sample_id BIGINT,
    mfcc_feature_path VARCHAR(255),
    feature_vector LONGBLOB,
    feature_length INT,
    num_frames INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (word_id) REFERENCES vocabulary(id),
    FOREIGN KEY (speaker_id) REFERENCES speakers(id),
    FOREIGN KEY (audio_sample_id) REFERENCES audio_samples(id),
    INDEX idx_word_speaker (word_id, speaker_id),
    INDEX idx_template_id (template_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 识别结果表
CREATE TABLE recognition_results (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    audio_file_path VARCHAR(255),
    input_audio_duration_ms FLOAT,
    top1_word_id INT,
    top1_template_id BIGINT,
    top1_distance FLOAT,
    top1_confidence FLOAT,
    top2_word_id INT,
    top2_distance FLOAT,
    top2_confidence FLOAT,
    recognized_tone VARCHAR(20),
    processing_time_ms INT,
    rtf FLOAT,
    is_rejected BOOLEAN DEFAULT FALSE,
    rejection_reason VARCHAR(255),
    manual_verification VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (top1_word_id) REFERENCES vocabulary(id),
    FOREIGN KEY (top1_template_id) REFERENCES templates(id),
    FOREIGN KEY (top2_word_id) REFERENCES vocabulary(id),
    INDEX idx_user_created (user_id, created_at),
    INDEX idx_confidence (top1_confidence),
    INDEX idx_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 声调分析表
CREATE TABLE tone_analysis (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sample_id BIGINT NOT NULL,
    tone_category VARCHAR(20),
    f0_mean FLOAT,
    f0_range FLOAT,
    f0_derivative FLOAT,
    f0_second_derivative FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sample_id) REFERENCES audio_samples(id),
    INDEX idx_sample_id (sample_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 统计数据表
CREATE TABLE statistics (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    stat_type VARCHAR(50),
    stat_value FLOAT,
    filter_word_length VARCHAR(20),
    filter_tone VARCHAR(20),
    sample_count INT,
    correct_count INT,
    accuracy_rate FLOAT,
    calculated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_stat_type (stat_type),
    INDEX idx_calculated (calculated_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 插入初始发音人数据
INSERT INTO speakers (speaker_id, name, age, gender, dialect_background, phonetic_quality) VALUES
('S1', '发音人1', 40, 'M', '贵州毕节', '优秀'),
('S2', '发音人2', 35, 'F', '贵州毕节', '优秀'),
('S3', '发音人3', 45, 'M', '贵州毕节', '优秀'),
('S4', '发音人4', 38, 'F', '贵州毕节', '优秀'),
('S5', '发音人5', 42, 'M', '贵州毕节', '优秀');

-- 插入初始词汇数据
-- 当前仓库默认仅提供少量示例词条，便于快速启动和验证流程。
-- 论文中的完整实验词表与语音样本需由使用者自行导入。
INSERT INTO vocabulary (word_id, word_text, pinyin, tone, category) VALUES
('W001', '祭祀', 'jìsì', 'b', 'cultural'),
('W002', '村落', 'cūnluò', 'x', 'cultural'),
('W003', '水井', 'shuǐjǐng', 'd', 'daily');

-- 创建视图：识别准确率统计
CREATE VIEW v_recognition_accuracy AS
SELECT
    DATE(created_at) as date,
    COUNT(*) as total_count,
    SUM(CASE WHEN top1_confidence >= 0.8 AND is_rejected = 0 THEN 1 ELSE 0 END) as correct_count,
    AVG(top1_confidence) as avg_confidence,
    AVG(processing_time_ms) as avg_processing_time
FROM recognition_results
GROUP BY DATE(created_at)
ORDER BY date DESC;

-- 创建视图：按声调的识别性能
CREATE VIEW v_tone_accuracy AS
SELECT
    v.tone,
    COUNT(rr.id) as total_samples,
    SUM(CASE WHEN rr.top1_confidence >= 0.8 THEN 1 ELSE 0 END) as correct_samples,
    ROUND(SUM(CASE WHEN rr.top1_confidence >= 0.8 THEN 1 ELSE 0 END) / COUNT(rr.id) * 100, 2) as accuracy_rate
FROM recognition_results rr
JOIN vocabulary v ON rr.top1_word_id = v.id
WHERE rr.is_rejected = 0
GROUP BY v.tone
ORDER BY accuracy_rate DESC;
