package com.baizhi.controller;


import com.baizhi.entity.Album;
import com.baizhi.entity.AlbumPageDto;
import com.baizhi.entity.Chapter;
import com.baizhi.service.AlbumService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;

@RestController
@RequestMapping("/album")
public class AlbumController {
    @Autowired
    private AlbumService albumService;
    
    @RequestMapping("/showAllAlbum")
    public AlbumPageDto showAllAlbum(Integer page, Integer rows) {
        AlbumPageDto albumPageDto = albumService.queryAllByPage(page, rows);
        return albumPageDto;
    }
    
    @RequestMapping("/getAlbumById")
    public Album getAlbumById(Integer id) {
        Album album = albumService.getAlbumById(id);
        return album;
    }
    
    @RequestMapping("/addAlbum")
    public String addAlbum(Album album, HttpSession hs, MultipartFile al) throws IOException {
        
        
        String realPath = "D:/Java/ideaworkspace/end-item/src/main/webapp/main/zhuanji";
        Date date = new Date();
        String path = upload(date, realPath, al);
        String ipath = "/main/zhuanji/" + path;
        album.setCover_img(ipath);
        album.setPub_date(date);
        albumService.insertAlbum(album);
        return "addAlbumOk";
    }
    
    
    @RequestMapping("/addChapter")
    public String addChapter(Chapter chapter, HttpSession hs, MultipartFile ch) throws IOException {
        
        
        String realPath = "D:/Java/ideaworkspace/end-item/src/main/webapp/main/yinpin";
        Date date = new Date();
        String path = upload(date, realPath, ch);
        String ipath = "/main/yinpin/" + path;
        chapter.setUrl(ipath);
        chapter.setUpload_date(date);
        
        return "addChapterOk";
    }
    
    
    public String upload(Date date, String realPath, MultipartFile multipartFile) throws IOException {
        
        String path = date.getTime() + "-" + multipartFile.getOriginalFilename();
        File file = new File(realPath + "/" + path);
        multipartFile.transferTo(file);
        return path;
    }
    
    @RequestMapping("/download")
    public void filedownload(String fname, HttpSession session, HttpServletResponse response) throws IOException {
        // 获取server端文件的 字节数组
        String realPath = "D:/Java/ideaworkspace/end-item/src/main/webapp/main/yinpin";
        File srcFile = new File(realPath + "/" + fname);
        byte[] bs = FileUtils.readFileToByteArray(srcFile);
        
        // 设置响应头信息，以附件的形式下载
        response.setHeader("content-disposition", "attchment;filename=" + URLEncoder.encode(fname, "utf-8"));
        
        // 使用响应输出流，往client输出文件内容
        ServletOutputStream sos = response.getOutputStream();
        sos.write(bs);
    }
}
