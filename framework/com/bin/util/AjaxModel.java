package com.bin.util;

public class AjaxModel {

	private String msg = "error";
	private Integer code;
	private Boolean success = true;
	private Object data;
	
	public AjaxModel(){
		this.success = true;
	}
	
	public AjaxModel(Boolean success){
		this.success = success;
	}
	
	public AjaxModel(String msg, Integer code, Boolean success, Object data) {
		super();
		this.msg = msg;
		this.code = code;
		this.success = success;
		this.data = data;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "AjaxModel [msg=" + msg + ", code=" + code + ", success=" + success + ", data=" + data + "]";
	}
	
	
}