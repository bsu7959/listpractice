<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	if(session.getAttribute("userid") == null) {
%>
	<script>
		alert('로그인 후 이용하세요');
		location.href='./login.jsp';
	</script>
<%
	}else {
		request.setCharacterEncoding("UTF-8");
		String userid = (String)session.getAttribute("userid");
		String userpw = request.getParameter("userpw");
		String username = request.getParameter("username");
		String hp = request.getParameter("hp");
		String email = request.getParameter("email");
		String hobby[] = request.getParameterValues("hobby");
		String hobbystr = "";
		for(int i=0; i<hobby.length; i++) {
			hobbystr = hobbystr + hobby[i] + " ";
		}
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		String zipcode = request.getParameter("zipcode");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;


		String sql = "";
		String url = "jdbc:mysql://localhost:3306/jspstudy";
		String uid = "root";
		String upw = "1234";
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,uid,upw);
			if(conn != null) {
				sql = "select mem_idx from tb_member where mem_userid=? and mem_userpw=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				pstmt.setString(2, userpw);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					sql = "update tb_member set mem_name=?, mem_hp=?, mem_email=?, mem_hobby=?, mem_ssn1=?, mem_ssn2=?, mem_zipcode=?, mem_address1=?, mem_address2=?, mem_address3=? where mem_userid=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, username);
					pstmt.setString(2,hp);
					pstmt.setString(3,email);
					pstmt.setString(4,hobbystr);
					pstmt.setString(5,ssn1);
					pstmt.setString(6,ssn2);
					pstmt.setString(7,zipcode);
					pstmt.setString(8,address1);
					pstmt.setString(9,address2);
					pstmt.setString(10,address3);
					pstmt.setString(11, userid);
					pstmt.executeUpdate();
%>
	<script>
		alert('회원정보가 수정되었습니다');
		location.href='./info.jsp';
	</script>
<%
				}else {
%>
	<script>
		alert('비밀번호를 확인하세요');
		history.back();
	</script>
<%
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
%>
