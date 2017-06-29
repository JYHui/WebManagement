<%@ page language="java" pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="UTF-8">

<meta name="description" content="">
<meta name="keywords" content="">

<title>Catalog (grid view)</title>

<link rel="shortcut icon" href="favicon.ico">
<link href="css/style.css" media="screen" rel="stylesheet"
	type="text/css">
<link href="css/grid.css" media="screen" rel="stylesheet"
	type="text/css">

<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/html5.js"></script>
<script src="js/jflow.plus.js"></script>
<script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
<script src="js/checkbox.js"></script>
<script src="js/radio.js"></script>
<script src="js/selectBox.js"></script>

<script>
	$(document).ready(function() {
		$("select").selectBox();
	});
</script>

<script>
	$(document).ready(function() {
		$("#myController").jFlow({
			controller : ".control", // must be class, use . sign
			slideWrapper : "#jFlowSlider", // must be id, use # sign
			slides : "#slider", // the div where all your sliding divs are nested in
			selectedWrapper : "jFlowSelected", // just pure text, no sign
			width : "984px", // this is the width for the content-slider
			height : "480px", // this is the height for the content-slider
			duration : 400, // time in miliseconds to transition one slide
			prev : ".slidprev", // must be class, use . sign
			next : ".slidnext", // must be class, use . sign
			auto : true
		});
	});
</script>
<script>
	$(function() {
		$('#list_product').carouFredSel({
			prev : '#prev_c1',
			next : '#next_c1',
			auto : false
		});
		$('#list_product2').carouFredSel({
			prev : '#prev_c2',
			next : '#next_c2',
			auto : false
		});
		$(window).resize();
	});
</script>
<script>
	$(document).ready(function() {
		$("button").click(function() {
			$(this).addClass('click')
		});
	})
</script>

</head>
<body>
	<div class="container_12">
		<div id="top">
			<div class="grid_3">
				<div class="phone_top">联系我们 +777 (100) 1234</div>
				<!-- .phone_top -->
			</div>
			<!-- .grid_3 -->

			<div class="grid_6">
				<div class="welcome">
					欢迎<%=session.getAttribute("uname") %>来到疯购网 <a href="login.jsp">[登录]</a> <a href="login.jsp">[免费注册]</a>
				</div>
				<!-- .welcome -->
			</div>
			<!-- .grid_6 -->
		</div>
		<!-- #top -->

		<div class="clear"></div>

		<header id="branding">
			<div class="grid_3">
				<hgroup>
					<h1 id="site_logo">
						<a href="index.jsp" title=""><img src="images/logo.png"
							alt="Online Store Theme Logo" /></a>
					</h1>
					<h2 id="site_description">疯&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;购&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;网
					</h2>
				</hgroup>
			</div>
			<!-- .grid_3 -->

			<div class="grid_3">
				<form class="search">
					<input type="text" name="search" class="entry_form" value=""
						placeholder="搜索..." />
				</form>
			</div>
			<!-- .grid_3 -->

			<div class="grid_6">
        <ul id="cart_nav">
          <li>
            <a class="cart_li" href="shopping_cart.jsp">购物车 <span>¥0.00</span></a>
            <ul class="cart_cont">
              <li class="no_border"><p>最近添加</p></li>
<%  
     Class.forName("com.mysql.jdbc.Driver");
     String url="jdbc:mysql://localhost:3306/studentsgrades";
     String username="root";
     String password="admin";
     Connection coon=DriverManager.getConnection(url, username, password);
     
     String sql="select * from onlineshop.cart";
     Statement stmt=coon.createStatement();
     ResultSet rs2=stmt.executeQuery(sql);
     
     while(rs2.next()){
%>             
               <li>
                <a href="product_page.jsp" class="prev_cart"><span class="cart_vert"><img src="<%=rs2.getString("goodspicture") %>" alt="" title="" /></span></a>
                <div class="cont_cart">
                  <h4><%=rs2.getString("goodsname") %></h4>
                  <div class="price"><%=rs2.getString("goodsnum") %> x ¥<%=rs2.getString("pricebyone") %></div> 
                </div>
                <%-- <a title="close" class="close" href="tempcartdelete.jsp?id=<%=rs2.getInt("cartid") %>"></a> --%>
                <div class="clear"></div>
              </li>
<%
    	 }
      stmt.close();
      rs2.close();
%> 
             <!--  <li>
                <a href="product_page.jsp" class="prev_cart"><span class="cart_vert"><img src="images/cart_img.png" alt="" title="" /></span></a>
                <div class="cont_cart">
                  <h4>Caldrea Linen and Room Spray</h4>
                  <div class="price">1 x $399.00</div>
                </div>
                <a title="close" class="close" href="#"></a>
                <div class="clear"></div>
              </li> -->
              
	      <li class="no_border">
		<a href="shopping_cart.jsp" class="view_cart">查看购物车</a>
		<a href="checkout.jsp" class="checkout">去结账</a>
	      </li>
            </ul>
          </li>
        </ul>

				<nav class="private">
					<ul>
						<li><a href="#">我的账号</a></li>
						<li class="separator">|</li>
						<li><a href="#">我的收藏</a></li>
						<li class="separator">|</li>
					</ul>
				</nav>
				<!-- .private -->
			</div>
			<!-- .grid_6 -->
		</header>
		<!-- #branding -->
	</div>
	<!-- .container_12 -->

	<div class="clear"></div>

	<div id="block_nav_primary">
    <div class="container_12">
      <div class="grid_12">
        <nav class="primary">
          <ul>
            <li class="curent"><a href="index.jsp">首页</a></li>
            <li><a href="paging.jsp?id=1">苹果</a></li>
            <li><a href="paging.jsp?id=2">华为</a></li>
            <li><a href="paging.jsp?id=3">三星</a></li>
            <li>
              <a href="#">其他</a>
              <ul class="sub">
                <li><a href="paging.jsp?id=4">魅族</a></li>
                <li><a href="paging.jsp?id=5">小米</a></li>
              </ul>
            </li>
          </ul>
        </nav><!-- .primary -->
      </div><!-- .grid_12 -->
    </div><!-- .container_12 -->
  </div><!-- .block_nav_primary -->
  
	<div class="clear"></div>

	<div class="container_12">
		<div class="grid_12">
			<div class="breadcrumbs">
				<a href="index.jsp">主页</a><span>&#8250;</span><a href="#">类别</a><span>&#8250;</span><span
					class="current">此页</span>
			</div>
			<!-- .breadcrumbs -->
		</div>
		<!-- .grid_12 -->
	</div>
	<!-- .container_12 -->

	<div class="clear"></div>

	<section id="main">
		<div class="container_12">
			<div id="sidebar" class="grid_3">
				<aside id="categories_nav">
					<h3>类别</h3>

					<nav class="left_menu">
						<ul>
							<li><a href="paging.jsp?id=1">苹果 <span>(4)</span></a></li>
							<li><a href="paging.jsp?id=2">华为 <span> (5)</span></a></li>
							<li><a href="paging.jsp?id=3">三星 <span>(5)</span></a></li>
							<li><a href="paging.jsp?id=4">小米 <span>(3)</span></a></li>
							<li><a href="paging.jsp?id=5">魅族<span>(3)</span></a></li>
						</ul>
					</nav>
					<!-- .left_menu -->
				</aside>
			</div>
			<!-- .sidebar -->

			<div id="content" class="grid_9">
				<h1 class="page_title">产品列表</h1>				
				<div class="grid_product">


<%
	ResultSet rs=(ResultSet)session.getAttribute("resultRs");
	
	int intPageSize=3;       //一页显示的记录数
	int totalRowCount;         //记录总数
	int totalPageCount;        //总页数
	int currentPage;             //待显示页码
	String strPage;          //获得待显示页码
	int nextPage=0;             //下一页或上一页的页码
	int prePage=0;
	int i;
	
	rs.last();                  //记录集指针移动到最后一行
	totalRowCount=rs.getRow();  //获得当前行号,即记录总数
	totalPageCount=(totalRowCount+intPageSize-1) / intPageSize;    //记算总页数
	strPage = request.getParameter("page");    //取得待显示页码，通过参数传递的
	
	if(strPage==null){                         //表明在QueryString中没有page这一个参数，此时显示第一页数据
		currentPage = 1;
	    }
	    else{     
	    	currentPage = Integer.parseInt(strPage);    //将字符串转换成整型    	        
	    }
	    if(currentPage<1) currentPage = 1;
	    if(currentPage>totalPageCount) currentPage = totalPageCount;            //调整待显示的页码为最后一页的页码
	    
	    if(totalPageCount>0){     
	        rs.absolute((currentPage-1) * intPageSize + 1);  //将记录指针定位到待显示页的第一条记录上
	        i = 0;                                           //数据库记录计数器
	        while(i<intPageSize && !rs.isAfterLast()){      //控制每页显示的记录数,条件如果用rs.next()则第一条记录显示不了
	        	/* out.print(rs.getInt("id")+"--"+rs.getString(2)+"--"+rs.getString("password"));
	        	out.print("<br>"); */
%>
	   <div class="grid_3 product">
		<div class="prev">
			<a href="product_page.jsp?id=<%=rs.getString("goodsid") %>"><img
				src="<%=rs.getString("picture") %>" alt="" title="" /></a>
		</div>
		<!-- .prev -->
		<a href="product_page.jsp?id=<%=rs.getString("goodsid") %>"><%=rs.getString("goodsname") %></a>
		<div class="cart">
			<div class="price">
				<div class="vert">
					<div class="price_new">¥<%=rs.getString("price") %></div>
					<!-- <div class="price_old">¥4725.00</div> -->
				</div>
			</div>
			<a href="#" class="obn"></a> 
			<a href="#" class="like"></a> 
			<a href="#" class="bay"></a>
		</div>
		<!-- .cart -->
	</div>
				
					
<%	        	 
	        	rs.next();
	        	i++;
	        }   	
	    } 
	    if(currentPage>1)
	    {
	    	prePage=currentPage-1;
        }
	    
	    if(currentPage<totalPageCount)
	    {
	    	nextPage=currentPage+1;
	    	/* out.print("<a href=query_showsess.jsp?page="+nextPage+">下一页</a>&nbsp;&nbsp;&nbsp;"); */
	    }
%>
                        <div class="clear"></div>
				</div>
				<!-- .grid_product -->

				<div class="clear"></div>

				<div class="pagination">
					<ul>
					
						<li class="prev"><a href="catalog_grid.jsp?page=<%=prePage %>">上一页</a></li>	
						<li class="curent"><a href="catalog_grid.jsp?page=1"><%=currentPage %></a></li>
						<li class="next"><a href="catalog_grid.jsp?page=<%=nextPage %>">下一页</a></li>
						<li class="curent">共<%=totalPageCount %>页</li>	
					</ul>
				</div>
				<!-- .pagination -->
			</div>
			<!-- #content -->

			<div class="clear"></div>

		</div>
		<!-- .container_12 -->
	</section>
	<!-- #main -->

	<div class="clear"></div>

	<footer>
		<div class="f_navigation">
			<div class="container_12">
				<div class="grid_3">
					<h3>关于网站</h3>
					<ul class="f_contact">
						<li>湖北省武汉市青山区建设六路18号</li>
						<li>+777 (100) 1234</li>
						<li>fenggou@mail.com</li>
					</ul>
					<!-- .f_contact -->
				</div>
				<!-- .grid_3 -->

				<div class="grid_3">
					<h3>信息</h3>
					<nav class="f_menu">
						<ul>
							<li><a href="#">关于我们</a></li>
							<li><a href="#">政策</a></li>
							<li><a href="#">项目</a></li>
							<li><a href="#">保障</a></li>
						</ul>
					</nav>
					<!-- .private -->
				</div>
				<!-- .grid_3 -->

				<div class="grid_3">
					<h3>顾客服务</h3>
					<nav class="f_menu">
						<ul>
							<li><a href="contact_us.html">联系我们</a></li>
							<li><a href="#">售后服务</a></li>
							<li><a href="#">物流服务</a></li>
							<li><a href="#">退款说明</a></li>
						</ul>
					</nav>
					<!-- .private -->
				</div>
				<!-- .grid_3 -->

				<div class="grid_3">
					<h3>帮助中心</h3>
					<nav class="f_menu">
						<ul>
							<li><a href="#">购物指南</a></li>
							<li><a href="#">支付方式</a></li>
							<li><a href="#">常见问题</a></li>
						</ul>
					</nav>
					<!-- .private -->
				</div>
				<!-- .grid_3 -->

				<div class="clear"></div>
			</div>
			<!-- .container_12 -->
		</div>
		<!-- .f_navigation -->
	</footer>


</body>
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<!-- /Added by HTTrack -->
</html>