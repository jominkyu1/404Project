package net.store.project.api;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Component
public class ImageHandler {
    public static final String FILE_DIR = "src/main/webapp/itemimages/";

    public String upload(MultipartFile multipartFile) {
        //현재날짜를 기준으로 폴더경로 생성
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String currentDate = dateFormat.format(new Date());
        String uploadDir = FILE_DIR + currentDate;

        // 업로드한 파일명(ex:: apple.jpg)
        String originalFilename = multipartFile.getOriginalFilename();

        try{
            File dir = new File(uploadDir);
            //경로가 없다면 경로 생성
            if(!dir.exists()) {
                dir.mkdir();
            }

            // 파일명을 랜덤파일명으로 변경 ex) apple.jpg -> UUID.jpg
            String randomFilename = makeRandom(originalFilename);

            // 프로젝트의 webapp/itemimages/오늘날짜/랜덤파일명.jpg으로 경로설정
            String fullPath = uploadDir + "/" + randomFilename;
            Path path = Paths.get(fullPath);
            // 프로젝트 경로에 저장
            multipartFile.transferTo(path);
            
            // DB에 저장될 날짜/랜덤파일명.jpg 리턴
            return currentDate + "/" + randomFilename;
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("이미지 저장 실패");
        }
    }

    /**
     * 확장자 분리 메소드
     * ex) apple.jpg ----> jpg
     * */
    private String extractExt(String originalFilename){
        int index = originalFilename.lastIndexOf(".");
        return originalFilename.substring(index+1);
    }

    /**
     * 파일명 랜덤하게 변경
     * ex) apple.jpg -> 12lk12sadqwe.jpg
     * */
    private String makeRandom(String originalFilename){
        //확장자(ex:: jpg)
        String ext = extractExt(originalFilename);
        String name = UUID.randomUUID().toString();
        return name + "." + ext;
    }
}


