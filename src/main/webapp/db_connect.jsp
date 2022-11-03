<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>db_connect.jsp</title>
</head>
<body>
	<h3>Database 연동 샘플</h3>
	<hr>
<%
	try{
	    String url     ="jdbc:oracle:thin:@localhost:1521:xe";
	    String user    ="system";
	    String password="4321";
	    String driver  ="oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar
	    
		Class.forName(driver);
	    Connection con=DriverManager.getConnection(url, user, password);
	    out.println("오라클 DB 연결 성공!!");
	    
	
	}catch (Exception e) {
	    out.println("오라클DB연결실패:" + e);
	}//end
%>
</body>
</html>