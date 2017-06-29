<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8" import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>Home</title>

  <link rel="shortcut icon" href="favicon.ico">
  <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">

  <script src="js/jquery-1.7.2.min.js" ></script>
  <script src="js/html5.js" ></script>
  <script src="js/jflow.plus.js" ></script>
  <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>

  <script>
	$(document).ready(function(){
	    $("#myController").jFlow({
			controller: ".control", // must be class, use . sign
			slideWrapper : "#jFlowSlider", // must be id, use # sign
			slides: "#slider",  // the div where all your sliding divs are nested in
			selectedWrapper: "jFlowSelected",  // just pure text, no sign
			width: "984px",  // this is the width for the content-slider
			height: "480px",  // this is the height for the content-slider
			duration: 400,  // time in miliseconds to transition one slide
			prev: ".slidprev", // must be class, use . sign
			next: ".slidnext", // must be class, use . sign
			auto: true
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
          $('#list_product2').carouFredSel({
		prev: '#prev_c2',
		next: '#next_c2',
		auto: false
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
            <a class="cart_li" href="shopping_cart.jsp">购物车</a>
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
  
     %>               
             <!--  <li>
                <a href="product_page.jsp" class="prev_cart"><div class="cart_vert"><img src="images/produkt_slid1.png" alt="" title="" /></div></a>
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
            <li><a href="paging.jsp?id=1">苹果</a></li>
            <li><a href="paging.jsp?id=2">华为</a></li>
            <li><a href="paging.jsp?id=3">三星</a></li>
            <li>
              <a href="catalog_grid.jsp">其他</a>
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
        <div class="slidprev"><span>上一页</span></div>
        <div class="slidnext"><span>下一页</span></div>
        <div id="slider">
          <div id="slide1">
            <img src="images/content/appleslide1.png" alt="" title="" />
          </div>

          <div id="slide2">
            <img src="images/content/huaweislide2.png" alt="" title="" />      
          </div>

          <div id="slide3">
            <img src="images/content/sanxingslide3.png" alt="" title="" />
          </div>
        </div><!-- .slider -->
        <div id="myController">
          <div class="control"><span>1</span></div>
          <div class="control"><span>2</span></div>
          <div class="control"><span>3</span></div>
        </div>


    </div><!-- .grid_12 -->
  </div><!-- .container_12 -->
  
  <div class="clear"></div>

  <section id="main" class="home">
    <div class="container_12">
    
      <div class="clear"></div>

      <div class="carousel">
        <div class="c_header">
          <div class="grid_10">
            <h2>畅销</h2>
          </div><!-- .grid_10 -->

          <div class="grid_2">
            <a id="next_c1" class="next arows" href="#"><span>下一页</span></a>
            <a id="prev_c1" class="prev arows" href="#"><span>上一页</span></a>
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

      <div class="carousel">
        <div class="c_header">
          <div class="grid_10">
            <h2>推荐产品</h2>
          </div><!-- .grid_10 -->

          <div class="grid_2">
            <a id="next_c2" class="next arows" href="#"><span>下一页</span></a>
            <a id="prev_c2" class="prev arows" href="#"><span>上一页</span></a>
          </div><!-- .grid_2 -->
        </div><!-- .c_header -->

        <div class="list_carousel">
        <ul id="list_product2" class="list_product">
          <li class="">
            <div class="grid_3 product">
              <img class="sale" src="images/sale.png" alt="Sale"/>
              <div class="prev">
                <a href="product_page.jsp?id=7"><img src="images/product/iPhone6.png" alt="" title="" /></a>
              </div><!-- .prev -->
              <h3 class="title"><a href="product_page.jsp?id=7">Apple/苹果 iPhone 6全网通4G智能手机正品</a></h3>
              <div class="cart">
                <div class="price">
                <div class="vert">
                  <div class="price_new">¥2578.00 </div>
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
              <img class="sale" src="images/sale.png" alt="Sale"/>
              <div class="prev">
                <a href="product_page.jsp?id=16"><img src="images/product/sanxingc5pro.png" alt="" title="" /></a>
              </div><!-- .prev -->
              <h3 class="title"><a href="product_page.jsp?id=16">Samsung/三星 Galaxy C5 Pro超薄手机</a></h3>
              <div class="cart">
                <div class="price">
                <div class="vert">
                  <div class="price_new">¥2499.00 </div>
                  <!-- <div class="price_old">¥3725.00</div> -->
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
              <h3 class="title"><a href="product_page.jsp?id=12">魅族 Note5全网通公开版4G快充智能手机</a></h3>
              <div class="cart">
                <div class="price">
                <div class="vert">
                  <div class="price_new">¥1550.00</div>
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
                <a href="product_page.jsp?id=13"><img src="images/product/mi 4x.png" alt="" title="" /></a>
              </div><!-- .prev -->
              <h3 class="title"><a href="product_page.jsp?id=13">Xiaomi/小米 红米手机4X超薄迷你智能学生手机</a></h3>
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

          <li class="">
            <div class="grid_3 product">
              <div class="prev">
                <a href="product_page.jsp?id=3"><img src="images/product/huaweimate9.png" alt="" title="" /></a>
              </div><!-- .prev -->
              <h3 class="title"><a href="product_page.jsp?id=3">华为 Mate9 128G 全网通4G智能手机</a></h3>
              <div class="cart">
                <div class="price">
                <div class="vert">
                  <div class="price_new">¥3599.00</div>
                  <!-- <div class="price_old">¥4725.00</div> -->
                </div>
                </div>
                <a href="#" class="obn"></a>
                <a href="#" class="like"></a>
                <a href="#" class="bay"></a>
              </div><!-- .cart -->
            </div><!-- .grid_3 -->
          </li>

        </ul><!-- #list_product2 -->
        </div><!-- .list_carousel -->
      </div><!-- .carousel -->

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
</html>
