package com.hk.project.movie.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileDownloadController {

	@RequestMapping(value = "/fileDownload")
    public void fileDownload(HttpServletRequest request,HttpServletResponse response) throws Exception {
        //String path =  request.getSession().getServletContext().getRealPath("저장경로");
        
		String POSTER_IMAGE_REPO = "c:\\poster_image";
		String posterName = request.getParameter("posterName");
		String mid = request.getParameter("mid");
		
		OutputStream out = response.getOutputStream();
		//파일경로
		String path = POSTER_IMAGE_REPO +"\\"+mid+"\\"+posterName;
		File poster = new File(path);
		
	//파일 다운로드
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment;fileName"+posterName);
			
		FileInputStream in = new FileInputStream(poster);
		
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count== -1) 
				break;
			out.write(buffer,0,count);	
		}
		in.close();
		out.close();
    }
}
