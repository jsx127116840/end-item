package com.baizhi.service;

import javax.servlet.http.HttpSession;

public interface AdminService {
    public Boolean getAdminByName(String name, String password, HttpSession hs);
}
