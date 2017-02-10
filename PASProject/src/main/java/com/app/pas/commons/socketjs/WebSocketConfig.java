package com.app.pas.commons.socketjs;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;


public class WebSocketConfig/* implements WebSocketConfigurer*/ {

/*	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(new SockjsHandler(), "/conSocket.sockjs")
			.addInterceptors(new SockjsHandshakeInterceptor())
			.setHandshakeHandler(new SockjsHandshakeHandler()).withSockJS();
	}*/

}
