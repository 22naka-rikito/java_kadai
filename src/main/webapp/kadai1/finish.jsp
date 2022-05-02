<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// セッションからプレイヤー名を取得する
char player = (char) session.getAttribute("player");
int playerNum = (int)session.getAttribute("playerNum");
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
		<h2>
			<%
			if(playerNum > 2){
				out.println("敗者：プレイヤー");
			}else{
				if(player == 65){
					player = 66;
				}else{
					player = 65;
				}
				out.println("勝者：プレイヤー");
			}
			%>
			<%=player%>！！
		</h2>
		<form action="index.jsp">
			<button class="btn" type="submit">先頭に戻る</button>
		</form>
	</div>
</body>
</html>