package com.baizhi.serviceimpl;

import com.baizhi.entity.Admin;
import com.baizhi.mapper.AdminMapper;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.http.HttpSession;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    
    @Override
    public Boolean getAdminByName(String name, String password, HttpSession hs) {
        Example adminExample = new Example(Admin.class);
        adminExample.createCriteria().andEqualTo("name", name);
        Admin admin = adminMapper.selectOneByExample(adminExample);
        if (admin == null) {
            return null;
        } else if (!admin.getPassword().equals(password)) {
            return false;
        } else {
            hs.setAttribute("checkLogin", admin);
            return true;
        }
    }
}
