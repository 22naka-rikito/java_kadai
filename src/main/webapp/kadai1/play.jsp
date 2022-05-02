<%@page import="util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 残数の更新処理(残数の取得、更新、保存など)    
int startNum = 1;
int stoneNum = 1;
char player = 65;
int playerNum = 2;
String kigou = request.getParameter("moji");

if (session.getAttribute("totalNum") == null) {
	String startNumStr = request.getParameter("startNum");
	if(!Utility.isNullOrEmpty(startNumStr)){
		startNum = Integer.parseInt(startNumStr);
	}
	session.setAttribute("totalNum", startNum);
}

if (session.getAttribute("stoneNum") == null){
	String stoneNumStr = request.getParameter("stoneNum");
	if(!Utility.isNullOrEmpty(stoneNumStr)){
		stoneNum = Integer.parseInt(stoneNumStr);
	}
	session.setAttribute("stoneNum", stoneNum);
}
stoneNum = (int)session.getAttribute("stoneNum");

if (session.getAttribute("playerNum") == null) {
	String playerNumStr = request.getParameter("playerNum");
	if(!Utility.isNullOrEmpty(playerNumStr)){
		playerNum = Integer.parseInt(playerNumStr);
	}
	session.setAttribute("playerNum", playerNum);
}

if (session.getAttribute("player") == null) {
	session.setAttribute("player", '@');
}

if (session.getAttribute("moji") == null) {
	if(Utility.isNullOrEmpty(kigou)){
		kigou = "●";
	}
	session.setAttribute("moji", kigou);
}else{
	kigou = (String)session.getAttribute("moji");
}


int totalNum =(int)session.getAttribute("totalNum"); // 残数用の変数。仮で25をセットしている。必要に応じて変更
String numStr = request.getParameter("num");
int num = 0;
if(!Utility.isNullOrEmpty(numStr)){
	num = Integer.parseInt(numStr);
}

totalNum -= num;
session.setAttribute("totalNum", totalNum);

// プレイヤーの切替処理(プレイヤーの取得、切替、保存など)
// String player = (String)session.getAttribute("player"); // プレイヤー用の変数。仮で"A"をセットしている。必要に応じて変更
player = (char)session.getAttribute("player");
playerNum = (int)session.getAttribute("playerNum");

// 残数が0以下の場合、結果ページへ遷移
if(totalNum <= 0){
	response.sendRedirect("finish.jsp");
}else{
	if(player < 64 + playerNum){
		player += 1;
	}else{
		player = 65;
	}
	session.setAttribute("player", player);
}
// (responseオブジェクトのsendRedirectメソッドを使用する)
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
			残り：<%= totalNum %>個
		</h2>
		<p class="stone">
			<%
			// todo:このprint分は仮の処理。実装が完了したら削除する。
			// 表示する文字列("●●～")をメソッドを使い取得し、取得した文字列を表示する
			String stone = Utility.getStoneDisplayHtml(totalNum,kigou);
			out.println(stone);
			%>
		</p>
	</div>
	<div class="info">
		<h2>
			プレイヤー<%= player %>の番
		</h2>

		<form action="play.jsp">
			<p>
				石を 
				<% 
					out.println("<input type=\"number\" name=\"num\" min=\"1\" max=\"" + stoneNum + "\">");
				%> 個取る<br>
				※1度に3個取れます。
			</p>
			<button class="btn" type="submit">決定</button>
		</form>
	</div>
</body>
</html>