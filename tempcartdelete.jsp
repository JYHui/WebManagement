<%@ page language="java" pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
   /* String action = request.getParameter("action"); */
   int cartid = Integer.parseInt(request.getParameter("id")); 
 
   Class.forName("com.mysql.jdbc.Driver");
   String url="jdbc:mysql://localhost:3306/onlineshop";
   String user="root";
   String passwd="admin";
   Connection conn=DriverManager.getConnection(url,user,passwd);
   
   String sql="delete from onlineshop.cart where cartid=? ";
   PreparedStatement pstmt=conn.prepareStatement(sql);
   pstmt.setInt(1, cartid);
   int rs=pstmt.executeUpdate();
  
   pstmt.close();
   conn.close();
   response.sendRedirect("shopping_cart.jsp");
%> 
</body>
</html>