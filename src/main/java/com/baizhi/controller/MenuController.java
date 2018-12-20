package com.baizhi.controller;

import com.baizhi.entity.Menu;
import com.baizhi.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private MenuService menuService;
    
    @RequestMapping("/getFatherMenu")
    public List<Menu> getFatherMenu() {
        List<Menu> list = menuService.getFatherMenu();
        return list;
    }
    
    @RequestMapping("/getSonMenuByParent_id")
    public List<Menu> getSonMenuByParent_id(Integer parent_id) {
        List<Menu> list = menuService.getSonMenuByParent_id(parent_id);
        return list;
    }
}
