package com.baizhi.service;

import com.baizhi.entity.Menu;

import java.util.List;

public interface MenuService {
    public List<Menu> getFatherMenu();
    
    public List<Menu> getSonMenuByParent_id(Integer parent_id);
}
