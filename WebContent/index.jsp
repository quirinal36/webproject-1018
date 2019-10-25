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
</head>
<body>
<table border="1">
	<%
	while(firstDayOfThisMonth.getMonthValue() == today.getMonthValue()) {
	%>
		<tr>
			<%
			for(int i=1; i<=7; i++){
				if(firstDayOfThisMonth.getMonthValue() > today.getMonthValue()){
					break;
				}
				%>
				<td>
					<%=firstDayOfThisMonth.getMonthValue() %>월
					<%=firstDayOfThisMonth.getDayOfMonth() %>일
					(<%=firstDayOfThisMonth.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.KOREA) %>)
					<br>
					<a href="./apply/list.jsp?selected=<%=firstDayOfThisMonth.toString()%>">상세보기</a>
				</td>
				<%
				firstDayOfThisMonth = firstDayOfThisMonth.plusDays(1);
			}
			%>
		</tr>
	<%} %>
</table>

</body>
</html>