package com.mall.controller;

import cn.hutool.core.date.DateUtil;
import com.google.common.collect.Maps;
import com.mall.service.ItemService;
import com.mall.utils.UploadUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Api("文件上传控制类")
@Controller
public class FileController {
    @Autowired
    private ItemService itemService;

    @RequestMapping("/upload")
    @ApiOperation("文件上传")
    @ResponseBody
    public Map<String, Object> upload(MultipartFile mf) {
        //1.得到文件名
        final String oldName = mf.getOriginalFilename();
        //2.根据文件名生成新的文件名
        String newName = UploadUtils.createNewFileName(oldName);
        //3.得到当前日期的字符串
        String dirName = DateUtil.format(new Date(), "yyyy-MM");
        //4.构造文件夹
        File dirFile = new File(UploadUtils.UPLOAD_PATH, dirName);
        //5.判断当前文件是否存在
        if (!dirFile.exists()) {
            dirFile.mkdirs();//创建文件夹
        }
        //6.构造文件对象
        File file = new File(dirFile, newName);
        //7.把mf里面的图片信息写入file
        try {
            mf.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Map<String, Object> map = new HashMap<>();
        map.put("path", dirName + "/" + newName);
        return map;
    }

    /**
     * 图片下载
     */
    @RequestMapping("/showImageByPath")
    @ApiOperation("文件下载")
    public ResponseEntity<Object> showImageByPath(String path) {
        return UploadUtils.createResponseEntity(path);
    }
}
