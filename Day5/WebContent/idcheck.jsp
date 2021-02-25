<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String userid = request.getParameter("userid");
	
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "";
String url = "jdbc:mysql://localhost:3306/jspstudy";
String uid = "root";
String upw = "1234";

try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, uid, upw);
	if(conn != null) {
		sql = "select mem_idx from tb_member where mem_userid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			out.println("no");
		}else {
			out.println("ok");
		}
	}
}catch(Exception e){
	e.printStackTrace();	
}
%>