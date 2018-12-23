package com.baizhi.controller;


import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

@Controller
@RequestMapping("/file")
public class DownloadController {
    
    // 文件下载
    @RequestMapping("/download")
    public void filedownload(String fname, HttpSession session, HttpServletResponse response) throws IOException {
        // 获取server端文件的 字节数组
        String realPath = "D:/Java/ideaworkspace/end-item/src/main/webapp/main/yinpin";
        File srcFile = new File(realPath + "/" + fname);
        byte[] bs = FileUtils.readFileToByteArray(srcFile);
        
        // 设置响应头信息，以附件的形式下载
        response.setHeader("content-disposition", "attchment;filename=" + URLEncoder.encode(fname, "utf-8"));
        
        // 使用响应输出流，往client输出文件内容
        ServletOutputStream sos = response.getOutputStream();
        sos.write(bs);
    }
}
