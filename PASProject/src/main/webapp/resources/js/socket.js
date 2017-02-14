var wsocket;
var msg;
var loginUserId;
function connect(loginUserId) {
			wsocket = new SockJS(
<<<<<<< HEAD
					"http://192.168.0.8:8181/pas/conSocket.sockjs");
=======
					"http://"+document.domain+":8181/pas/conSocket.sockjs");
>>>>>>> branch 'master' of https://github.com/PASProject/PASProject.git
			this.loginUserId = loginUserId;
			wsocket.onopen = onOpen;
			wsocket.onmessage = onMessage;
			wsocket.onclose = onClose;
	}
	
	function disconnect() {
		wsocket.close();
	}
	
	function onOpen(evt) {
		
	}
	
	function onMessage(evt) {
		alert(evt);
		alert(evt.data);
		var d = JSON.parse(evt.data);
		alert(d.push);
		var data = evt.data;
<<<<<<< HEAD
		alert("꺼저");
=======
		alert('꺼저');
>>>>>>> branch 'master' of https://github.com/PASProject/PASProject.git
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