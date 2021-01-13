package com.nk.util;

import java.util.HashMap;
import java.util.Map;
/**
 * @author ningkun
 * @date 2021/01/05
 * 封装返回消息
 */
public class Msg {
	private int code;  //处理状态代码 101成功 102失败
	private String msg;
	private Map<String,Object> data=new HashMap<String, Object>();

	public static Msg success() {
		Msg msg=new Msg();
		msg.setCode(101);
		msg.setMsg("成功");
		return msg;
	}
	public static Msg fail() {
		Msg msg=new Msg();
		msg.setCode(102);
		msg.setMsg("失败");
		return msg;
	}

	public static Msg faillogin() {
		Msg msg=new Msg();
		msg.setCode(103);
		msg.setMsg("无权限账号");
		return msg;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}
	
	public Msg add(String key,Object value) {
		this.getData().put(key, value);
		return this;
	}
	
}
