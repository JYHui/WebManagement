<%@ page language="java" pageEncoding="utf-8" import="java.sql.*"%>
<%-- <%@ page import="util.*"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%-- <%  
	Cart c = (Cart)session.getAttribute("cart");  
	if(c == null) {  
	    c = new Cart();  
	    session.setAttribute("cart", c);  
	}  
	  
	/* int totalPrice = c.getTotalPrice();  */ 
	  
	request.setCharacterEncoding("utf-8");  
	String action = request.getParameter("action");  
	  
	/* Map products = (HashMap)session.getAttribute("products"); */  
	  
	if(action != null && action.trim().equals("add")) {  
	    int goodsid = Integer.parseInt(request.getParameter("id"));
	    
	    Class.forName("com.mysql.jdbc.Driver");
	    String url="jdbc:mysql://localhost:3306/onlineshop";
	    String user="root";
	    String passwd="admin";
	    Connection conn=DriverManager.getConnection(url,user,passwd);
	    
	    String sql="select * from onlineshop.goodsinfo where goodsid=? ";
	  	PreparedStatement pstmt=conn.prepareStatement(sql);
	  	pstmt.setInt(1, goodsid);
	  	ResultSet rs=pstmt.executeQuery();
	  	
	    Goods goods = new Goods();
	    goods.setGoodsid(goodsid);
	    CartItem ci = new CartItem();  
	    ci.setGoods(goods);  
	    ci.setCount(1);  
	    c.add(ci); 
	    /* int totalPrice = c.getTotalPrice(); */
	   /*  int totalPrice=0;
	    totalPrice+= Integer.parseInt(ci.getGoods().getPrice()) * ci.getCount(); */
	    
	    session.setAttribute("buygoodsnum", ci.getCount());
	    session.setAttribute("price",ci.getGoods().getPrice());
	    /* session.setAttribute("totalprice",totalPrice ); */
 	    session.setAttribute("goodsname", ci.getGoods().getGoodsname());
	    response.sendRedirect("shopping_cart.jsp");
	}  
	  
	if(action != null && action.trim().equals("delete")) {  
		int goodsid = Integer.parseInt(request.getParameter("id"));  
	    c.deleteItemById(goodsid);  
	}  
	  
	if(action != null && action.trim().equals("update")) {  
	    for(int i=0; i<c.getItems().size(); i++) {  
	        CartItem ci = c.getItems().get(i);  
	        int count = Integer.parseInt(request.getParameter("p" + ci.getGoods().getGoodsid()));  
	        ci.setCount(count);  
	    }  
	}  
 %>  --%>
 <%
   String action = request.getParameter("action");
   int goodsid = Integer.parseInt(request.getParameter("id"));
   int buygoodsone = Integer.parseInt(request.getParameter("buygoodsone"));   //得到一次购买商品的数量 
   int buygoodsnum=0; 
   double totalprice=0; 
   
   Class.forName("com.mysql.jdbc.Driver");
   String url="jdbc:mysql://localhost:3306/onlineshop";
   String user="root";
   String passwd="admin";
   Connection conn=DriverManager.getConnection(url,user,passwd);
   
   String sql="select * from onlineshop.cart where cartid=? ";
   PreparedStatement pstmt=conn.prepareStatement(sql);
   pstmt.setInt(1, goodsid);
   ResultSet rs=pstmt.executeQuery();
   
   if(!rs.next() && action != null && action.trim().equals("add")){     //在购物车表里找不到商品信息就把商品信息添加进去
   /* if (action != null && action.trim().equals("add")){  
      //从商品库中取出所选购商品的数据   */
      buygoodsnum=buygoodsone;
      
      sql="select * from onlineshop.goodsinfo where goodsid=? ";
      pstmt=conn.prepareStatement(sql);
      pstmt.setInt(1, goodsid);
      ResultSet rs1=pstmt.executeQuery();
      rs1.next();
      
  	  totalprice=buygoodsnum*Double.valueOf(rs1.getString("price"));
  	  
	  sql="insert into onlineshop.cart values(?,?,?,?,?,?) ";
	  pstmt=conn.prepareStatement(sql);
	  pstmt.setInt(1, goodsid);
	  pstmt.setString(2, rs1.getString("picture"));
	  pstmt.setString(3, rs1.getString("goodsname"));
	  pstmt.setDouble(4, Double.valueOf(rs1.getString("price")));
	  pstmt.setInt(5, buygoodsnum);
	  pstmt.setDouble(6, totalprice);
	  int rs2=pstmt.executeUpdate();
	  
	  pstmt.close();
	  rs1.close();
	  conn.close();
	  /* response.sendRedirect("product_page.jsp?id="+goodsid); */
  	  }
   else /* if(rs.next() && action != null && action.trim().equals("add")) */{    //在购物车表里找到商品信息,就把商品数量和总价修改
	   buygoodsnum=buygoodsone+ rs.getInt("goodsnum");
	   totalprice=buygoodsnum*rs.getDouble("pricebyone");
       
	   sql="update onlineshop.cart set goodsnum=?, totalprice=?  where cartid= "+ goodsid;
	   pstmt=conn.prepareStatement(sql);
	   pstmt.setInt(1, buygoodsnum);
	   pstmt.setDouble(2, totalprice);
	   int rs3=pstmt.executeUpdate();
	   
	   /* response.sendRedirect("product_page.jsp?id="+goodsid); */
	   pstmt.close();
   }
   /* else if(rs.next() && action != null && action.trim().equals("update")){
	   sql="update onlineshop.cart set goodsnum=? where cartid= "+ goodsid;
	   pstmt=conn.prepareStatement(sql);
	   pstmt.setInt(1, buygoodsone);
	   int rs3=pstmt.executeUpdate();
	   response.sendRedirect("shopping_cart.jsp");
	   pstmt.close(); 
	   
   } */
   pstmt.close();
   rs.close();
   conn.close();
   response.sendRedirect("product_page.jsp?id="+goodsid);
   
%> 
</body>
</html>