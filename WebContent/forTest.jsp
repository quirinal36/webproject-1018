<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="lee.hg.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//객체 1
	User myInfo = new User();
	myInfo.setName("이형구");
	myInfo.setPhone("010111222");
	//객체 2
	User junHwan = new User();
	junHwan.setName("장준환");
	junHwan.setPhone("010222333");
	// 리스트
	List<User> users = new ArrayList<User>();
	users.add(myInfo);
	users.add(junHwan);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>전화번호</td>
		</tr>
		<%
		// for문 시작
		%>
		<tr>
			<td>1</td>
			<td></td>
			<td></td>
		</tr>
		<%
		// for문 종료
		%>
		
	</table>
</body>
</html>