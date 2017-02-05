var wsocket;
var msg;
var loginUserId;
function connect(loginUserId) {
			wsocket = new SockJS(
					"http://192.168.0.8:8181/pas/conSocket.sockjs");
			this.loginUserId = loginUserId;
			wsocket.onopen = onOpen;
			wsocket.onmessage = onMessage;
			wsocket.onclose = onClose;
	}
	
	function disconnect() {
		wsocket.close();
	}
	
	function onOpen(evt) {
		send(loginUserId);
		onMessage(evt);
	}
	
	function onMessage(evt) {
		var data = evt.data;
		alert("꺼저");
	}
	function onClose(evt) {
		appendMessage("연결을 끊었습니다.");
	}
	
	function send(msg) {
		wsocket.send(msg);
		onMessage(evt);
	}

	function appendMessage(msg) {
		$("#chatMessageArea").append(msg+"<br>");
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);
	}
	
	/*$(document).ready(function() {
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				send();	
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function() { send(); });
		$('#enterBtn').click(function() { connect(); });
		$('#exitBtn').click(function() { disconnect(); });
		$('#pushBtn').click(function(){push();});
		
	});*/