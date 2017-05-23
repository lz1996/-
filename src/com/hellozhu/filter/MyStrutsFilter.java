package com.hellozhu.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

/*由于采用了struts框架，拦截器把（//*）所有请求的文件都做了处理，所以导致ueditor的很多功能无法用。
解决方法，自定义拦截器，让它在请求ueditor里面文件时不做处理。*/

public class MyStrutsFilter extends StrutsPrepareAndExecuteFilter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request =(HttpServletRequest) req;
		String url = request.getRequestURI();
		if(url.contains("/ueditor")){
		//System.out.println("使用自定义的过滤器");
		chain.doFilter(req, res);
		}else{
		//System.out.println("使用默认的过滤器");
		super.doFilter(req, res, chain);
		}
	}

	
}
