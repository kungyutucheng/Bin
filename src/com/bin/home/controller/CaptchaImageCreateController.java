package com.bin.home.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;

@Controller
public class CaptchaImageCreateController {

	private Producer producer;

	@Autowired
	public void setProducer(Producer producer) {
		this.producer = producer;
	}
	
	@RequestMapping(value = "/kaptcha.jpg")
	public ModelAndView handleRequest(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setDateHeader("Expires", 0);
		response.setHeader("Cache-control", "no-store,no-cache,must-revalidate");
		response.addHeader("Cache-control", "post-check=0,pre-check=0");
		response.setHeader("Pragma", "no-cache");
		
		response.setContentType("image/jpeg");
		
		String capText = producer.createText();
		
		request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
		
		BufferedImage bi = producer.createImage(capText);
		ServletOutputStream outputStream = response.getOutputStream();
		ImageIO.write(bi, "jpg", outputStream);
		try{
			outputStream.flush();
		}finally{
			outputStream.close();
		}
		return null;
	}
	
}
