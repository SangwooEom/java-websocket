<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Web Socket Example</title>
	</head>
	<body>
		<form>
			<input id="textMessage" type="text" />
			<input onclick="sendMessage()" value="Send" type="button" />
			<input onclick="disconnect()" value="Disconnect" type="button" />
		</form>
		<br />
		<textarea id="messageTextArea" row="10" cols="50"></textarea>
		<script type="text/javascript">
			const websocket = new WebSocket("ws://localhost:8080/websocket")
			const messageTextArea = document.getElementById("messageTextArea");
			
			websocket.addEventListener("open", (message) => {
				messageTextArea.value += "Server connect...\n";
			});
			
			websocket.addEventListener("close", (message) => {
				messageTextArea.value += "Server Disconnected...\n";
			});
			
			websocket.addEventListener("error", (message) => {
				messageTextArea.value += "error...\n";
			})
			
			websocket.addEventListener("message", (message) => {
				messageTextArea.value += "Recieve From Server => " + message.data + "\n";
			})
			
			function sendMessage() {
				const message = document.getElementById("textMessage");
				messageTextArea.value += "Send to Server => " + message.value + "\n";
				websocket.send(message.value);
				message.value = "";
			}
			
			function disconnect() {
				websocket.close();
			}
		</script>
	</body>
</html>
