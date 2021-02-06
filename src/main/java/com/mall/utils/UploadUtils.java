package com.mall.utils;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class UploadUtils {
    //设置上传地址
    public static String UPLOAD_PATH = "D:/upload/";
    {
        final InputStream stream = this.getClass().getResourceAsStream("file.properties");
        Properties properties = new Properties();
        try {
            properties.load(stream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        final String property = properties.getProperty("filepath");
        if (property != null) {
            UPLOAD_PATH = property;
        }
    }

    /**
     * 根据老名字得到新名字
     * @param oldName
     * @return
     */
    public static String createNewFileName(String oldName) {
        String stuff = oldName.substring(oldName.lastIndexOf("."), oldName.length());
        return IdUtil.simpleUUID().toUpperCase() + stuff;
    }

    /**
     * 文件下载
     * @param path
     * @return
     */
    public static ResponseEntity<Object> createResponseEntity(String path) {
        //1.构造文件对象
        File file = new File(UPLOAD_PATH, path);
        if (file.exists()) {
            byte[] bytes = null;
            FileUtil.readBytes(file);
            //创建封装响应头信息的对象
            HttpHeaders header = new HttpHeaders();
            //封装响应内容类型
            header.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            //设置下载的文件名称
            header.setContentDispositionFormData("attachment", "");
            //创建ResponseEntity对象
            ResponseEntity<Object> entity = new ResponseEntity<>(bytes, header, HttpStatus.CREATED);
        }
        return null;

    }
}
