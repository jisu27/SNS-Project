<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
  <title>WebSocket Chat</title>
  <script type="text/javascript">
    var socket = new WebSocket("ws://localhost:8080/chatTest");
    socket.onopen = function() {
      alert("WebSocket connected");
    };
    socket.onmessage = function(event) {
      document.getElementById("chatlog").innerHTML += event.data + "<br>";
    };
    socket.onclose = function() {
      alert("WebSocket disconnected");
    };
    function sendMessage() {
      var message = document.getElementById("message").value;
      socket.send(message);
      document.getElementById("message").value = "";
    }
  </script>
</head>
<body>
  <h1>WebSocket Chat</h1>
  <div id="chatlog"></div>
  <input type="text" id="message">
  <button onclick="sendMessage()">Send</button>
</body>
</html>
<!-- 
<spring:url value="/chat/privateChat" var="privateChatUrl"/>
<spring:url value="/chat/roomChat" var="roomChatUrl"/>
<spring:url value="/chat/deleteChat" var="deleteChatUrl"/>

<h3>Insert Private Chat</h3>
<form action="" method="post">
	<label>id1:</label>
	<input type="text" name="id1"/><br>
	<label>id2:</label>
	<input type="text" name="id2"/><br>
	<label>text:</label>
	<input type="text" name="text"/><br>
	<input type="submit" value="Insert"/>
</form>
<h3><a href="insertChatRoom">New ChatRoom</a></h3>
<p><p>
<h3><a href="getChatRoom">Enter ChatRoom</a></h3>
<h3>Delete Chat</h3>
<form action="" method="post">
	<label>chatSeq:</label>
	<input type="text" name="chatSeq"/><br>
	<input type="submit" value="Delete"/>
</form>
<h3>Get Private Chat List</h3>
<form action="" method="get">
	<label>id1:</label>
	<input type="text" name="id1"/><br>
	<label>id2:</label>
	<input type="text" name="id2"/><br>
	<input type="submit" value="Get"/>
</form>
<h3>Get Room Chat List</h3>
<form action="" method="get">
	<label>chatRoomSeq:</label>
	<input type="text" name="chatRoomSeq"/><br>
	<input type="submit" value="Get"/>
	-->
</form>
</body>
</html>