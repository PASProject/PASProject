package com.app.pas.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ProjSessionInterceptor extends HandlerInterceptorAdapter {
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
		
		if(request.getSession().getAttribute("joinProj") == null){ 
		   response.sendRedirect("/pas/index");
		 
		     
			
	}
		
		}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		if(request.getAttribute("proj_Num")!=request.getSession().getAttribute("joinProj")){
			System.out.println(request.getAttribute("proj_Num")+"파파팟!@@@@");
			response.sendRedirect("/pas/index");
		}
	}
	
	
	
}
