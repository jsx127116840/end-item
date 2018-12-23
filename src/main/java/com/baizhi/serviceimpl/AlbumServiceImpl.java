package com.baizhi.serviceimpl;

import com.baizhi.entity.Album;
import com.baizhi.entity.AlbumPageDto;
import com.baizhi.entity.Chapter;
import com.baizhi.mapper.AlbumMapper;
import com.baizhi.mapper.ChapterMapper;
import com.baizhi.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    private AlbumMapper albumMapper;
    @Autowired
    private ChapterMapper chapterMapper;
    
    @Override
    public AlbumPageDto queryAllByPage(Integer page, Integer rows) {
        List<Album> list = albumMapper.selectAlbumByPage(page, rows);
        for (Album album : list) {
            System.out.println(album);
        }
        Integer total = albumMapper.selectCount(new Album());
        AlbumPageDto albumPageDto = new AlbumPageDto();
        albumPageDto.setRows(list);
        albumPageDto.setTotal(total);
        
        return albumPageDto;
    }
    
    @Override
    public Album getAlbumById(Integer id) {
        Album album = albumMapper.selectByPrimaryKey(id);
        return album;
    }
    
    @Override
    public void insertAlbum(Album album) {
        albumMapper.insert(album);
    }
    
    @Override
    public void insertChapter(Chapter chapter) {
        chapterMapper.insert(chapter);
    }
}
