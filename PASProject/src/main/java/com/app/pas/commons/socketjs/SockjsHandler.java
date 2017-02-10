package com.app.pas.commons.socketjs;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.PongMessage;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;


public class SockjsHandler extends TextWebSocketHandler{
	private Map<String,WebSocketSession> users= new ConcurrentHashMap<String, WebSocketSession>();
	
	/*@Override
	public void handleMessage(WebSocketSession session,
			WebSocketMessage<?> message) throws Exception {
		System.out.println("handleMessage 호출");
		System.out.println(message.getPayload().toString()+" @@@@@@@@@@@@@@@@@@@@@@");
		if(message.equals(null)) return;
		
		System.out.println(message.getPayload().toString().length());
			if(message.getPayload().toString().contains("push")){
				String pushMessage = message.getPayload().toString().substring(5);
					session = users.get(pushMessage);
					session.sendMessage(message);
			}
			
	}*/
	   
	@Override
	protected void handlePongMessage(WebSocketSession session,
			PongMessage message) throws Exception {
		System.out.println("PongMessage 호출");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session,
			@RequestBody TextMessage message) throws Exception {
/*		System.out.println(message.getPayload());
	      Gson gson = new Gson();
	      Map<String,Object> map = new HashMap<String,Object>();
	      map = (Map<String,Object>) gson.fromJson(message.getPayload().toString(), map.getClass());
	      System.out.println(map.get("push")+"@@@@@@@@@@@@ 푸쉬시수시ㅜ시ㅜ시ㅜ시ㅜ시ㅜ시ㅜ시ㅟㅜ시ㅜ");*/
	  }

	@Override
	public boolean supportsPartialMessages() {
		// TODO Auto-generated method stub
		return super.supportsPartialMessages();
	}
	
	@Override
	   public void afterConnectionEstablished(WebSocketSession session)
	         throws Exception {
	      System.out.println("@@@@@@@@@@@@@@@@@@@@서버 구축후 @@@@@@@@@@@@@@@");
	      System.out.println(session.getId());
	      System.out.println(session.getUri());
	      System.out.println(session.getLocalAddress());
	      System.out.println(session.getRemoteAddress());
	      
	      Map<String, Object> attributes= session.getAttributes();
			String loginUserEmail = (String) attributes.get("loginUserEmail");
			users.put(loginUserEmail, session);
	   }
	@Override
	public void afterConnectionClosed(WebSocketSession session,
			CloseStatus status) throws Exception {
		/*users.put(session.getId(), session);*/
		Map<String,Object> attributes =session.getAttributes();
		String loginUserEmail = (String) attributes.get("loginUserEmail");
		users.remove(loginUserEmail);
		System.out.println("연결 종료호출");
		
	}

	private void pushMessage(WebSocketSession session) throws IOException{
	}
	@Override
	public void handleTransportError(WebSocketSession session,
			Throwable exception) throws Exception {
		System.out.println("에러호출");
	}

}
