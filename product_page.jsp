<%-- <%@page import="com.mysql.jdbc.Connection"%>
<%@page import="util.jdbcconnect"%>  --%>
<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>Product view</title>

  <link rel="shortcut icon" href="favicon.ico">
  <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="css/jquery.jqzoom.css" type="text/css">

  <script src="js/jquery-1.7.2.min.js" ></script>
  <script src="js/html5.js" ></script>
  <script src="js/jflow.plus.js" ></script>
  <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
  <script src="js/checkbox.js"></script>
  <script src="js/radio.js"></script>
  <script src="js/selectBox.js"></script>
  <script src="js/jquery.jqzoom-core.js" ></script>

  <script>
	$(document).ready(function() {
		$('.jqzoom').jqzoom({
			zoomType: 'standard',
			lens:true,
			preloadImages: true,
			alwaysOn:false
		});
	});
  </script>

  <script>
	$(document).ready(function() {
		$("select").selectBox();
	});
  </script>

  <script>
	$(document).ready(function() {
		$('#wrapper_tab a').click(function() {
			if ($(this).attr('class') != $('#wrapper_tab').attr('class') ) {
				$('#wrapper_tab').attr('class',$(this).attr('class'));
			}
			return false;
		});
	});
  </script>

  <script>
	$(function() {
	  $('#list_product').carouFredSel({
		prev: '#prev_c1',
		next: '#next_c1',
		auto: false
	  });
          $('#list_banners').carouFredSel({
		prev: '#ban_prev',
		next: '#ban_next',
		scroll: 1,
		auto: false
	  });
	  $('#thumblist').carouFredSel({
		prev: '#img_prev',
		next: '#img_next',
		scroll: 1,
		auto: false,
		circular: false,
	  });
	  $(window).resize();
	});
  </script>
  <script>
       $(document).ready(function(){
	      $("button").click(function(){
		     $(this).addClass('click')
	      });
       })
  </script>

</head>
<body>
<%
      int goodsid=Integer.parseInt(request.getParameter("id"));
       /* jdbcconnect conn=new jdbcconnect();
       conn=(Connection) jdbcconnect.getConnection(); 
      conn.getConnection(); 
      String sql="select * from onlineshop.goodsinfo where goodsid="+goodsid;
      ResultSet rs=conn.executeQuery(sql);  */
       
      Class.forName("com.mysql.jdbc.Driver");
	  String url="jdbc:mysql://localhost:3306/studentsgrades";
      String username="root";
      String password="admin";
      Connection coon=DriverManager.getConnection(url, username, password); 
	     
      String sql="select * from onlineshop.goodsinfo where goodsid=?";
      PreparedStatement pstmt=coon.prepareStatement(sql);
      pstmt.setInt(1, goodsid);
      ResultSet rs=pstmt.executeQuery();  
      
      if(!rs.isBeforeFirst()){
		  response.sendRedirect("login.jsp");
	   }
      rs.next();
      /* while(rs.isBeforeFirst()){
      }  */
    	  
%> 
  <div class="container_12">
    <div id="top">
      <div class="grid_3">
        <div class="phone_top">
                                 联系我们 +777 (100) 1234
        </div><!-- .phone_top -->
      </div><!-- .grid_3 -->

      <div class="grid_6">
        <div class="welcome">
                                  欢迎<%=session.getAttribute("uname") %>来到疯购网 <a href="login.jsp">[登录]</a> <a href="login.jsp">[免费注册]</a>
        </div><!-- .welcome -->
      </div><!-- .grid_6 -->
    </div><!-- #top -->

    <div class="clear"></div>

    <header id="branding">
      <div class="grid_3">
        <hgroup>
          <h1 id="site_logo" ><a href="index.jsp" title=""><img src="images/logo.png" alt="Online Store Theme Logo"/></a></h1>
          <h2 id="site_description">疯&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;购&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;网                  </h2>
        </hgroup>
      </div><!-- .grid_3 -->

      <div class="grid_3">
        <form class="search">
          <input type="text" name="search" class="entry_form" value="" placeholder="搜索..."/>
	</form>
      </div><!-- .grid_3 -->
  	 
 
      <div class="grid_6">
        <ul id="cart_nav">
          <li>
            <a class="cart_li" href="shopping_cart.jsp">购物车 <%-- <span>¥<%=rs2.getString("totalprice") %></span> --%></a>
            <ul class="cart_cont">
              <li class="no_border"><p>最近添加</p></li>
<%
     sql="select * from onlineshop.cart";
     Statement stmt=coon.createStatement();
     ResultSet rs2=stmt.executeQuery(sql);
     
     while(rs2.next()){
    	/*  rs2.last();  
    	 int size2 = rs.getRow();
    	 rs2.isBeforeFirst();
    	 rs2.next(); 
    	 for(int i=0;i<size2;i++){ */
%> 
              <li>
                <a href="product_page.jsp" class="prev_cart"><span class="cart_vert"><img src="<%=rs2.getString("goodspicture") %>" alt="" title="" /></span></a>
                <div class="cont_cart">
                  <h4><%=rs2.getString("goodsname") %></h4>
                  <div class="price"><%=rs2.getString("goodsnum") %> x ¥<%=rs2.getString("pricebyone") %></div> 
                </div>
                <!-- <a title="close" class="close" href="#"></a> -->
                <div class="clear"></div>
              </li>
<%
    	 }
  
     %>              
              <!-- <li>
                <a href="product_page.jsp" class="prev_cart"><span class="cart_vert"><img src="images/produkt_slid1.png" alt="" title="" /></span></a>
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
        </nav><!-- .private -->
      </div><!-- .grid_6 -->
    </header><!-- #branding -->
  </div><!-- .container_12 -->

  <div class="clear"></div>

  <div id="block_nav_primary">
    <div class="container_12">
      <div class="grid_12">
        <nav class="primary">
          <ul>
            <li class="curent"><a href="index.jsp">首页</a></li>
            <li><a href="catalog_grid.jsp?id=1">苹果</a></li>
            <li><a href="catalog_grid.jsp?id=2">华为</a></li>
            <li><a href="catalog_grid.jsp?id=3">三星</a></li>
            <li>
              <a href="catalog_grid.jsp">其他</a>
              <ul class="sub">
                <li><a href="catalog_grid.jsp?id=4">魅族</a></li>
                <li><a href="catalog_grid.jsp?id=5">小米</a></li>
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
	      <a href="index.jsp">首页</a><span>&#8250;</span><a href="#">类别</a><span>&#8250;</span><span class="current">此页</span>
       </div><!-- .breadcrumbs -->
    </div><!-- .grid_12 -->
  </div><!-- .container_12 -->

  <div class="clear"></div>

  <section id="main">
    <div class="container_12">
       <div id="sidebar" class="grid_3">
	      <aside id="categories_nav">
		     <h3>类别</h3>

		     <nav class="left_menu">
			    <ul>
				    <li><a href="#">苹果 <span>(4)</span></a></li>
				   <li><a href="#">华为 <span> (5)</span></a></li>
				   <li><a href="#">三星 <span>(5)</span></a></li>
				   <li><a href="#">小米 <span>(3)</span></a></li>
				   <li><a href="#">魅族<span>(3)</span></a></li>
			    </ul>
		     </nav><!-- .left_menu -->
	      </aside><!-- #categories_nav -->

	      <!-- <aside id="specials" class="specials">
		     <h3>特价</h3>

		     <ul>
			    <li>
				   <div class="prev">
					  <a href="#"><img src="images/special1.png" alt="" title="" /></a>
				   </div>

				   <div class="cont">
					  <a href="#">金银花无焰光笔芯</a>
					  <div class="prise"><span class="old">¥177.00</span>¥75.00</div>
				   </div>
			    </li>

			    <li>
				   <div class="prev">
					  <a href="#"><img src="images/special2.png" alt="" title="" /></a>
				   </div>

				   <div class="cont">
					  <a href="#">金银花无焰光笔芯</a>
					  <div class="prise"><span class="old">¥177.00</span>¥75.00</div>
				   </div>
			    </li>
		     </ul>
	      </aside>#specials -->
       </div><!-- .sidebar -->

       <div id="content" class="grid_9">
	      <h1 class="page_title"><%out.print(rs.getString("goodsname")); %></h1>

		<div class="product_page">
			<div class="grid_4 img_slid" id="products">
				<img class="sale" src="images/sale.png" alt="Sale"/>
				<div class="preview slides_container">
					<div class="prev_bg">
						<a href="images/produkt_slid.png"   title="">
							<img src="<%out.print(rs.getString("picture")); %>"  title="" alt=""/>
						</a>
					</div>
				</div><!-- .prev -->

				<!-- <ul class="pagination clearfix" id="thumblist">
					<li><a class="zoomThumbActive" href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './images/produkt_slid.png',largeimage: './images/produkt_slid.png'}"><img src='images/produkt_slid.png' alt=""></a></li>
					<li><a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './images/produkt_slid1.png',largeimage: './images/produkt_slid1.png'}"><img src='images/produkt_slid1.png' alt=""></a></li>
					<li><a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './images/produkt_slid2.png',largeimage: './images/produkt_slid2.png'}"><img src='images/produkt_slid2.png' alt=""></a></li>
					<li><a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './images/produkt_slid3.png',largeimage: './images/produkt_slid3.png'}"><img src='images/produkt_slid3.png' alt=""></a></li>
					<li><a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './images/produkt_slid4.png',largeimage: './images/produkt_slid4.png'}"><img src='images/produkt_slid4.png' alt=""></a></li>
				</ul>

				<div class="next_prev">
					<a id="img_prev" class="arows" href="#"><span>Prev</span></a>
					<a id="img_next" class="arows" href="#"><span>Next</span></a>
				</div>. -->
			</div><!-- .grid_4 -->

			<div class="grid_5">
				<div class="entry_content">
					<!-- <div class="review">
						<a class="plus" href="#"></a>
						<a class="plus" href="#"></a>
						<a class="plus" href="#"></a>
						<a href="#"></a>
						<a href="#"></a>
						<span>1条评论</span>
						<a class="add_review" href="#">添加您的评论</a>
					</div> -->
					<p>屏幕大小：<%out.print(rs.getString("screensize")); %></p>
					<p>电池容量：<%out.print(rs.getString("battery")); %></p>
					<p>内存：<%out.print(rs.getString("memory")); %></p>
					<div class="ava_price">
						<div class="availability_sku">
							<div class="availability">
								是否有货: <span>有现货的</span>
							</div>
							<!-- <div class="sku">
								是否: <span>Candles OV</span>
							</div> -->
						</div><!-- .availability_sku -->

						<div class="price">
							<div class="price_new">¥<%out.print(rs.getString("price")); %></div>
							<!-- <div class="price_old">¥725.00</div> -->
						</div><!-- .price -->
					</div><!-- .ava_price -->

					<div class="block_cart">
						<div class="obn_like">
							<!-- <div class="obn"><a href="#" class="obn">加入比较</a></div> -->
							<div class="like"><a href="#" class="like">添加到收藏</a></div>
						</div>

						<div class="cart">
							<%-- <a href="tempcart.jsp?action=add&id=<%=goodsid %>" class="bay">添加到购物车</a> 
							<input type="text" name="buygoodsnum" class="number" value="1" /> --%>
							
							<form name="form3" action="tempcart.jsp?action=add&id=<%=goodsid %>" method="post">
							数量:<input type="text"  name="buygoodsone" value="1" /><br><br>
							<input class="bay" type="submit" value="添加到购物车" />
							</form>
							<!-- <span>数量:</span> -->
						</div>
						<div class="clear"></div>
					</div><!-- .block_cart -->
					<div class="soc">
						<img src="images/soc.png" alt="Soc"/>
					</div><!-- .soc -->
				</div><!-- .entry_content -->

			</div><!-- .grid_5 -->

			<div class="clear"></div>

			<div class="grid_9" >
				<div id="wrapper_tab" class="tab1">
					<a href="#" class="tab1 tab_link">描述</a>
					<!-- <a href="#" class="tab2 tab_link">顾客评论</a> -->
					<!-- <a href="#" class="tab3 tab_link">自定义标签</a> -->

					<div class="clear"></div>

					<div class="tab1 tab_body">
					<h5><% out.println(rs.getString("introduction")); %></h5>
					<div class="clear"></div>
					</div><!-- .tab1 .tab_body -->

					<!-- <div class="tab2 tab_body">
						<h4>顾客评论</h4>
						<ul class="comments">
							<li>
								<div class="autor">Mike Example</div>, <time datetime="2012-11-03">03.11.2012</time>

								<div class="evaluation">
									<div class="quality">
										<strong>质量</strong>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a href="#"></a>
										<a href="#"></a>
									</div>
									<div class="price">
										<strong>价格</strong>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a class="plus_minus" href="#"></a>
										<a href="#"></a>
									</div>
									<div class="clear"></div>
								</div>.evaluation

								<p></p>
							</li>

							<li>
								<div class="autor">Mike Example</div>, <time datetime="2012-11-03">03.11.2012</time>

								<div class="evaluation">
									<div class="quality">
										<strong>质量</strong>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a class="plus_minus" href="#"></a>
									</div>
									<div class="price">
										<strong>价格</strong>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a class="plus" href="#"></a>
										<a href="#"></a>
									</div>
									<div class="clear"></div>
								</div>.evaluation

								<p>网站后台euismod油树恨个ID，就gravida的.aliquam就是所要volutpat.phasellus faucibus venenatis Lorem，简历和purus杜威congue.vestibulum commodo精英pretium.duis rhoncus您家，与前台lectus.sed adipiscing枕。</p>
							</li>
						</ul>.comments

						<form class="add_comments">
							<h4>写你自己的评论</h4>

							<div class="evaluation">
								<div class="quality">
									<strong>质量</strong><sup class="surely">*</sup>
									<input class="niceRadio" type="radio" name="quality" value="1" /><span class="eva_num">1</span>
									<input class="niceRadio" type="radio" name="quality" value="2" /><span class="eva_num">2</span>
									<input class="niceRadio" type="radio" name="quality" value="3" /><span class="eva_num">3</span>
									<input class="niceRadio" type="radio" name="quality" value="4" /><span class="eva_num">4</span>
									<input class="niceRadio" type="radio" name="quality" value="5" /><span class="eva_num">5</span>
								</div>
								<div class="price">
									<strong>价格</strong><sup class="surely">*</sup>
									<input class="niceRadio" type="radio" name="price" value="1" /><span class="eva_num">1</span>
									<input class="niceRadio" type="radio" name="price" value="2" /><span class="eva_num">2</span>
									<input class="niceRadio" type="radio" name="price" value="3" /><span class="eva_num">3</span>
									<input class="niceRadio" type="radio" name="price" value="4" /><span class="eva_num">4</span>
									<input class="niceRadio" type="radio" name="price" value="5" /><span class="eva_num">5</span>
								</div>
								<div class="clear"></div>
							</div>.evaluation

							<div class="nickname">
								<strong>昵称</strong><sup class="surely">*</sup><br/>
								<input type="text" name="" class="" value="" />
							</div>.nickname

							<div class="your_review">
								<strong>你的评论摘要</strong><sup class="surely">*</sup><br/>
								<input type="text" name="" class="" value="" />
							</div>.your_review

							<div class="clear"></div>

							<div class="text_review">
								<strong>评论</strong><sup class="surely">*</sup><br/>
								<textarea name="text"></textarea>
								<i>注意：HTML未翻译！</i>
							</div>.text_review

							<input type="submit" value="Submit Review" />
						</form>.add_comments
					<div class="clear"></div>
					</div>.tab2 .tab_body -->

					<!-- <div class="tab3 tab_body">
						<h4>自定义标签</h4>
					<div class="clear"></div>
					</div>.tab3 .tab_body -->
					<div class="clear"></div>
				</div>​<!-- #wrapper_tab -->
				<div class="clear"></div>
			</div><!-- .grid_9 -->

			<div class="clear"></div>

			<div class="related">
				<div class="c_header">
					<div class="grid_7">
						<h2>相关产品</h2>
					</div><!-- .grid_7 -->

					<div class="grid_2">
						<a id="next_c1" class="next arows" href="#"><span>Next</span></a>
						<a id="prev_c1" class="prev arows" href="#"><span>Prev</span></a>
					</div><!-- .grid_2 -->
				</div><!-- .c_header -->

				<div class="list_carousel">

		     <ul id="list_product" class="list_product">
				<li class="">
            <div class="grid_3 product">
              <img class="sale" src="images/sale.png" alt="Sale"/>
              <div class="prev">
                <a href="product_page.jsp?id=8"><img src="images/product/iPhone7.png" alt="" title="" /></a>
              </div><!-- .prev -->
              <h3 class="title" ><a href="product_page.jsp?id=8">Apple/苹果 iPhone 7全网通4G智能手机原封</a></h3>
              <div class="cart">
                <div class="price">
                <div class="vert">
                  <div class="price_new">¥4798.00</div>
                 <!--  <div class="price_old">¥5725.00</div> -->
                </div>
                </div>
                <a href="#" class="obn"></a>
                <a href="#" class="like"></a>
                <a href="#" class="bay"></a>
              </div><!-- .cart -->
            </div><!-- .grid_3 -->
          </li>

          <li class="">
            <div class="grid_3 product">
              <img class="sale" src="images/sale.png" alt="Sale"/>
              <div class="prev">
                <a href="product_page.jsp?id=2"><img src="images/product/HUAWEI P9.png" alt="" title="" /></a>
              </div><!-- .prev -->
              <h3 class="title"><a href="product_page.jsp?id=2">Huawei/华为 P9全网通正品手机</a></h3>
              <div class="cart">
                <div class="price">
                <div class="vert">
                  <div class="price_new">¥2636.00</div>
                 <!--  <div class="price_old">¥4725.00</div> -->
                </div>
                </div>
                <a href="#" class="obn"></a>
                <a href="#" class="like"></a>
                <a href="#" class="bay"></a>
              </div><!-- .cart -->
            </div><!-- .grid_3 -->
          </li>
					<li class="">
            <div class="grid_3 product">
              <div class="prev">
                <a href="product_page.jsp?id=14"><img src="images/product/mi 6.png" alt="" title="" /></a>
              </div><!-- .prev -->
              <h3 class="title"><a href="product_page.jsp?id=14">Xiaomi/小米 小米手机6全网通手机</a></h3>
              <div class="cart">
                <div class="price">
                <div class="vert">
                  <div class="price_new">¥2999.00</div>
                </div>
                </div>
                <a href="#" class="obn"></a>
                <a href="#" class="like"></a>
                <a href="#" class="bay"></a>
              </div><!-- .cart -->
            </div><!-- .grid_3 -->
          </li>

          <li class="">
            <div class="grid_3 product">
              <img class="sale" src="images/sale.png" alt="Sale"/>
              <div class="prev">
                <a href="product_page.jsp?id=19"><img src="images/product/sanxings8.png" alt="" title="" /></a>
              </div><!-- .prev -->
              <h3 class="title"><a href="product_page.jsp?id=19">Samsung/三星 GALAXY S8公开版全网通手机</a></h3>
              <div class="cart">
                <div class="price">
                <div class="vert">
                  <div class="price_new">¥5688.00</div>
                  <!-- <div class="price_old">¥4725.00</div> -->
                </div>
                </div>
                <a href="#" class="obn"></a>
                <a href="#" class="like"></a>
                <a href="#" class="bay"></a>
              </div><!-- .cart -->
            </div><!-- .grid_3 -->
          </li>

          <li class="">
            <div class="grid_3 product">
              <div class="prev">
                <a href="product_page.jsp?id=12"><img src="images/product/meizu note5.png" alt="" title="" /></a>
              </div><!-- .prev -->
               <h3 class="title"><a href="product_page.jsp?id=12">Meizu/魅族 魅蓝Note5全网通手机</a></h3>
              <div class="cart">
                <div class="price">
                <div class="vert">
                  <div class="price_new">¥1099.00</div>
                  <!-- <div class="price_old">¥1725.00</div> -->
                </div>
                </div>
                <a href="#" class="obn"></a>
                <a href="#" class="like"></a>
                <a href="#" class="bay"></a>
              </div><!-- .cart -->
            </div><!-- .grid_3 -->
          </li>
			        </ul><!-- #list_product -->
				</div><!-- .list_carousel -->
			</div><!-- .carousel -->
		</div><!-- .product_page -->
		<div class="clear"></div>

       </div><!-- #content -->

      <div class="clear"></div>

    </div><!-- .container_12 -->
  </section><!-- #main -->

  <div class="clear"></div>

<footer>
    <div class="f_navigation">
      <div class="container_12">
        <div class="grid_3">
          <h3>关于网站</h3>
          <ul class="f_contact">
            <li>湖北省武汉市青山区建设六路18号 </li>
            <li>+777 (100) 1234</li>
            <li>fenggou@mail.com</li>
          </ul><!-- .f_contact -->
        </div><!-- .grid_3 -->

        <div class="grid_3">
          <h3>信息</h3>
          <nav class="f_menu">
            <ul>
              <li><a href="#">关于我们</a></li>
              <li><a href="#">政策</a></li>
              <li><a href="#">项目</a></li>
              <li><a href="#">保障</a></li>
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->

        <div class="grid_3">
          <h3>顾客服务</h3>
          <nav class="f_menu">
            <ul>
              <li><a href="contact_us.html">联系我们</a></li>
              <li><a href="#">售后服务</a></li>
              <li><a href="#">物流服务</a></li>
              <li><a href="#">退款说明</a></li>
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->

        <div class="grid_3">
          <h3>帮助中心</h3>
          <nav class="f_menu">
            <ul>
              <li><a href="#">购物指南</a></li>
              <li><a href="#">支付方式</a></li>
              <li><a href="#">常见问题</a></li>
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->

        <div class="clear"></div>
      </div><!-- .container_12 -->
    </div><!-- .f_navigation --> 
  </footer>


</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>
