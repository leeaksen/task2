<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>\
<%@ page import="java.sql.*" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#home {
        margin-top : 20px;
}
</style>
<body>
<%
String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC";
String user = "root";
String passwd = "1127";
Connection con = null;
String sql = "select * from oneline";
PreparedStatement pstmt = null;

Class.forName("com.mysql.cj.jdbc.Driver");
con = DriverManager.getConnection(url, user, passwd);

pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery(); //select
while(rs.next()) {
	int no = rs.getInt(1);
	String memo = rs.getString(2);
	String wdate = rs.getString(3);
	
	out.print("번호" + no + ":" + memo + ":( " + wdate + ")<br>");
}
rs.close();
pstmt.close();
con.close();
out.print("DB조회 성공");
%>
<div id = "home">
<a href = "http://localhost:8080/oneline/memo01.html" target = "blank">
<input type = "button" value ="홈으로"></input>
</div>
</body>
</html>