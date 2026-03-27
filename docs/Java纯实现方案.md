# Java纯实现方案指南

## 概述

本仓库实现的是一个基于 DTW 模板匹配的织金苗语小词表语音识别基础系统，使用 Java + Spring Boot + MySQL 构建。

当前仓库重点是：

- 提供可运行的基础识别流程
- 保持代码、页面、接口与文档一致
- 为后续论文级实验复现保留扩展入口

当前已实现能力：

- WAV 音频上传识别
- VAD 端点检测
- 39 维 MFCC 特征提取
- DTW 模板匹配
- 拒识机制
- 识别历史记录
- 基础模板重建

说明：

- 论文中的实验指标、完整语料规模和对比实验，不等同于当前仓库默认运行结果
- 详细差异请看 [仓库与论文差异说明.md](./仓库与论文差异说明.md)

---

## 项目结构

```text
zhijin-miao-recognition/
├── pom.xml
├── README.md
├── AGENTS.md
├── CLAUDE.md
├── src/main/java/com/lunwen/
│   ├── controller/
│   │   ├── RecognitionController.java
│   │   ├── TemplateController.java
│   │   └── WebController.java
│   ├── dto/
│   │   ├── RecognitionRequest.java
│   │   ├── RecognitionResponse.java
│   │   └── RecognitionHistoryItem.java
│   ├── entity/
│   ├── repository/
│   └── service/
│       ├── MFCCFeatureExtractionService.java
│       ├── DTWMatchingService.java
│       ├── RecognitionService.java
│       └── TemplateLibraryService.java
├── src/main/resources/
│   ├── application.yml
│   ├── schema.sql
│   └── templates/
└── docs/
    ├── Java纯实现方案.md
    └── 仓库与论文差异说明.md
```

---

## 核心模块

### 1. MFCC 特征提取

文件：

- `src/main/java/com/lunwen/service/MFCCFeatureExtractionService.java`

当前实现包含：

- 音频读取
- 预加重
- VAD 端点检测
- 分帧加窗
- 频谱计算
- Mel 滤波
- DCT
- 一阶差分和二阶差分

输出：

- `39` 维特征向量
- `13 MFCC + 13 Delta + 13 Delta-Delta`

默认参数：

| 参数 | 值 |
|------|------|
| SAMPLE_RATE | 16000 |
| FRAME_LENGTH | 400 |
| FRAME_SHIFT | 160 |
| N_MFCC | 13 |
| N_FILTERS | 40 |
| PRE_EMPHASIS | 0.97 |
| FFT_SIZE | 512 |

### 2. DTW 匹配

文件：

- `src/main/java/com/lunwen/service/DTWMatchingService.java`

当前实现包含：

- 欧氏距离
- Sakoe-Chiba 带约束
- 路径长度归一化
- 批量距离计算
- 基础置信度计算

### 3. 识别引擎

文件：

- `src/main/java/com/lunwen/service/RecognitionService.java`

当前识别流程：

1. 提取 MFCC 特征
2. 加载模板库
3. 计算 DTW 距离
4. 选取最优模板
5. 计算置信度
6. 执行拒识判断
7. 写入识别结果
8. 返回识别响应

### 4. 模板库管理

文件：

- `src/main/java/com/lunwen/service/TemplateLibraryService.java`

当前支持：

- 按单个语音样本重建模板
- 按词条批量重建模板
- 获取模板统计信息

说明：

- 当前是基础版模板管理
- 尚未实现论文中更完整的典型样本筛选、离群样本剔除、自学习更新

---

## 环境要求

| 组件 | 版本 |
|------|------|
| JDK | 11+ |
| Maven | 3.6+ |
| MySQL | 8.0+ |

---

## 构建与运行

### 初始化数据库

```bash
mysql -u root -p < src/main/resources/schema.sql
```

### 启动项目

```bash
mvn clean install
mvn spring-boot:run
```

默认访问地址：

- `http://localhost:8080`

---

## REST API

统一接口前缀：

- `/recognition`

兼容旧前缀：

- `/api/v1/recognition`

### 1. 语音识别

```bash
POST /recognition/recognize
Content-Type: multipart/form-data
```

请求字段：

- `audio`: WAV 文件

响应字段示例：

```json
{
  "wordId": "W001",
  "wordText": "祭祀",
  "pinyin": "jìsì",
  "tone": "b",
  "confidence": 0.82,
  "distance": 6.41,
  "processingTimeMs": 120,
  "rejected": false,
  "rejectionReason": null,
  "success": true,
  "message": "识别成功"
}
```

拒识时可能返回：

```json
{
  "wordId": null,
  "wordText": "未识别",
  "pinyin": null,
  "tone": null,
  "confidence": 0.06,
  "distance": 9.14,
  "processingTimeMs": 118,
  "rejected": true,
  "rejectionReason": "匹配距离过大且置信度偏低",
  "success": true,
  "message": "拒识"
}
```

### 2. 获取统计信息

```bash
GET /recognition/statistics
```

### 3. 获取识别历史

```bash
GET /recognition/history
```

### 4. 重建单个样本模板

```bash
POST /templates/rebuild/sample/{audioSampleId}
```

### 5. 按词条批量重建模板

```bash
POST /templates/rebuild/vocabulary/{vocabularyId}
```

### 6. 获取模板统计

```bash
GET /templates/statistics
```

---

## 数据库说明

数据库仍然采用 8 张表 + 2 个视图的结构：

- `users`
- `speakers`
- `vocabulary`
- `audio_samples`
- `templates`
- `recognition_results`
- `tone_analysis`
- `statistics`
- `v_recognition_accuracy`
- `v_tone_accuracy`

但当前初始化脚本只预置演示数据：

- `5` 名发音人
- `3` 条词汇

以下内容默认不内置：

- 完整 `audio_samples`
- 完整 `templates`
- 论文级实验数据

因此当前仓库默认更适合：

- 开发基础功能
- 联调接口
- 逐步导入真实语料

---

## 当前程序与论文的边界

程序已经覆盖的论文主线能力：

- VAD + MFCC 特征提取
- DTW 匹配
- 模板库识别
- 拒识机制
- 历史记录

程序尚未完整覆盖的论文扩展内容：

- HMM 对比实验
- 噪声鲁棒性实验
- 说话人相关 / 无关实验
- 论文级交叉验证流程
- 完整实验语料初始化
- 完整模板筛选与动态维护流程

---

## 常见问题

### 1. 为什么论文数据和仓库数据不一致？

因为仓库默认提供的是演示级初始化数据，不是论文完整实验数据。

### 2. 为什么文档里不再写固定准确率？

因为当前仓库没有内置完整实验语料和评测脚本，固定实验指标不应冒充默认运行结果。

### 3. 识别失败或被拒识怎么办？

- 检查 WAV 格式是否正确
- 检查模板库是否已经构建
- 检查音频是否过短、过噪
- 检查 `templates` 表是否为空

### 4. 如何增加词条？

1. 向 `vocabulary` 表增加记录
2. 导入对应 `audio_samples`
3. 调用模板重建接口生成模板

---

## 后续扩展建议

建议按这个顺序继续推进：

1. 导入完整语料
2. 补模板筛选逻辑
3. 增加实验划分与评测脚本
4. 增加噪声鲁棒性评测
5. 增加说话人相关 / 无关评测
6. 如有需要，再补 HMM 对比基线

---

## 最后说明

当前文档以“当前程序真实状态”为准，不再把论文实验结果直接写成仓库默认能力。
