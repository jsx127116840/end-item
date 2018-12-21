package com.baizhi.mapper;

import com.baizhi.entity.Album;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface AlbumMapper extends Mapper<Album> {
    /**
     * 分页表连接
     */
    public List<Album> selectAlbumByPage(@Param("page") Integer page, @Param("rows") Integer rows);
}
