package com.aaa.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author WCX
 * @data 2020/3/21 10:48
 * @describe
 */
public class FileUpLoadUtil {
    public static String upload(MultipartFile multipartFile,String targetPath) throws IOException {
        if (!multipartFile.isEmpty()){
            //获取存放文件的绝对路径
            String path =targetPath;
            //获取原始的文件名
            String oName=multipartFile.getOriginalFilename();
            //重新定义文件名
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
            String newName = simpleDateFormat.format(new Date());
            //组合后新的文件名
            String newFileName=newName+oName.substring(oName.lastIndexOf("."));
            //目标文件对象
            File targetFile=new File(path,newFileName);
            if (targetFile.getParentFile().exists()){
                targetFile.mkdir();
            }
            multipartFile.transferTo(targetFile);
            return newFileName;
        }
        return null;
    }
}
