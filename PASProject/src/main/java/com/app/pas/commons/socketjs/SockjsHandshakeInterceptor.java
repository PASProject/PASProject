package com.app.pas.commons.socketjs;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Component
public class SockjsHandshakeInterceptor extends HttpSessionHandshakeInterceptor{
	
/*	private HttpSession getSession(ServerHttpRequest request) {
		if (request instanceof ServletServerHttpRequest) {
			ServletServerHttpRequest serverRequest = (ServletServerHttpRequest) request;
			return serverRequest.getServletRequest().getSession(false);
		}
		return null;
	}*/
	
	@Override
	public void afterHandshake(ServerHttpRequest request,
			ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		System.out.println("after");
		super.afterHandshake(request, response, wsHandler, ex);
	}

	@Override
	public boolean beforeHandshake(ServerHttpRequest request,
			ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		ServletServerHttpRequest serverRequest = (ServletServerHttpRequest) request;
		HttpSession session = serverRequest.getServletRequest().getSession();
		
		System.out.println("befor"+attributes);
        System.out.println("URI:"+request.getURI());
        System.out.println(session.getAttribute("loginUser")+"세선@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		attributes.put("a", "비포 클래스");
		
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}

}