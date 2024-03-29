<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String param = request.getParameter("hour");
    int hour = Integer.parseInt(param);
    String date = request.getParameter("today");;
    LocalDate today = LocalDate.parse(date);
    LocalDateTime dateTime = LocalDateTime.of(today.getYear(), today.getMonthValue(), today.getDayOfMonth(), hour, 0);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=today.toString() %> <%=hour %>시 예약</title>
</head>
<body>
	<form action="./insert" method="POST">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="phone"/></td>
			</tr>
			<tr>
				<td>학년</td>
				<td><input type="text" name="grade"/></td>
			</tr>
			<tr>
				<td>과목</td>
				<td>
					<select name="subject">
						<option>선택 해주세요.</option>
						<option value="1">스크래치</option>
						<option value="2">파이썬</option>
						<option value="3">자바</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="저장하기"/>
				</td>
			</tr>
		</table>
		<input type="hidden" name="date" value="<%=today.toString() %>"/>
		<input type="hidden" name="time" value="<%=hour %>"/>
	</form>
</body>
</html>