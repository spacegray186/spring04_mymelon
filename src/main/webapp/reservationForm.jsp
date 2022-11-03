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
function reserveCheck(f){
	var rno=f.rno.value;
	rno=rno.trim();
	if(rno.length==0){
		alert("예약번호가 입력되지 않았습니다");
		f.rno.focus();
		return false;
	}//if end

	var rbirth=f.rbirth.value;
	rbirth=rbirth.trim();
	if(rbirth.length==0){
		alert("생년월일 입력되지 않았습니다");
		f.rbirth.focus();
		return false;
	}//if end
	
	var rname=f.rname.value;
	rname=rname.trim();
	if(rname.length==0){
		alert("예약자 이름이 입력되지 않았습니다");
		f.rname.focus();
		return false; 
	}//if end
	
	var rphone=f.rphone.value;
	rphone=rphone.trim();
	if(rphone.length==0){
		alert("전화번호가 입력되지 않았습니다");
		f.rphone.focus();
		return false;
	}//if end	
	
	var rdate=f.rdate.value;
	rdate=rdate.trim();
	if(rdate.length==0){
		alert("예약일자가 입력되지 않았습니다");
		f.rdate.focus();
		return false;
	}//if end	

	var dcode=f.dcode.value;
	dcode=dcode.trim();
	if(dcode=='0'){
		alert("의사번호가 입력되지 않았습니다");
		return false;
	}//if end	
	
	return true;
	
}//reserveCheck() end
</script>
<body>
  <header>진료 예약 등록</header>
  <nav>
    <jsp:include page="mainmenu.jsp"></jsp:include>
  </nav>
  <section>
  	<!-- 본문시작 -->
    <h3>진료 예약 등록</h3>
    <form method="post"  action="reservationIns.jsp"  onsubmit="return reserveCheck(this)">
    <table border="1">
    <tr>
    	<th>예약번호</th>
    	<td><input type="text" name="rno"></td>
    </tr>
    <tr>
      <th>생년월일</th>
      <td><input type="text" name="rbirth"></td>
    </tr>
    <tr>
      <th>성별</th>
      <td>
      	   <input type="radio" name="rgender" value="1" checked>남
      	   <input type="radio" name="rgender" value="2">여
      </td>
    </tr>
    <tr>
      <th>예약자 이름</th>
      <td><input type="text" name="rname"></td>
    </tr>
    <tr>
      <th>전화번호</th>
      <td><input type="text" name="rphone"></td>
    </tr>
    <tr>
      <th>예약날짜</th>
      <td><input type="text" name="rdate"></td>
    </tr>
      <th>의사번호</th>
      <td>
<%
	try{
	    String url     ="jdbc:oracle:thin:@localhost:1521:xe";
	    String user    ="system";
	    String password="1234";
	    String driver  ="oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar
	    
		Class.forName(driver);
	    Connection con=DriverManager.getConnection(url, user, password);
	    
	    StringBuilder sql=new StringBuilder();
	    sql.append(" SELECT dcode ");
	    sql.append(" FROM TBL_DOCTOR_01 ");
	    sql.append(" ORDER BY dcode ASC ");
	
	    PreparedStatement pstmt=con.prepareStatement(sql.toString());
	    ResultSet rs=pstmt.executeQuery();
	    if(rs.next()){
	        String dcode="";
	        do{
				dcode+="<option value='" + rs.getString("dcode") + "'>" + rs.getString("dcode");        
	        }while(rs.next());
	        
	        out.print("<select name='dcode'>");
	        out.print("	<option value='0'>의사번호선택</option>");
	        out.print(dcode);
	        out.print("</select>");	        
	    }else{
	        out.print("자료없음!!");
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
        <input type="reset"  value="취소">
        <input type="button" value="조회" onclick="location.href='reservationList.jsp'">
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


