package com.escape.login.service;

import java.io.IOException;
import java.nio.file.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.Files;

@Service
public class SellerService {

    private final Path fileStorageLocation;
    private final String basePath;
    
 // FileStorageProperties클래스는 절대경로 설정하기 위해 사용됨.
 // 즉 application.properties에 "file.upload-dir= src/main/resources/static/images/" 이것은 곧 basePath 임
 // 즉 절대경로는 오직 실제 파일을 저장할 경로를 설정하기 위해서만 필요한 것임
    
 // 그외 프로그램내에서 사용되는 것은 상대경로(filePath)임 
    // uploaddir을 활용하여 만들어진 fileStorageLocation가 곧 절대경로임 (파일이름제외된) : D:\dev\springboot\Escape\src\main\resources\static\images
    // 즉 절대경로: fileStorageLocation: D:\dev\springboot\Escape\src\main\resources\static\images
    // 실제저장경로=절대경로+fileName = (targetLocation or storedFilePath)+fileName  : D:\dev\springboot\Escape\src\main\resources\static\images\dankkun.png
   
    // 상대경로: relativePath = filePath: images/20240512_074711.png (프로그램내에서 참조)
    
    @Autowired
    public SellerService(FileStorageProperties fileStorageProperties) {
        this.basePath = fileStorageProperties.getUploadDir();
        this.fileStorageLocation = Paths.get(basePath).toAbsolutePath().normalize();
        
        System.out.println("================basePath: " + basePath);            
        System.out.println("================fileStorageLocation(절대경로): " + fileStorageLocation);
        
        try {
            Files.createDirectories(this.fileStorageLocation);
        } catch (Exception ex) {
            throw new FileStorageException("Could not create the directory where the uploaded files will be stored.", ex);
        }
    }

    
    public String storeFile(MultipartFile file) {
        
    	String fileName = StringUtils.cleanPath(file.getOriginalFilename());
        System.out.println("=====fileName: " + fileName);
    	
        try {
            if (fileName.contains("..")) {
                throw new FileStorageException("Filename contains invalid path sequence " + fileName);
            }

            // 위 fileStorageProperties 절대경로와 fileName을 합쳐서 실제 저장경로를 생성함
            Path targetLocation = this.fileStorageLocation.resolve(fileName);
            
            System.out.println("=====targetLocation: " + targetLocation);

            // 실제저장경로로 저장!
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);

            // 상대 경로로 변환
            
            //실제 파일이 저장되는 경로
            String storedFilePath = targetLocation.toString();
            System.out.println("=====storedFilePath: " + storedFilePath);

            System.out.println("=====basePath.length(): " + basePath.length());            
            
            // 상대경로(프로그램상 img src=""
            String relativePath = storedFilePath.substring(51);
            System.out.println("=====relativePath: " + relativePath);
            
            return relativePath.replace("\\", "/"); // 윈도우 경로에서 슬래시 대체
            
        } catch (IOException ex) {
            throw new FileStorageException("Could not store file " + fileName + ". Please try again!", ex);
        }
    }
}