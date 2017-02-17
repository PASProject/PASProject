package com.app.pas.commons.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.pas.dto.MemberVo;

public class LoginSessionFilter implements Filter {

	/* private FilterConfig filterConfig; */
	private List<String> whiteList;
	private List<String> staticResourceList;

	public LoginSessionFilter() {
		whiteList = new ArrayList<String>();
		whiteList.add("/pas/index");
		whiteList.add("/pas/main/loginForm");

		staticResourceList = new ArrayList<String>();
		staticResourceList.add("/resource/");
	}

	@Override
	public void init(FilterConfig filterconfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();

		String uri = req.getRequestURI();
		/*
		 * if(!whiteList.contains(uri)){ boolean isURIResourceFile=false;
		 * 
		 * 
		 * for(String staticResource:staticResourceList){
		 * if(uri.startsWith(staticResource)){ isURIResourceFile=true; break;
		 * 
		 * } }
		 * 
		 * if(!isURIResourceFile){ HttpSession session = req.getSession();
		 * 
		 * MemberVo member =(MemberVo)session.getAttribute("loginUser");
		 * if(member ==null){ HttpServletResponse res = (HttpServletResponse)
		 * response; res.sendRedirect("/pas/index"); return; } }
		 * 
		 * }
		 */

		System.out.println(uri + "유알아이!");

		int proj_Num = 1;
		int proj_NumN = 1;

		MemberVo member = (MemberVo) session.getAttribute("loginUser");

		if (request.getParameter("proj_Num") == null) {

		} else {
			proj_NumN = Integer.parseInt(request.getParameter("proj_Num"));

		}

		if (session.getAttribute("joinProj") == null) {
            proj_Num=proj_NumN;
		} else {
			proj_Num = Integer.parseInt((String) session
					.getAttribute("joinProj"));
		}
		System.out.println(proj_NumN+"옵니다!");

		System.out.println(proj_Num + "갑니다!!!");

		if (member == null || proj_Num != proj_NumN) {
			res.sendRedirect("/pas/index");
			return;
		} else {
			chain.doFilter(req, res);
		}

		chain.doFilter(req, res);
	}

	@Override
	public void destroy() {

	}

}
