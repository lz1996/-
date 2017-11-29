package com.hellozhu.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	private String userid; 
	private String password;
	public String check(){
		if("1@1".equals(userid)&&"1".equals(password)){
			return "true";
		}
		ActionContext context=ActionContext.getContext();
		Map<String,Object> s1=context.getSession();
		s1.put("error", "error");
		return "false";
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
