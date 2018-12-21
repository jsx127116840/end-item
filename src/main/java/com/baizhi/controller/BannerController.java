package com.baizhi.controller;


import com.baizhi.entity.Banner;
import com.baizhi.entity.BannerPageDto;
import com.baizhi.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;


@RestController
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;
    
    @RequestMapping("/showBanner")
    public BannerPageDto showBanner(Integer page, Integer rows) {
        BannerPageDto bannerPageDto = bannerService.queryAllByPage(page, rows);
        return bannerPageDto;
        
    }
    
    @RequestMapping("/deleteBanner")
    public String deleteBanner(Integer id) {
        bannerService.delBanner(id);
        return "ok";
    }
    
    @RequestMapping("/addBanner")
    public String addBanner(Banner banner, HttpSession hs, MultipartFile mf) throws IOException {
        
        
        String realPath = "D:/Java/ideaworkspace/end-item/src/main/webapp/main/shouye";
        Date date = new Date();
        String path = date.getTime() + "-" + mf.getOriginalFilename();
        File file = new File(realPath + "/" + path);
        mf.transferTo(file);
    
    
        String ipath = "/main/shouye/" + path;
        banner.setImg_path(ipath);
        banner.setPub_date(date);
        bannerService.addBanner(banner);
        return "ok";
    }
    
    @RequestMapping("/updateBanner")
    public String updateBanner(Banner banner) {
        
        bannerService.updateBanner(banner);
        return "ok";
    }
}
