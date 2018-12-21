package com.baizhi.service;

import com.baizhi.entity.Album;
import com.baizhi.entity.AlbumPageDto;
import com.baizhi.entity.Chapter;


public interface AlbumService {
    public AlbumPageDto queryAllByPage(Integer page, Integer rows);
    
    public Album getAlbumById(Integer id);
    
    public void insertAlbum(Album album);
    
    public void insertChapter(Chapter chapter);
    
}
