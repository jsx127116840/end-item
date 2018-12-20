package com.baizhi.serviceimpl;

import com.baizhi.entity.Banner;
import com.baizhi.entity.BannerPageDto;
import com.baizhi.mapper.BannerMapper;
import com.baizhi.service.BannerService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
@Transactional
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerMapper bannerMapper;
    
    @Override
    public BannerPageDto queryAllByPage(Integer page, Integer rows) {
        Integer offset = (page - 1) * rows;
        RowBounds rowBounds = new RowBounds(offset, rows);
        Example bannerExample = new Example(Banner.class);
        bannerExample.setOrderByClause("pub_date DESC");
        List<Banner> list = bannerMapper.selectByExampleAndRowBounds(bannerExample, rowBounds);
        
        Integer total = bannerMapper.selectCount(new Banner());
        BannerPageDto bannerPageDto = new BannerPageDto();
        bannerPageDto.setRows(list);
        bannerPageDto.setTotal(total);
        return bannerPageDto;
    }
    
    @Override
    public void addBanner(Banner banner) {
        bannerMapper.insert(banner);
    }
    
    @Override
    public void updateBanner(Banner banner) {
        bannerMapper.updateByPrimaryKey(banner);
    }
    
    @Override
    public void delBanner(Integer id) {
        
        bannerMapper.deleteByPrimaryKey(id);
    }
}
