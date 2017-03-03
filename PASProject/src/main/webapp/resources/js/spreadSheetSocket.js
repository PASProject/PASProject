var sheetWsocket;
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
		sheetWsocket.close();
	}
	
	function onOpenSpreadSheet(evt) {
//		var joinUser = $('sessionScope.loginUser');
//		$('#joinMemberZone').html("<span id ='"+joinUser.mem_Email+"'><img src = '/pas/resources/upload/'"+joinUser.mem_Img+"'> [ joinUser.mem_Name ] </span>");
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
		var joinUser = $('sessionScope.loginUser.mem_Name');
		$("span#"+joinUser.mem_Email).remove();
	}
	
	function sendSpreadSheet(msg) {
		sheetWsocket.send(msg);
	}
