package com.bin.databinder.helper;

import java.util.List;

import com.bin.model.GoodProperties;

public class GoodPropertiesListForm {

	private List<GoodProperties> goodProperties;

	public List<GoodProperties> getGoodProperties() {
		return goodProperties;
	}

	public void setGoodProperties(List<GoodProperties> goodProperties) {
		this.goodProperties = goodProperties;
	}

	@Override
	public String toString() {
		return "GoodPropertiesListForm [goodProperties=" + goodProperties + "]";
	}
	
}
