<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reserveList.jsp</title>
<style>
  header{background:darkblue; color:white;}
  nav   {background:lightblue; color:white;}
  footer{background:blue; color:white;}
</style>
</head>
<script>
</script>
<body>
  <header>진료 예약  조회/수정</header>
  <nav>
    <jsp:include page="mainmenu.jsp"></jsp:include>
  </nav>
  <section>
  	<!-- 본문시작 -->
    <h3>진료 예약 등록결과</h3>
<%
	try{
	    String url     ="jdbc:oracle:thin:@localhost:1521:xe";
	    String user    ="system";
	    String password="4321";
	    String driver  ="oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar
	    
		Class.forName(driver);
	    Connection con=DriverManager.getConnection(url, user, password);
	    
	    StringBuilder sql=new StringBuilder();
	    sql.append(" SELECT rno, rbirth, rname, rphone, rdate, AA.dcode, dname, dgender, dsubj, dept, dpos, demail  "); 
	    sql.append(" FROM TBL_RESERVE_01 AA INNER JOIN TBL_DOCTOR_01 BB  ");
	    sql.append(" ON AA.dcode=BB.dcode  ");
	    
	    PreparedStatement pstmt=con.prepareStatement(sql.toString());
	    ResultSet rs=pstmt.executeQuery();
	    if(rs.next()){
%>
			<table border="1">
			<tr>
				<th>예약번호</th>	
				<th>생년월일</th>	
				<th>성별</th>	
				<th>예약자이름</th>	
				<th>연락처</th>	
				<th>예약날짜</th>	
				<th>의사번호</th>	
				<th>의사이름</th>	
				<th>성별</th>	
				<th>의사정보</th>	
			</tr>
<%
			do{
			    
			    String rphone=rs.getString("rphone").substring(0, 3)+"-";
			    rphone+=rs.getString("rphone").substring(3, 6)+"-";
			    rphone+=rs.getString("rphone").substring(5, 9);

			    String rbirth=rs.getString("rbirth").substring(0, 2)+"년";
			    rbirth+=rs.getString("rbirth").substring(2, 4)+"월";
			    rbirth+=rs.getString("rbirth").substring(4, 6)+"일";
			    
			    String gstr=rs.getString("rbirth").substring(6);
			    if(gstr.equals("1")){
			        gstr="남";
			    }else if(gstr.equals("2")){
			        gstr="여";
			    }//if end
			    
			    String rdate=rs.getString("rdate").substring(0, 4)+"-";
			    rdate+=rs.getString("rdate").substring(4, 6)+"-";
			    rdate+=rs.getString("rdate").substring(6, 8);
			    
			    String dgender=rs.getString("dgender");
			    if(dgender.equals("M")){
			        dgender="남";
			    }else if(dgender.equals("F")){
			        dgender="여";
			    }//if end
			    
%>
				<tr>
					<td><%=rs.getString("rno")%></td>
					<td><%=rbirth%></td>
					<td><%=gstr%></td>
					<td><%=rs.getString("rname")%></td>
					<td><%=rphone%></td>
					<td><%=rdate%></td>
					<td><%=rs.getString("dcode")%></td>
					<td><%=rs.getString("dname")%></td>
					<td><%=dgender%></td>
					<td><%=rs.getString("dsubj")%>-<%=rs.getString("dept")%>-<%=rs.getString("dpos")%></td>
				</tr>
<%			    
			}while(rs.next());

			out.print("</table>");
	        
	    }else{
	        out.print("관련 자료 없음!!");
	    }//if end
	        
	}catch (Exception e) {
	    out.println("오라클DB연결실패:" + e);
	}//end
%>  

  	<!-- 본문끝 -->
  </section>
  <footer>
    HRDKOREA Copyright&copy;2016 All rights reserved.
    Human Resources Development Service of Korea
  </footer>
</body>
</html>


