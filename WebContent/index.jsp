<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.TextStyle"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
LocalDate today = LocalDate.now();
LocalDate firstDayOfThisMonth = LocalDate.now().withDayOfMonth(1);
int firstDayWeekday = firstDayOfThisMonth.getDayOfWeek().getValue();
LocalDate lastDayOfThisMonth = LocalDate.now().withDayOfMonth(today.lengthOfMonth());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담일지</title>
<style type="text/css">
* { padding: 0; margin: 0; border: 0; }
html, body, #wrap { min-height: 100%; }

/* container */
#header { width: 100%; padding: 10px 0; background: #4cb8a4; text-align: center; color: #fff; }
#container_wrap { position: relative; width: 100%; min-height: 100%; }
#sidebar_left,
#sidebar_right {
	position: absolute;
	top: 0;
	width: 200px;
	height: 100%;
	padding: 30px;
	box-sizing: border-box;
}
#sidebar_left { left: 0; }
#sidebar_right { right: 0; }
#contents_print { margin: 0 200px; padding: 30px; box-sizing: border-box; border-left: 1px solid #ddd; border-right: 1px solid #ddd; }
</style>
</head>
<body>
<div id="wrap">
	<div id="header">
		<%@include file="./menu/top.jsp"%>
	</div>
	<div id="container_wrap">
		<div id="sidebar_left">
			<%@include file="./menu/left.jsp"%>
		</div>
		<div id="sidebar_right">
			<%@include file="./menu/right.jsp"%>
		</div>
		<div id="contents_print">
			<br>
			<font size="20">첫화면</font>
			<h1>헤더1</h1>
			<h2>헤더2</h2>
			<h3>헤더3</h3>
			<h4>헤더4</h4>
		</div>
	</div>
</div>
</body>
</html>