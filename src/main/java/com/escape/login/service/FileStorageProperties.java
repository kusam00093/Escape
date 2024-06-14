package com.escape.login.service;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

// FileStorageProperties클래스는 절대경로 설정위해 사용됨
// 즉 application.properties에 "file.upload-dir=src/main/resources/static/images/"
// 이 부분은 오직 실제 파일을 저장할 경로를 설정하기 위해서 필요한 것임
// 그외 프로그램내에서 사용되는 상대경로(filePath)와는 전혀 무관함 


@Component
@ConfigurationProperties(prefix = "file")
public class FileStorageProperties {
    private String uploadDir;

    public String getUploadDir() {
        return uploadDir;
    }

    public void setUploadDir(String uploadDir) {
        this.uploadDir = uploadDir;
    }
}