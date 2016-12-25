package com.bin.dao;

import java.util.List;

import com.bin.model.Image;

public interface ImageDao {
public List<Image> list();
    
    public Image create(Image image);
    
    public Image get(Long id);
    
    public void delete(Image image);
}
