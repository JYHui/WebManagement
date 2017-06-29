<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>Proceed to checkout</title>

  <link rel="shortcut icon" href="favicon.ico">
  <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">
 
  <script src="js/jquery-1.7.2.min.js" ></script>
  <script src="js/html5.js" ></script>
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
	  $('#list_banners').carouFredSel({
		prev: '#ban_prev',
		next: '#ban_next',
		scroll: 1,
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
  </div><!-- container_12 -->
  
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
			<h1 class="page_title">结帐</h1>
		</div><!-- .grid_12 -->

   <div class="shoppingCart comWidth">
	<div class="shopping_item">
		<h4 class="shopping_tit">收货地址</h4>
		<div class="shopping_cont padding_shop">
			<ul class="shopping_list">
				<li><span class="shopping_list_text"><em>*</em>选择地区：</span>
					<select>
					        <option class="shopping_list_text">北京</option>
							<option class="shopping_list_text">上海</option>
							<option class="shopping_list_text">重庆</option>
							<option class="shopping_list_text">江西</option>
					</select>

				</li>
				<li><span class="shopping_list_text"><em>*</em>详细地址：</span><input type="text" value="最多输入20个汉字" class="input input_b"></li>
				<li><span class="shopping_list_text"><em>*</em>收 货 人：</span><input type="text" value="最多10个" class="input"></li>
				<li><span class="shopping_list_text"><em>*</em>手	机：</span><input type="text" value="如：12312312" class="input"><span class="cart_tel">&nbsp;或固定电话：</span><input type="text" class="input input_s"><span class="jian">-</span><input type="text" class="input input_s2"><span class="jian">-</span><input type="text" class="input input_s2"></li>
<!-- 				<li><input type="button" class="affirm"></li> -->
			</ul>
		</div>
	</div>
	
	<div class="clear"></div>
	
   <div class="hr_25"></div> 
	<div class="shopping_item">
		<h3 class="shopping_tit">支付方式</h3>
		<div class="shopping_cont padding_shop">
			<ul class="shopping_list">
				<li><input type="radio" class="radio" id="r1"><label for="r1">微信支付</label></li>
				<li><input type="radio" class="radio" id="r2"><label for="r2">支付宝支付</label></li>
				<li><input type="radio" class="radio" id="r3"><label for="r3">银行卡支付</label></li>
			</ul>
		</div>
	</div>

  <!-- <section id="main" class="entire_width"> -->
    <div class="container_12">
       <div class="grid_12">
       <table class="cart_product">
	      <tr>
		     <th class="images"></th>
		     <th class="bg name">产品名称</th>
		     <!-- <th class="edit"> </th> -->
		     <th class="qty">单价</th>
		     <th class="bg subtotal">数量</th>
		     <th class="qty">总价</th>
		     <!-- <th class="close"> </th> -->
	      </tr>
<%
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost:3306/onlineshop";
    String user="root";
    String passwd="admin";
    Connection conn=DriverManager.getConnection(url,user,passwd);

    String sql="select * from onlineshop.cart";
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    double sum=0;
    while(rs.next()){
%> 
	      <tr>
		     <td class="images"><a href="product_page.html"><img src="<%=rs.getString("goodspicture") %>" alt="Product 6"></a></td>
		     <td class="bg name"><%=rs.getString("goodsname") %></td>
		    <!--  <td class="edit"><a title="Edit" href="#">Edit</a></td> -->
		     <td class="qty">¥<%=rs.getDouble("pricebyone") %></td>
		     <td class="bg subtotal"><%=rs.getInt("goodsnum") %></td>
		     <td class="qty">¥<%=rs.getDouble("totalprice") %></td>
		     <!-- <td class="close"><a title="close" class="close" href="#"></a></td> -->
	      </tr>
<%	
     sum+=rs.getDouble("totalprice");
    }
%>	
	      <!-- <tr>
		     <td class="images"><a href="product_page.html"><img src="images/produkt_slid1.png" alt="Product Slide 1"></a></td>
		     <td class="bg name">California Scents Spillproof Organic Air Fresheners,<br/> Coronado Cherry, 1.5 Ounce Cannister</td>
		     <td class="edit"><a title="Edit" href="#">Edit</a></td>
		     <td class="qty">¥75.00</td>
		     <td class="bg subtotal">2</td>
		     <td class="qty">¥750.00</td>
		     <td class="close"><a title="close" class="close" href="#"></a></td>
	      </tr> -->
	     <!--  <tr>
		     <td colspan="7" class="cart_but">
			    <button class="continue"><span>icon</span>继续购物</button>
			    <button class="update"><span>icon</span>更新购物车</button>
		     </td>
	      </tr> -->
       </table>
       </div><!-- .grid_12 -->
 
       <div class="grid_4">
          <div class="bottom_block total">
	      <table class="subtotal">
		     <tr>
			    <td>小计</td><td class="price">¥<%=sum %></td>
		     </tr>
		     <tr class="grand_total">
			    <td>总计</td><td class="price">¥<%=sum %></td>
		     </tr>
	      </table>
	    <button class="checkout">提交订单</button>
<!--             <a href="#">多地址校验</a> -->
          </div><!-- .total -->
       </div><!-- .grid_4 -->
<%	
   
    stmt.close();
    rs.close();
    conn.close();
%>       
       </div><!-- .container_12 -->
        
       </div>
	   </div>
	   </div>
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