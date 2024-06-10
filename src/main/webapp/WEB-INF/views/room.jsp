<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Room</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #007BFF;
			border-left: 3px solid #007BFF;
			margin-bottom: 20px;
		}
		.roomContainer{
			background-color: #F6F6F6;
			width: 500px;
			height: 500px;
			overflow: auto;
			border-radius :10px;
			
		}
		.roomList{
			border: none;
		}
		.roomList th{
			border: 1px solid #007BFF;
			background-color: #fff;
			color: #007BFF;
		}
		.roomList td{
			border: 1px solid #007BFF;
			background-color: #fff;
			text-align: left;
			color: black;
		}
		.roomList .num{
			width: 75px;
			text-align: center;
		}
		.roomList .room{
			width: 350px;
		}
		.roomList .go{
			width: 71px;
			text-align: center;
		}
		button{
			/*background-color: #007BFF;*/
			background-color: white;
			font-size: 14px;
			color : black;
			/*border: 1px solid #000;*/
			border: none;
			border-radius: 5px;
			padding: 10px 10px;
			margin: 3px;
			transition: box-shadow 0.3s;
		}
		button:hover {
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2); /* 호버시 음영 효과를 추가합니다. */
  background-color: #ADD8E6;
}
		
		.inputTable th{
			padding: 3px;
		}
		.inputTable input{
			width: 330px;
			height: 25px;
		}
		.room {
			border-radius :10px;
		 }
		.go {
			border-radius :10px;
		}
		.num {
			border-radius :10px;
			padding : 5px;
		}
		#roomName {
			border-radius :10px;
		}
		#createRoom {
			border-radius : 5px;
			padding : 6px;
			border : none;
			background-color : #007BFF;
			color : white;
		}
	</style>
</head>

<script type="text/javascript">
	var ws;
	window.onload = function(){
		getRoom();
		createRoom();
	}

	function getRoom(){
		commonAjax('/getRoom', "", 'post', function(result){
			console.log('result',result);
			createChatingRoom(result);
		});
	}
	
	function createRoom(){
		$("#createRoom").click(function(){
			var msg = {	roomName : $('#roomName').val()	};

			commonAjax('/createRoom', msg, 'post', function(result){
				createChatingRoom(result);
			});

			$("#roomName").val("");
		});
	}

	function goRoom(number, name){
		location.href="/moveChating?roomName="+name+"&"+"roomNumber="+number;
	}

	function createChatingRoom(res){
		if(res != null){
			var tag = "<tr><th class='num'>순서</th><th class='room'>방 이름</th><th class='go'></th></tr>";
			res.forEach(function(d, idx){
				var rn = d.roomName.trim();
				var roomNumber = d.roomNumber;
				tag += "<tr>"+
							"<td class='num'>"+(idx+1)+"</td>"+
							"<td class='room'>"+ rn +"</td>"+
							"<td class='go'><button type='button' onclick='goRoom(\""+roomNumber+"\", \""+rn+"\")'>참여</button></td>" +
						"</tr>";	
			});
			$("#roomList").empty().append(tag);
		}
	}

	function commonAjax(url, parameter, type, calbak, contentType){
		$.ajax({
			url: url,
			data: parameter,
			type: type,
			contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function (res) {
				calbak(res);
			},
			error : function(err){
				console.log('error');
				console.log('res');
				calbak(err);
			}
		});
	}
</script>
<body>
	<div class="container">
		<h1>채팅방</h1>
		<div id="roomContainer" class="roomContainer">
			<table id="roomList" class="roomList"></table>
		</div>
		<div>
			<table class="inputTable">
				<tr>
					<th>방제목</th>
					<th><input type="text" name="roomName" id="roomName"></th>
					<th><button id="createRoom">방 만들기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>