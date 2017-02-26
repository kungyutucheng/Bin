package com.bin.model;

public class Img {

	private String small;
	private String big;
	public String getSmall() {
		return small;
	}
	public void setSmall(String small) {
		this.small = small;
	}
	public String getBig() {
		return big;
	}
	public void setBig(String big) {
		this.big = big;
	}
	@Override
	public String toString() {
		return "Img [small=" + small + ", big=" + big + "]";
	}
	
}
