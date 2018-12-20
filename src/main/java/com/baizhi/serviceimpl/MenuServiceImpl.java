package com.baizhi.serviceimpl;

import com.baizhi.entity.Menu;
import com.baizhi.mapper.MenuMapper;
import com.baizhi.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;


@Service
@Transactional
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;
    
    @Override
    public List<Menu> getFatherMenu() {
        Example menuExample = new Example(Menu.class);
        menuExample.createCriteria().andIsNull("parent_id");
        List<Menu> list = menuMapper.selectByExample(menuExample);
        return list;
    }
    
    @Override
    public List<Menu> getSonMenuByParent_id(Integer parent_id) {
        Example menuExample = new Example(Menu.class);
        menuExample.createCriteria().andEqualTo("parent_id", parent_id);
        List<Menu> list = menuMapper.selectByExample(menuExample);
        return list;
    }
}
