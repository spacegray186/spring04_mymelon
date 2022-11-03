<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reserveForm.jsp</title>
<style>
  header{background:darkblue; color:white;}
  nav   {background:lightblue; color:white;}
  footer{background:blue; color:white;}
</style>
</head>
<script>
</script>
<body>
  <header>진료 예약 등록 결과</header>
  <nav>
    <jsp:include page="mainmenu.jsp"></jsp:include>
  </nav>
  <section>
  	<!-- 본문시작 -->
    <h3>진료 예약 등록결과</h3>
<%
	request.setCharacterEncoding("UTF-8");
	String rno   =request.getParameter("rno").trim();	
	String rbirth=request.getParameter("rbirth").trim();
	String rgender=request.getParameter("rgender").trim();
	rbirth=rbirth+rgender;
	
	String rname =request.getParameter("rname").trim();
	String rphone=request.getParameter("rphone").trim();
	String rdate =request.getParameter("rdate").trim();
	String dcode =request.getParameter("dcode");

	try{
	    String url     ="jdbc:oracle:thin:@localhost:1521:xe";
	    String user    ="system";
	    String password="4321";
	    String driver  ="oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar
	    
		Class.forName(driver);
	    Connection con=DriverManager.getConnection(url, user, password);
	    
	    StringBuilder sql=new StringBuilder();
	    sql.append(" INSERT INTO TBL_RESERVE_01 (rno, rbirth, rname, rphone, rdate, dcode) ");
	    sql.append(" VALUES (?, ?, ?, ?, ?, ?) ");
	
	    PreparedStatement pstmt=con.prepareStatement(sql.toString());
	    pstmt.setString(1, rno);
	    pstmt.setString(2, rbirth);
	    pstmt.setString(3, rname);
	    pstmt.setString(4, rphone);
	    pstmt.setString(5, rdate);
	    pstmt.setString(6, dcode);	    
	    
	    int cnt=pstmt.executeUpdate();
        if(cnt==0){
            out.println("<p>환자 진료 예약 실패했습니다</p>");
            out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
        }else{
            out.println("<script>");
            out.println("    alert('환자 진료 예약  입력되었습니다');");
            out.println("    location.href='reservationList.jsp'");//목록페이지 이동
            out.println("</script>");
        }//if end  		    
	
	}catch (Exception e) {
	    out.println("오라클DB연결실패:" + e);
	}//end
%>  
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <input type="submit" value="등록">
        <input type="button" value="조회" onclick="location.href='reserveList.jsp'">
      </td>
    </tr>
    </table>    
    </form>
  	<!-- 본문끝 -->
  </section>
  <footer>
    HRDKOREA Copyright&copy;2016 All rights reserved.
    Human Resources Development Service of Korea
  </footer>
</body>
</html>


