<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Chating</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
  .container {
    width: 500px;
    margin: 0 auto;
    padding: 25px;
    background-color: #f5f5f5;
    border-radius: 20px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
  }

  /* 채팅창 제목 스타일 */
  .container h1 {
    text-align: left;
    padding: 10px;
    color: #007bff;
    border-bottom: 2px solid #007bff;
    margin-bottom: 20px;
    font-size: 20px;
  }

  /* 채팅창 스타일 */
  .chating {
    background-color: #ffffff;
    width: 100%;
    height: 400px;
    overflow-y: auto;
    border-radius: 20px;
    padding: 10px;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
  }

  /* 나의 메시지 스타일 */
  .chating .me {
    color: #007bff;
    text-align: right;
    margin-bottom: 5px;
  }

  /* 상대방 메시지 스타일 */
  .chating .others {
    color: #333;
    text-align: left;
    margin-bottom: 5px;
  }

  .input-container {
  margin-top: 20px; /* 입력창과 메시지창 사이의 간격 조절 */
  padding: 10px;
  border-radius: 20px; /* 입력창과 메시지창을 둥글게 만듦 */
  background-color: #f0f0f0; /* 배경색 추가 */
  display: flex; /* 입력창과 버튼을 가로로 배치 */
  align-items: center; /* 수직 가운데 정렬 */
}

.input-container input {
  flex: 2; /* 입력창을 최대한 넓게 설정 */
  height: 30px;
  padding: 5px;
  border: none;
  border-radius: 20px; /* 둥글게 만듦 */
  outline: none; /* 포커스 효과 제거 */
}

.input-container button {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 8px 15px;
  border-radius: 20px; /* 둥글게 만듦 */
  margin-left: 10px; /* 버튼과 입력창 사이의 간격 조절 */
  cursor: pointer;
}

.input-container button:hover {
  background-color: #0056b3; /* 호버 색상 변경 */
}
	
#chatting {
  width: 300px; /* 입력창의 너비를 조절 */
  height: 40px; /* 입력창의 높이를 조절 */
  padding: 10px; /* 입력창의 내부 여백을 추가 */
  border-radius: 20px; /* 입력창을 둥글게 만듦 */
  border: none; /* 입력창의 테두리를 제거 */
  outline: none; /* 포커스 효과 제거 */
  margin-left : 10px;
}	
#userName {
	margin-left : 10px;
}
		
	</style>
</head>

<script type="text/javascript">
	var ws;

	function wsOpen(){
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomNumber").val());
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'>나 :" + d.msg + "</p>");	
					}else{
						$("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}

	function send() {
		var option ={
			type: "message",
			roomNumber: $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
</script>
<body>
	<div id="container" class="container">
		<h1>${roomName}의 채팅방</h1>
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="roomNumber" value="${roomNumber}">
		
		<div id="chating" class="chating">
		</div>
		
		<div id="yourName" class="input-container">
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<th><input type="text" name="userName" id="userName"></th>
					<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg" class="input-container">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>


			</table>
		</div>
	</div>
</body>
</html>