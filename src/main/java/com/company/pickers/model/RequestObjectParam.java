package com.company.pickers.model;

public class RequestObjectParam<T>{
	private String key;
	private T data;

	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}


}
