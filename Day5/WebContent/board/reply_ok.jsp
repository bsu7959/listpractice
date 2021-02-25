<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
    if(session.getAttribute("userid")==null){   // 로그인 한 사용자만 들어올 수 있다.      
%>
   <script>
      alert('로그인 후 이용하세요');
      location.href='../login.jsp'; 
   </script>
<% 
   }else{
      if(request.getParameter("re_boardIdx") == null || request.getParameter("re_boardIdx").equals("")){
         %>
         <script>
               alert('잘못된 접근입니다.');
               location.href='../login.jsp'; 
         </script>
         <% 
      }else{
         // 제대로 된 경우

         String userid = (String)session.getAttribute("userid");
         String username = (String)session.getAttribute("username");
         String re_boardIdx = request.getParameter("re_boardIdx");
         String re_content = request.getParameter("re_content");
         
         
         
         // DB 연결
           Connection conn = null;
           PreparedStatement pstmt = null;
           ResultSet rs = null;
          
           // MySQL Workbench와 연결
           String sql = "";
           String url = "jdbc:mysql://localhost:3306/jspstudy";
           String uid = "root";
           String upw = "1234";
             
           try{
             Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(url, uid, upw);
             if(conn != null){
                   sql = "insert into tb_reply (re_userid, re_name, re_content, re_boardIdx) values(?,?,?,?)";
                   pstmt = conn.prepareStatement(sql);
                   pstmt.setString(1, userid);
                   pstmt.setString(2, username);
                   pstmt.setString(3, re_content);
                   pstmt.setString(4, re_boardIdx);
                   pstmt.executeUpdate();                
             }
          }catch(Exception e){
             e.printStackTrace();
          }
%>
      <script>
         alert('등록되었습니다');
         location.href='view.jsp?b_idx=<%=re_boardIdx%>';
      </script>
<%
      }   
   }   
%>