var wsocket;
var msg;
var loginUserId;
function connectSpreadSheet() {
			sheatWsocket = new SockJS(
					"http://"+document.domain+":8181/pas/spreadSheetSocket.sockjs");
			sheatWsocket.onopen = onOpenSpreadSheet;
			sheatWsocket.onmessage = onMessageSpreadSheet;
			sheatWsocket.onclose = onCloseSpreadSheet;
	}
	
	function disconnect() {
		sheatWsocket.close();
	}
	
	function onOpenSpreadSheet(evt) {
		/*var initData = {'doc_Num':}*/
		/*send()*/
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

