package com.bin.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bin.base.BaseController;
import com.bin.config.PropertyPlaceholderConfig;
import com.bin.dao.ImageDao;
import com.bin.model.Image;

@Controller
@RequestMapping(value = "/image")
@Import(PropertyPlaceholderConfig.class)
public class ImageController extends BaseController{
	
	@Autowired
	private ImageDao imageDao;
	
	@Value("${file.upload.directory}")
	private String fileUploadDirectory;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	@ResponseBody
	public Map list(){
		List<Image> images = imageDao.list();
		for(Image image : images){
			image.setUrl("/Bin/image/pictrue" + image.getId());
			image.setThumbnailUrl("/Bin/image/thumbnail/" + image.getId());
			image.setDeleteUrl("/Bin/image/delete/" + image.getId());
			image.setDeleteType("DELETE");
		}
		Map<String, Object> files = new HashMap<String, Object>();
		files.put("files", images);
		return files;
	}
	
	@RequestMapping(value = "/upload",method = RequestMethod.POST)
	@ResponseBody
	public Map upload(MultipartHttpServletRequest request,HttpServletResponse response){
		Iterator<String> iterable = request.getFileNames();
		MultipartFile multipartFile;
		List<Image> list = new LinkedList<Image>();
		
		while(iterable.hasNext()){
			multipartFile = request.getFile(iterable.next());
			
			String newFilenameBase = UUID.randomUUID().toString();
			String originalFileExtension = multipartFile.getOriginalFilename();
			String newFilename = newFilenameBase + originalFileExtension;
			String storageDirectory = fileUploadDirectory;
			String contentType  = multipartFile.getContentType();
			
			File file = new File(storageDirectory + "/" + newFilename);
			try{
				multipartFile.transferTo(file);
				
				BufferedImage thumbnail = Scalr.resize(ImageIO.read(file), 290);
				String thumbnailFilename = newFilenameBase + "-thumbnail.png";
				File thumbnailFile = new File(storageDirectory + "/" + thumbnailFilename);
				ImageIO.write(thumbnail, "png", thumbnailFile);
				
				Image image = new Image();
				image.setName(multipartFile.getOriginalFilename());
				image.setThumbnailFilename(thumbnailFilename);
				image.setNewFilename(newFilename);
				image.setContentType(contentType);
				image.setSize(multipartFile.getSize());
				image.setThumbnailSize(thumbnailFile.length());
				image = imageDao.create(image);
				
				image.setUrl("/Bin/image/picture/" + image.getId());
				image.setThumbnailUrl("/Bin/image/thumbnail/" + image.getId());
				image.setDeleteUrl("/Bin/image/delete/" + image.getId());
				image.setDeleteType("DELETE");
				
				list.add(image);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		Map<String, Object> files = new HashMap<String,Object>();
		files.put("files", list);
		return files;
	}
	
	@RequestMapping(value = "/thumbnail/{id}",method = RequestMethod.GET)
	public void Thumbnail(HttpServletResponse response,@PathVariable Long id){
		Image image = imageDao.get(id);
		File imageFile = new File(fileUploadDirectory + "/" + image.getThumbnailFilename());
		response.setContentType(image.getContentType());
		response.setContentLength(image.getThumbnailSize().intValue());
		try{
			InputStream is = new FileInputStream(imageFile);
			IOUtils.copy(is, response.getOutputStream());
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value = "/delete/{id}",method = RequestMethod.DELETE)
	public List delete(@PathVariable Long id){
		Image image = imageDao.get(id);
		File imageFile = new File(fileUploadDirectory + "/" + image.getNewFilename());
		imageFile.delete();
		File thumbnailFile = new File(fileUploadDirectory + "/" + image.getThumbnailFilename());
		thumbnailFile.delete();
		imageDao.delete(image);
		List< Map<String, Object>> results = new ArrayList<>();
		Map<String, Object> success = new HashMap<>();
		success.put("success", true);
		results.add(success);
		return results;
	}

}
