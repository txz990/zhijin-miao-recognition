package com.lunwen;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

/**
 * 织金苗语语音识别系统启动类
 * 基于DTW模板匹配的小词表语音识别
 */
@SpringBootApplication
@EnableAsync
public class ZhijinMiaoApplication {

    public static void main(String[] args) {
        SpringApplication.run(ZhijinMiaoApplication.class, args);
        System.out.println("========================================");
        System.out.println("织金苗语语音识别系统已启动");
        System.out.println("访问入口: http://localhost:8080/");
        System.out.println("识别接口: http://localhost:8080/recognition/recognize");
        System.out.println("========================================");
    }

}
