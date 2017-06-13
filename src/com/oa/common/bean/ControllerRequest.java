package com.oa.common.bean;

public class ControllerRequest {
	private int code;
	private String request;
	private String message;
	
	public ControllerRequest(){
		
	}
	
	public ControllerRequest(int code, String request, String message){
		this.code = code;
		this.request = request;
		this.message = message;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public static ControllerRequest getSuccessRequest(String message){
		return new ControllerRequest(200,"success",message);
	}
	
	public static ControllerRequest getFailRequest(String message){
		return new ControllerRequest(500,"fail",message);
	}
	
}
