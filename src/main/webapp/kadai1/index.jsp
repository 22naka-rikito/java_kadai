<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//セッションクリア
session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java基礎課題</title>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
	<h1>石取りゲーム</h1>

	<div class="info">
		<h2>条件</h2>
		<form action="play.jsp">
			<p>
				石の総数：<span><input type="number" min=1 name="startNum">個</span>
			</p>
			<p>
				1度に取れる石の数：<span><input type="number" min=1 name="stoneNum"></span>
			</p>

			<p>
				プレイヤーの数：<span><input type="number" min=1 max=26 name="playerNum"></span>
			</p>

			<p>
				石の記号：<span><input type="text" maxlength=1 name="moji"></span>
			</p>


			<button class="btn" type="submit">始める</button>
		</form>
	</div>
</body>
</html>