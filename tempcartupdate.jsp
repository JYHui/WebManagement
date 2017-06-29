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
   int updatebuygoodsnum = Integer.parseInt(request.getParameter("updatebuygoodsnum"));   //得到一次购买商品的数量 
   int buygoodsnum=0; 
   double totalprice=0;  
   
   Class.forName("com.mysql.jdbc.Driver");
   String url="jdbc:mysql://localhost:3306/onlineshop";
   String user="root";
   String passwd="admin";
   Connection conn=DriverManager.getConnection(url,user,passwd);
   
   String sql="select * from onlineshop.cart where cartid=? ";
   PreparedStatement pstmt=conn.prepareStatement(sql);
   pstmt.setInt(1, cartid);
   ResultSet rs=pstmt.executeQuery();
   
   
   if(rs.next() /* && action != null && action.trim().equals("update") */){
	   buygoodsnum=updatebuygoodsnum;
	   totalprice=buygoodsnum*rs.getDouble("pricebyone");
	   
	   sql="update onlineshop.cart set goodsnum=?, totalprice=?  where cartid= "+ cartid;
	   pstmt=conn.prepareStatement(sql);
	   pstmt.setInt(1, buygoodsnum);
	   pstmt.setDouble(2, totalprice);
	   int rs3=pstmt.executeUpdate(); 
	   
   }
   pstmt.close();
   rs.close();
   conn.close();
   response.sendRedirect("shopping_cart.jsp");
%> 
</body>
</html>