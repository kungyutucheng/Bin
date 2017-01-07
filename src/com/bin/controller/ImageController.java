package com.bin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bin.base.BaseController;
import com.bin.config.PropertyPlaceholderConfig;

@Controller
@RequestMapping(value = "/image")
@Import(PropertyPlaceholderConfig.class)
public class ImageController extends BaseController{
	
	
	@Value("${file.upload.directory}")
	private String fileUploadDirectory;
	
	@RequestMapping(value = "/getImage/{name:.+}",method = RequestMethod.GET)
	public void getImage(@PathVariable("name") String name){
		File image = new File(fileUploadDirectory + File.separator + name);
		
		if(!image.exists()){
			image = new File(request.getSession().getServletContext().getRealPath("/")
					+ "img" + File.separator + "logo.png");
		}
		
		FileInputStream fileInputStream = null;
		OutputStream outputStream = null;
		try{
			fileInputStream = new FileInputStream(image);
			response.setContentType("image/jpeg");
			outputStream = response.getOutputStream();
			
			int count = 0;
			byte[] buffer = new byte[1024 * 8];
			while((count = fileInputStream.read(buffer)) != -1){
				outputStream.write(buffer, 0, count);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(fileInputStream != null)
					fileInputStream.close();
				if(outputStream != null)
					outputStream.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

}
