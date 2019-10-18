<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="lee.hg.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    User myInfo = new User();
    myInfo.setName("이형구");
    myInfo.setAge(34);
    
    User junHwan = new User();
    junHwan.setName("장준환");
    junHwan.setAge(18);
    
    List<User> users = new ArrayList<User>();
    users.add(myInfo);
    users.add(junHwan);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>이름</th>
				<th>나이</th>
			</tr>
		</thead>
		<tbody>
			<% for(int i=0; i<users.size(); i++){ %>
			<% User user = users.get(i); %>
				<!-- 주석입니다. -->
				<tr>
					<td><%=user.getName() %></td>
					<td><%=user.getAge()%></td>
				</tr>
			<% } %>
		</tbody>
	</table>
</body>
</html>