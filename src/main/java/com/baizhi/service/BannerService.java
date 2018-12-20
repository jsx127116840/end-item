package com.baizhi.service;


import com.baizhi.entity.Banner;
import com.baizhi.entity.BannerPageDto;

public interface BannerService {
    /**
     * 分页查
     */
    public BannerPageDto queryAllByPage(Integer page, Integer rows);
    
    public void addBanner(Banner banner);
    
    public void updateBanner(Banner banner);
    
    public void delBanner(Integer id);
}
