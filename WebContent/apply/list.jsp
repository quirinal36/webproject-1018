<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String date = request.getParameter("selected");
    LocalDate today = LocalDate.parse(date);
    
    LocalDateTime dateTime = LocalDateTime.of(today.getYear(), today.getMonthValue(), today.getDayOfMonth(), 9, 0);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=today.toString() %></title>
</head>
<body>
<%=today.toString() %><br>
<table border="1">
	<thead>
		<tr>
			<th>시간</th>
			<th>이름</th>
			<th>연락처</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<%
		for(int i=0; i<12; i++){
		%>
		<tr>
			<td><%=dateTime.getHour() %></td>
			<td></td>
			<td></td>
			<td><a href="./form.jsp?hour=<%=dateTime.getHour() %>&today=<%=today.toString()%>">추가</a>
		</tr>		
		<%
		dateTime = dateTime.plusHours(1);
		} %>
	</tbody>
</table>
</body>
</html>