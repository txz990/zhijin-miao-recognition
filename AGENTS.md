# AGENTS.md

This file provides guidance to coding agents working in this repository.

## Project Overview

Java Spring Boot implementation of a Zhijin Miao small-vocabulary speech recognition system based on DTW template matching.

- Project: Zhijin Miao Speech Recognition System
- Thesis topic: 基于DTW模板匹配的织金苗语小词表语音识别系统
- Tech stack: Java 11, Spring Boot 2.7, MySQL 8
- Repository status: runnable baseline system with demo data

## Current Repository Scope

The repository currently implements:

- WAV upload recognition
- VAD endpoint detection
- 39-dimension MFCC extraction
- DTW template matching
- rejection handling
- recognition history
- basic template rebuild endpoints

The repository does not currently bundle the full thesis experiment assets. Thesis-scale dataset sizes, accuracy numbers, latency numbers, HMM comparisons, and noise-robustness experiments should not be treated as default repository guarantees.

See [README.md](README.md) and [docs/仓库与论文差异说明.md](docs/仓库与论文差异说明.md) for the current source of truth.

## Quick Start

### 1. Initialize Database

```bash
mysql -u root -p < src/main/resources/schema.sql
```

### 2. Configure Database

Edit `src/main/resources/application.yml` with local MySQL credentials.

### 3. Build and Run

```bash
mvn clean install
mvn spring-boot:run
```

Server default: `http://localhost:8080`

## API Conventions

Preferred API prefix:

- `/recognition/...`

Backward-compatible prefix still supported:

- `/api/v1/recognition/...`

Main endpoints:

- `POST /recognition/recognize`
- `GET /recognition/statistics`
- `GET /recognition/history`
- `POST /templates/rebuild/sample/{audioSampleId}`
- `POST /templates/rebuild/vocabulary/{vocabularyId}`
- `GET /templates/statistics`

## Data Notes

`schema.sql` initializes demo-scale data only:

- 5 speakers
- 3 vocabulary items
- no bundled full `audio_samples`
- templates must be built from imported samples

Do not assume thesis-scale data such as 200 words or 490 samples exists locally unless the user has imported it.

## Key Files

- `src/main/java/com/lunwen/service/MFCCFeatureExtractionService.java`
- `src/main/java/com/lunwen/service/DTWMatchingService.java`
- `src/main/java/com/lunwen/service/RecognitionService.java`
- `src/main/java/com/lunwen/service/TemplateLibraryService.java`
- `src/main/resources/schema.sql`

## Coding Notes

- Prefer keeping documentation aligned with current runnable code, not thesis claims.
- If you add or change endpoints, update `README.md` first.
- If you add experiment-only features, document them separately from baseline system behavior.
