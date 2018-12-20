package com.baizhi.controller;


import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    
    
    @RequestMapping("/checkLogin")
    public String checkLogin(String name, String password, String enCode, HttpSession hs, Model model) {
        String code = (String) hs.getAttribute("code");
        if (code.equals(enCode)) {
            Boolean status = adminService.getAdminByName(name, password, hs);
            if (status == null) {
                System.out.println("1");
                model.addAttribute("loginMessage", "该用户不存在");
                return "redirect:/login.jsp";
            } else if (!status) {
                System.out.println("2");
                model.addAttribute("loginMessage", "用户名或密码错误");
                return "redirect:/login.jsp";
            } else {
                System.out.println("3");
                System.out.println("ok--------------------");
                return "redirect:/main/main.jsp";
            }
        } else {
            System.out.println("4");
            model.addAttribute("loginMessage", "验证码错误");
            return "redirect:/login.jsp";
        }
    }
}
