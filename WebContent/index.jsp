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

Logger logger = Logger.getLogger("index.jsp");
logger.info(firstDayOfThisMonth.toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담일지</title>
</head>
<body>
<table border="1">
<%while(firstDayOfThisMonth.getDayOfMonth() != lastDayOfThisMonth.getDayOfMonth()) {
%>
	<tr>
		<%
		for(int i=1; i<=7; i++){
			if(firstDayOfThisMonth.getDayOfMonth() == 1 && firstDayWeekday > i){
				%>
				<td></td>
				<%	
			}else{
				%>
				<td>
				<a href="./apply/list.jsp?selected=<%=firstDayOfThisMonth.toString()%>">
					<%=firstDayOfThisMonth.getMonthValue() %>월
					<%=firstDayOfThisMonth.getDayOfMonth() %>일(<%=firstDayOfThisMonth.getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.KOREA) %>)
				</a>
				<br>
				<br>
				
				</td>
				<%
				firstDayOfThisMonth = firstDayOfThisMonth.plusDays(1);
				if(firstDayOfThisMonth.getDayOfMonth() == 1){
					break;
				}
			}
		}
		if(firstDayOfThisMonth.getDayOfMonth() == 1){
			break;
		}
		%>
	</tr>
<%} %>
</table>

</body>
</html>