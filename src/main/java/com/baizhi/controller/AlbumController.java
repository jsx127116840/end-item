package com.baizhi.controller;


import com.baizhi.entity.Album;
import com.baizhi.entity.AlbumPageDto;
import com.baizhi.entity.Chapter;
import com.baizhi.service.AlbumService;
import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.exceptions.CannotReadException;
import org.jaudiotagger.audio.exceptions.InvalidAudioFrameException;
import org.jaudiotagger.audio.exceptions.ReadOnlyFileException;
import org.jaudiotagger.audio.mp3.MP3AudioHeader;
import org.jaudiotagger.audio.mp3.MP3File;
import org.jaudiotagger.tag.TagException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
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
        String ipath = path;
        album.setCover_img(ipath);
        album.setPub_date(date);
        albumService.insertAlbum(album);
        return "addAlbumOk";
    }
    
    
    @RequestMapping("/addChapter")
    public String addChapter(Chapter chapter, HttpSession hs, MultipartFile ch) throws IOException, ReadOnlyFileException, TagException, InvalidAudioFrameException, CannotReadException {
        
        
        String realPath = "D:/Java/ideaworkspace/end-item/src/main/webapp/main/yinpin";
        Date date = new Date();
        String path = upload(date, realPath, ch);
        String ipath = path;
        double size = filesize(realPath + "/" + path);
        String duration = filetime(realPath + "/" + path);
        chapter.setDuration(duration);
        chapter.setSize(size);
        chapter.setUrl(ipath);
        chapter.setUpload_date(date);
    
    
        albumService.insertChapter(chapter);
        return "addChapterOk";
    }
    
    
    public String upload(Date date, String realPath, MultipartFile multipartFile) throws IOException {
        
        String path = date.getTime() + "-" + multipartFile.getOriginalFilename();
        File file = new File(realPath + "/" + path);
        multipartFile.transferTo(file);
        return path;
    }
    
    public Double filesize(String path) {
        
        File file = new File(path);
        double size = (double) file.length();
        return size;
    }
    
    public String filetime(String path) throws TagException, ReadOnlyFileException, CannotReadException, InvalidAudioFrameException, IOException {
        File file = new File(path);
        MP3File f = (MP3File) AudioFileIO.read(file);
        MP3AudioHeader audioHeader = (MP3AudioHeader) f.getAudioHeader();
        String trackLengthAsString = audioHeader.getTrackLengthAsString();
        return trackLengthAsString;
        
    }
}
