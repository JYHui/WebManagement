<%@page language="java" pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
    int goodstypeid=Integer.parseInt(request.getParameter("id"));
 
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/onlineshop";
	String user="root";
	String passwd="admin";
	Connection conn=DriverManager.getConnection(url,user,passwd);
	
	String sql="select * from onlineshop.goodsinfo where goodstypeid=? ";
    PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, goodstypeid);
	ResultSet rs=pstmt.executeQuery();
     
     
     if(!rs.isBeforeFirst())
     {
    	 out.print("抱歉，没有找到到相关信息！");
     }
     else
     {
    	session.setAttribute("resultRs", rs);
    	response.sendRedirect("catalog_grid.jsp");
     }   
     
     //rs.close();
     //pstmt.close();
     //conn.close();      //不要关闭记录集和conn连接对象，除非将记录集封装到一个list列表中

%>
</body>
</html>