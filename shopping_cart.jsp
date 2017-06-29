<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%@page import="java.sql.*" %>
<%-- <%@page import="util.*" %> --%>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>Shoping cart</title>

  <link rel="shortcut icon" href="favicon.ico">
  <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">

  <script src="js/jquery-1.7.2.min.js" ></script>
  <script src="js/html5.js" ></script>
  <script src="js/jflow.plus.js" ></script>
  <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
  <script src="js/checkbox.js"></script>
  <script src="js/radio.js"></script>
  <script src="js/selectBox.js"></script>

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
  <script>
       $(document).ready(function() {
	      $("select").selectBox();
       });
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

  <section id="main" class="entire_width">
    <div class="container_12">
       <div class="grid_12">
       <h1 >购物车</h1>

       <table class="cart_product">
	      <tr>
		     <th class="images"></th>
		     <th class="bg name">产品名称</th>
		     <!-- <th class="edit"> </th> -->
		     <th class="bg price">单价</th>
		     <th class="qty">数量</th>
		     <th class="bg subtotal">总价</th>
		     <th class="close"> </th>
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
		     <!-- <td class="edit"><a title="Edit" href="#">Edit</a></td> -->
		     <td class="bg price">¥<%=rs.getDouble("pricebyone") %></td>
		     <td class="qty" align="center">
		     <form name="form4" action="tempcartupdate.jsp?action=update&id=<%=rs.getInt("cartid") %>" method="post">
		     <input type="text" name="updatebuygoodsnum" value="<%=rs.getInt("goodsnum") %>" placeholder="1000" />
		     <input class="update" type="submit" value="刷新">
		     </form>
		     </td>
		     <td class="bg subtotal">¥<%=rs.getDouble("totalprice") %></td>
		     <td class="close"><a title="close" class="close" href="tempcartdelete.jsp?id=<%=rs.getInt("cartid") %>"></a></td>
	      </tr>
<%	 
        
        sum+=rs.getDouble("totalprice");
        
    }
    out.print(sum);
%>   
	      
	      <tr>
		     <td colspan="7" class="cart_but">
			    <a href="index.jsp"><button class="continue"><span>icon</span>继续购物</button></a>		    
			    <!-- <button class="update"><span>icon</span>更新购物车</button> -->
		     </td>
	      </tr>
       </table>
       </div><!-- .grid_12 -->

       <div id="content_bottom">
        <div class="grid_4">
          <div class="bottom_block total">
	      <table class="subtotal">
<%
 /*  rs.last();
  int a=rs.getRow();
  for(int i=0;i<a;i++){
	  double sum=0;
      sum+=rs.getDouble("totalprice");
  } */
  
%>	      
		     <tr>
			    <td>小计</td><td class="price">¥<%=sum %></td>
		     </tr>
		     <tr class="grand_total">
			    <td>总计</td><td class="price">¥<%=sum %></td>
		     </tr>
	      </table>
	       <a href="checkout.jsp"><button class="checkout">继续结帐</button></a>
          </div><!-- .total -->
        </div><!-- .grid_4 -->
<%
    stmt.close();
    rs.close();
    conn.close();
%>
        <div class="clear"></div>
      </div><!-- #content_bottom -->
      <div class="clear"></div>

      <div class="clear"></div>

      <div class="carousel" id="following">
        <div class="c_header">
          <div class="grid_10">
            <h5>根据您的选择，您可能对以下项目感兴趣:</h5>
          </div><!-- .grid_10 -->

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
