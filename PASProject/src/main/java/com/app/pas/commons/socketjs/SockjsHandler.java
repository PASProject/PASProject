package com.app.pas.commons.socketjs;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.log4j.Logger;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.PongMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class SockjsHandler extends TextWebSocketHandler{
	private Map<String,WebSocketSession> users= new ConcurrentHashMap<String, WebSocketSession>();
	
	@Override
	public void handleMessage(WebSocketSession session,
			WebSocketMessage<?> message) throws Exception {
		System.out.println("handleMessage 호출");
		String userid;
		
		System.out.println(message.getPayload().toString()+" @@@@@@@@@@@@@@@@@@@@@@");
		if(message.equals(null)) return;
		System.out.println(message.getPayload().toString().length());
			if(message.getPayload().toString().contains("init")&& message.getPayload().toString().length()>6){
				userid = message.getPayload().toString().substring(5);
				System.out.println(userid);
				users.put(userid,session);
			}else if(message.getPayload().toString().contains("push")){
				String pushMessage = message.getPayload().toString().substring(5);
					session = users.get(pushMessage);
					session.sendMessage(message);
			}
	}
	   
	@Override
	protected void handlePongMessage(WebSocketSession session,
			PongMessage message) throws Exception {
		System.out.println("PongMessage 호출");
	}
	
	@Override
	public boolean supportsPartialMessages() {
		// TODO Auto-generated method stub
		return super.supportsPartialMessages();
	}
	
	@Override
	   public void afterConnectionEstablished(WebSocketSession session)
	         throws Exception {
	      users.put(session.getId(), session);
	      System.out.println("@@@@@@@@@@@@@@@@@@@@서버 구축후 @@@@@@@@@@@@@@@");
	      System.out.println(session.getId());
	      System.out.println(session.getUri());
	      System.out.println(session.getLocalAddress());
	      System.out.println(session.getRemoteAddress());
	   }
	@Override
	public void afterConnectionClosed(WebSocketSession session,
			CloseStatus status) throws Exception {
		/*users.put(session.getId(), session);*/
		
		System.out.println("연결 종료호출");
		
	}


	/*@Override
	protected void handleTextMessage(WebSocketSession session,
			TextMessage message) throws Exception {
		for(WebSocketSession s : users.values()){
			s.sendMessage(message);
			System.out.println(message);
		}
		System.out.println("메시지호출");
	}*/
	private void pushMessage(WebSocketSession session) throws IOException{
	}
	@Override
	public void handleTransportError(WebSocketSession session,
			Throwable exception) throws Exception {
		System.out.println("에러호출");
	}

}
