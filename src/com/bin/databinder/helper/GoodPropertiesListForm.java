package com.bin.databinder.helper;

import java.util.List;

import com.bin.model.GoodProperty;

public class GoodPropertiesListForm {

	private List<GoodProperty> goodProperties;

	public List<GoodProperty> getGoodProperties() {
		return goodProperties;
	}

	public void setGoodProperties(List<GoodProperty> goodProperties) {
		this.goodProperties = goodProperties;
	}

	@Override
	public String toString() {
		return "GoodPropertiesListForm [goodProperties=" + goodProperties + "]";
	}
	
}
