package com.sys.lawyer.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

public class SavePhotoUtils {

    public static String saveFile(MultipartFile files, HttpServletRequest request) {
        String filePath = "";
        String fileNmae = "";
        if (!files.isEmpty()) {
            try {
                filePath = request.getRealPath("/resource/upload/");
                File f = new File(filePath);
                if (!f.exists()) {
                    f.mkdirs();
                }
                fileNmae = UUIDUtils.random() + files.getOriginalFilename().replaceAll(" ", "").replace("(", "").replace(")", "");
                File file = new File(filePath + fileNmae);
                if (!file.exists()) {
                    file.createNewFile();
                }
                files.transferTo(file);
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("上传出错");
            }
        }
        return fileNmae;
    }
}
