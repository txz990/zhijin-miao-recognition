# CLAUDE.md

This file provides guidance to coding assistants working in this repository.

## Project Overview

Java Spring Boot implementation of a Zhijin Miao small-vocabulary speech recognition system based on DTW template matching.

- Project: Zhijin Miao Speech Recognition System
- Thesis topic: 基于DTW模板匹配的织金苗语小词表语音识别系统
- Tech stack: Java 11, Spring Boot 2.7, MySQL 8
- Repository status: runnable baseline system with demo data

## What Is Implemented

- WAV file recognition
- VAD endpoint detection
- 39-dimension MFCC extraction
- DTW matching
- rejection decision
- recognition history
- basic template rebuild endpoints

## What Is Not Bundled By Default

- full thesis dataset
- thesis experiment scripts
- HMM comparison experiments
- noise robustness experiments
- speaker-dependent vs speaker-independent evaluation pipeline

For those differences, refer to:

- [README.md](README.md)
- [docs/仓库与论文差异说明.md](docs/仓库与论文差异说明.md)

## Quick Start

```bash
mysql -u root -p < src/main/resources/schema.sql
mvn clean install
mvn spring-boot:run
```

Default URL: `http://localhost:8080`

## API

Preferred endpoints:

- `POST /recognition/recognize`
- `GET /recognition/statistics`
- `GET /recognition/history`

Template management:

- `POST /templates/rebuild/sample/{audioSampleId}`
- `POST /templates/rebuild/vocabulary/{vocabularyId}`
- `GET /templates/statistics`

Compatibility note:

- legacy `/api/v1/recognition/...` routes are still accepted

## Data Initialization

`src/main/resources/schema.sql` contains demo initialization only:

- 5 speakers
- 3 vocabulary entries

No full thesis corpus is included in the repository by default.

## Important Rule

Keep documentation and UI wording aligned with the current runnable system rather than thesis-only claims.
