<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="net.member.*" %>    
<jsp:useBean id="dto" class="net.member.SalesDTO"></jsp:useBean>
<jsp:useBean id="dao" class="net.member.MemberDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salesList.jsp</title>
<style>
  header{background:darkblue; color:white;}
  nav   {background:lightblue; color:white;}
  footer{background:blue; color:white;}
</style>
</head>
<body>
  <header>쇼핑몰 회원관리 ver 1.0</header>
  <nav>
    <jsp:include page="mainmenu.jsp"></jsp:include>
  </nav>
  <section>
  	<!-- 본문시작 -->
  	<h3>회원매출조회</h3>
<%
	ArrayList<SalesDTO> list=dao.saleslist();
	if(list==null){
	    out.print("자료없음!!");
	}else{
	    %>    
	        <table border="1">
	        <tr>
	          <th>회원번호</th>
	          <th>회원성명</th>
	          <th>고객등급</th>
	          <th>매출</th>
	        </tr>
	    <%
	    	for(int idx=0; idx<list.size(); idx++){
	    		dto=list.get(idx);
	    %>
	    		<tr>
	    			<td><%=dto.getCustno()%></td>
	    			<td><%=dto.getCustname()%></td>
	    			<td>
	    <%              String grade=dto.getGrade();
	    				if(grade.equals("A")){
	    					out.print("VIP");
	    				}else if(grade.equals("B")){
	    					out.print("일반");
	    				}else if(grade.equals("C")){
	    					out.print("직원");
	    				}//if end
	    %>
	                </td>
	    			<td><%=dto.getHap()%></td>
	    		</tr>
	    <%		
	    	}//for end    
	        out.print("</table>");
	    }//if end
%>
  	<!-- 본문끝 -->
  </section>
  <footer>
    HRDKOREA Copyright&copy;2016 All rights reserved.
    Human Resources Development Service of Korea
  </footer>
</body>
</html>


