package com.app.pas.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.app.pas.dto.MemberVo;
import com.app.pas.dto.ProjectLogVo;
import com.app.pas.service.ProjectLogService;

public class WorkListInterceptor extends HandlerInterceptorAdapter{
	private ProjectLogService projectLogService;
	
	public void setProjectLogService(ProjectLogService projectLogService) {
		this.projectLogService = projectLogService;
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	/*	HttpSession session = request.getSession();
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 파월 인터셉터");
		
		if(session.getAttribute("joinDocNum")==""||session.getAttribute("joinDocNum")==null){
			System.out.println("없다");
		}else{
			System.out.println("있다");
			System.out.println(session.getAttribute("joinDocNum"));
		}*/
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		return super.preHandle(request, response, handler);
	}

}
