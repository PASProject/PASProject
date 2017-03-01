var wsocket;
var msg;
var loginUserId;
function connectSpreadSheet() {
			sheetWsocket = new SockJS(
					"http://"+document.domain+":8181/pas/spreadSheetSocket.sockjs");
			sheetWsocket.onopen = onOpenSpreadSheet;
			sheetWsocket.onmessage = onMessageSpreadSheet;
			sheetWsocket.onclose = onCloseSpreadSheet;
	}
	
	function disconnect() {
		sheatWsocket.close();
	}
	
	function onOpenSpreadSheet(evt) {
		/*var a = $('sessionScope.loginUser.mem_Name');*/
		/*alert("ㅋ");*/
		/*$('#joinMemberZone').html("<a>ㅇㅇㅇ</a>");*/
	}
	
	function onMessageSpreadSheet(evt) {
		
		
		var spreadsheetModal = $("#fullBody").data("kendoSpreadsheet");
		var spreadsheet = $("#spreadsheet").data("kendoSpreadsheet");
		if(spreadsheetModal!=null){
			var sheetModal = spreadsheetModal.activeSheet();
			sheetModal.fromJSON(JSON.parse(evt.data));
		}else if(spreadsheet!=null){
			var sheet = spreadsheet.activeSheet();
			sheet.fromJSON(JSON.parse(evt.data));
		}
         
	}
	
	function onCloseSpreadSheet(evt) {
		
	}
	
	function sendSpreadSheet(msg) {
		sheatWsocket.send(msg);
	}

