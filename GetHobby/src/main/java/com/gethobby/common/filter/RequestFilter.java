package com.gethobby.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gethobby.common.ModifyRequestWrapper;

public class RequestFilter implements Filter{

	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("filter make");
	}
	
	public void doFilter(	ServletRequest request , 
											ServletResponse response , 
											FilterChain filterChain) 
										throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		ModifyRequestWrapper requestWrapper = null;
		
		try {
			requestWrapper = new ModifyRequestWrapper(req);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		filterChain.doFilter(requestWrapper, response);
		
	}

	public void destroy() {
	}

}