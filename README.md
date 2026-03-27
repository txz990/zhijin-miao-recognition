# 织金苗语语音识别系统 - 快速开始

## 项目概述

基于**DTW（动态时间规整）模板匹配**的织金苗语小词表语音识别系统。

| 项目 | 说明 |
|------|------|
| **论文题目** | 基于DTW模板匹配的织金苗语小词表语音识别系统 |
| **学生** | 杨飞萍 |
| **指导老师** | 姜玥（副教授） |
| **大学** | 西南民族大学 |
| **学院** | 计算机与人工智能学院 |
| **技术** | Java 11 + Spring Boot 2.7 + MySQL 8.0+ |
| **仓库状态** | 可运行的基础识别系统与演示数据 |

## 环境要求

- **JDK 11+**
- **Maven 3.6+**
- **MySQL 8.0+**

⭐ **无需Python** - 系统使用纯Java实现！

## 快速开始

### 1. 初始化数据库
```bash
mysql -u root -p < src/main/resources/schema.sql
```

### 2. 配置数据库连接
编辑 `src/main/resources/application.yml`，修改MySQL连接信息

### 3. 编译运行
```bash
mvn clean install
mvn spring-boot:run
```

应用启动于 `http://localhost:8080`

## 当前仓库说明

- 当前仓库默认只包含**示例级初始化数据**，用于演示系统结构和基础流程。
- `schema.sql` 只预置了 `5` 名发音人和 `3` 条示例词汇，不等同于论文中的完整实验语料规模。
- 论文中出现的 `50词/200条语音`、`200词/490样本`、`94.7%`、`450ms`、`RTF 0.53` 等数字，属于论文实验或方案文档中的研究结果，**当前仓库默认不保证可直接复现**。
- 当前仓库已实现的核心能力包括：音频上传识别、VAD + MFCC 特征提取、DTW 模板匹配、拒识、历史记录、基础模板重建。

## API示例

### 语音识别
```bash
curl -X POST http://localhost:8080/recognition/recognize \
  -F "audio=@test_audio.wav"
```

### 获取统计信息
```bash
curl http://localhost:8080/recognition/statistics
```

### 获取识别历史
```bash
curl http://localhost:8080/recognition/history
```

说明：
- 当前统一接口前缀为 `/recognition`
- 为兼容旧文档，后端同时保留 `/api/v1/recognition` 访问方式

### 重建单个样本模板
```bash
curl -X POST http://localhost:8080/templates/rebuild/sample/1
```

## 项目结构

```
zhijin-miao-recognition/
├── pom.xml                               # Maven配置
├── README.md                             # 本文件
├── CLAUDE.md                             # 开发指南
├── src/main/java/com/lunwen/
│   ├── service/
│   │   ├── MFCCFeatureExtractionService.java  ⭐ MFCC特征提取（Java）
│   │   ├── DTWMatchingService.java            ⭐ DTW算法（Java）
│   │   └── RecognitionService.java            ⭐ 识别引擎
│   ├── controller/                       # REST API
│   ├── entity/                           # 数据模型
│   ├── repository/                       # 数据访问层
│   └── util/                             # 工具类
├── src/main/resources/
│   ├── application.yml                   # Spring配置
│   └── schema.sql                        # 数据库初始化
└── docs/
    └── Java纯实现方案.md                 # 📖 完整文档（必读）
```

## 核心模块

### MFCC特征提取 (MFCCFeatureExtractionService)
- 从WAV音频提取39维特征向量
- 包括预加重、分帧、FFT、梅尔滤波、DCT、差分

### DTW匹配 (DTWMatchingService)
- Sakoe-Chiba带约束的动态时间规整算法
- 路径长度归一化
- 置信度计算

### 识别引擎 (RecognitionService)
- 集成MFCC和DTW
- 模板库匹配
- 结果存储和统计

## 数据库设计

**8张表 + 2个视图**：

| 表名 | 初始状态 | 说明 |
|------|------|------|
| vocabulary | 3条示例数据 | 词汇表 |
| speakers | 5条示例数据 | 发音人 |
| audio_samples | 需自行导入 | 语音样本 |
| templates | 需构建生成 | 识别模板 |
| recognition_results | 运行后产生 | 识别结果日志 |
| users | 空表 | 用户管理 |
| statistics | 空表 | 统计数据 |
| tone_analysis | 空表 | 声调分析 |

## 实验与性能说明

- 论文中的性能指标属于研究实验结果，不是当前仓库初始化后即可得到的默认运行结果。
- 当前仓库未内置完整实验语料、HMM 对比实验代码、噪声鲁棒性评测脚本、说话人相关/无关评估脚本。
- 如需做论文级复现，建议单独准备完整语料、实验划分脚本和评测脚本。

## 常见问题

**Q: 如何修改MFCC参数？**
- 编辑 `MFCCFeatureExtractionService` 中的常量

**Q: 识别准确率低怎么办？**
- 检查音频格式（16kHz, 16bit WAV）
- 验证模板库是否正确构建
- 参考 `docs/Java纯实现方案.md` 中的故障排除章节

**Q: 如何增加识别词条？**
- 向 `vocabulary` 表添加记录
- 向 `audio_samples` 表添加音频
- 重新构建模板库

**Q: 为什么论文数据规模和仓库初始化数据不一致？**
- 因为仓库默认提供的是可运行演示数据，不是论文完整实验语料。
- 详细说明见 `docs/仓库与论文差异说明.md`

## 完整文档

📖 **所有详细信息请参考**: `docs/Java纯实现方案.md`

包含：
- 完整API文档
- 数据库设计详情
- 故障排除指南
- 性能优化方案
- 开发者指南

补充说明：
- [docs/仓库与论文差异说明.md](docs/仓库与论文差异说明.md)

## 运行项目

```bash
cd zhijin-miao-recognition

# 开发模式
mvn spring-boot:run

# 生产部署
mvn clean package
java -Xmx512M -Xms256M -jar target/zhijin-miao-recognition-1.0.0-SNAPSHOT.jar
```

## 许可证

MIT License
