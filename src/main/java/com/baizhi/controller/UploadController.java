package com.baizhi.controller;

import com.baizhi.entity.Banner;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;


@RestController

public class UploadController {
    @RequestMapping("/upload")
    public String upload(HttpSession hs, MultipartFile mf) throws IllegalStateException, IOException {
        String realPath = "D:/Java/ideaworkspace/end-item/src/main/webapp/main/shouye";
        Banner banner = new Banner();
        Date date = new Date();
        String path = date.getTime() + "-" + mf.getOriginalFilename();
        File file = new File(realPath + "/" + path);
        mf.transferTo(file);
        banner.setImg_path("/main/shouye/" + path);
        hs.setAttribute("ibanner", banner);
        return "ok";
    }
}
