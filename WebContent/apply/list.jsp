<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="lee.hg.model.ApplyVO" %>
<%@page import="lee.hg.control.ApplyControl" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%
    Logger logger = Logger.getLogger("list.jsp");
    
    String date = request.getParameter("selected");
    LocalDate today = LocalDate.parse(date);
    
    LocalDateTime dateTime = LocalDateTime.of(today.getYear(), today.getMonthValue(), today.getDayOfMonth(), 9, 0);
    
    ApplyVO apply = new ApplyVO();
    apply.setDate(date);
    
    ApplyControl control = new ApplyControl();
    List<ApplyVO> list = control.getTodayApplyList(apply);
    Map<Integer, ApplyVO> map = control.listToTimeMap(list);
    Iterator<Integer> iter = map.keySet().iterator();
    while(iter.hasNext()){
    	int key = iter.next();
    	logger.info("key: " + key);
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=today.toString() %></title>
</head>
<body>
<%=today.toString() %> 예약일정<br>
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
			ApplyVO item = map.get(dateTime.getHour());
		%>
		<tr>
			<td><%=dateTime.getHour() %></td>
			<td>
				<%if(item != null) {
					out.print(item.getName());
				} %>
			</td>
			<td>
				<%if(item != null) {
					out.print(item.getPhone());
				} %>
			</td>
			<td>
				<%if(item == null) {%>
					<a href="./form.jsp?hour=<%=dateTime.getHour() %>&today=<%=today.toString()%>">추가</a>
				<%}else{ %>
					<a href="./edit.jsp?hour=<%=dateTime.getHour() %>&today=<%=today.toString()%>">수정</a>
				<%} %>
			</td>
			</tr>		
		<%
		dateTime = dateTime.plusHours(1);
		} %>
	</tbody>
</table>
</body>
</html>