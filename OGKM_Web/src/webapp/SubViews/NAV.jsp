<%@page import="uuu.ogkm.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>

<!-- <head> -->
<!-- <meta charset="UTF-8" /> -->
<!--設定手機行動版-->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/fancybox3/jquery.fancybox.css"> --%>
<!-- <script src="https://kit.fontawesome.com/14c95c3413.js" crossorigin="anonymous"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<%-- <script src='<%=request.getContextPath() %>/fancybox3/jquery.fancybox.js'></script> --%>

<!-- <title>翁卡克MUISC</title> -->
<%-- <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico"> --%>
<!-- </head> -->

<!-- <body> -->
	<nav class="header">
		<!--LOGO-->
		<div class="logo">
			<a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/images/LOGO.png"></a>
		</div>
		<!--LOGO/-->
		<%
		Customer member = (Customer) session.getAttribute("member");
		%>
		<!--選單-->
		<div id="#menu">
			<ul class="menu">
				<form class="searchbag" action="/OGKM/store.jsp" method="GET">
					<input type="search" name="keyword" placeholder="SEARCH"
						value="${param.keyword != null ? param.keyword : ''}"> <input type="submit" value="搜尋">
				</form>
				<li><a href="<%=request.getContextPath()%>"><i class="fas fa-home"></i>
						<p>首頁</p> </a></li>
				<li><a href="<%=request.getContextPath()%>/store.jsp">
				<i class="fas fa-archive"></i>
						<p>商店</p> </a></li>
				<li><a href="<%=request.getContextPath()%>/register.jsp"><i
						class="fas fa-edit"></i>
						<p>註冊</p> </a></li>
				<!--未登入出現-->
				<% if (member == null) { %>
				<li><a href="<%=request.getContextPath()%>/login.jsp"><i
						class="fas fa-sign-in-alt"></i>
						<p>登入</p> </a></li>	
				<!--登入出現-->
				<% } else { %>
				<li><a href="<%=request.getContextPath()%>/logout.do"><i
						class="fas fa-sign-out-alt"></i>
						<p>登出</p> </a></li>
				<% } %>
				<li><a href="<%=request.getContextPath()%>/member/member.jsp"><i class="fas fa-user"></i>
						<p class="username"><%=member!=null?member.getName():"用戶" %> </p></a></li>
				<!--登入出現-->
				<%--if (member != null) { --%>
				<li><a href="<%=request.getContextPath()%>/member/cart.jsp">
				<i class="fas fa-cart-arrow-down"></i>
				<span class='cartQty'>${sessionScope.cart.getTotalQuantity()}</span>
				<p>購物車</p> </a></li>
						
				<%--} --%>
				<li class="lastli"><a href="<%=request.getContextPath()%>/member/MUSIC.jsp"><i
				class="fas fa-headphones-alt"></i>
				<p>線上聽</p> </a></li>
				<li class="lastli"><a href="#ABUS"><i
						class="fas fa-exclamation-circle"></i>
						<p>關於</p> </a>
						</li>
<!-- 				<a href="#" class="burgerclose"><i class="fas fa-times"></i></a> -->
			</ul>
			<!--漢堡-->
			<a href="#" id="burger"><i class="fas fa-bars"></i></a>
		</div>
	</nav>

	<!--CSS-->
	<style>
	
body {
	margin: 0;
	border: 0;
	padding: 0;
}
/*NAV選單*/
.header {
	/*header 設定成 menu 選單的相對定位父元素*/
	display:flex;
	justify-content:space-between;
	width: 100%;
	background: linear-gradient(0deg, #798c99 35%, #26262c 60%);
	background: -moz-linear-gradient(0deg, #798c99 35%, #26262c 60%);
	/*moz代表firefox*/
	background: -webkit-linear-gradient(0deg, #798c99 35%, #26262c 60%);
	/*webkit代表chrome*/
	background: -o-linear-gradient(45deg, #8BC0E3 35%, #5247CF 60%);
	/*o代表opera*/
	height: 3.2em;
	/* border-bottom: 3px solid rgb(6, 151, 247);*/
	/*導覽列底線顏色*/
	position: fixed;
	/*box-shadow:1px 1px 10px #000;/*陰影效果*/
	z-index: 500;
}

.logo {
	display: flex;
}

.logo img {
	position: absolute;
	height: 3.5em;
}

/*選單*/
.menu {
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
	margin: 0px;
	padding: 0px;
}

.searchbag {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-right: 2em;
}

.searchbag input[type="search"] {
	width: 20vw;
	height: 2em;
}

.searchbag input[type="submit"] {
	width: 5em;
	height: 2em;
}

.menu li {
	float: left;
	width: 3.5em;
	list-style: none;
	/* 移除項目符號 */
}

.menu li a {
	display: block;
	color: #40dfd7;
	/*選單文字顏色*/
	text-decoration: none;
	padding: 0.9em 0em 0.3em 0em;
	text-align: center;
	/*文字置中*/
}

.menu li a:hover {
	background: radial-gradient(circle at top, #5247CF 50%, #528fe4 70%, #8BC0E3 80%);
	border-radius: 0px 0px 10px 10px;
	-webkit-border-radius: 0px 0px 10px 10px;
	-moz-border-radius: 0px 0px 10px 10px;
	color: #fff;
}

.menu li a p {
	margin: 0px 0px;
}

.menu .lastli {
	border: none;
}

.username {
white-space: nowrap;
	overflow: hidden;
}
/*漢堡選單*/
#burger {
	display: none;
	/*在PC上隱藏漢堡選單*/
	color: #ffffff;
	
}

.burgerclose {
	display: none;
	/*在PC上隱藏漢堡選單*/
	color: #e94040;
}

/*出現漢堡選單*/

@media ( max-width : 800px) {
	.menu {
		width: 100%;
		/* 選單出現*/
		display: block;
		/*隱藏選單開始*/
		max-height: 0;
		overflow: hidden;
		/*隱藏選單結束*/
		/*漸變效果*/
		transition: max-height 1s;
		margin-top: 0px;
		/*絕對定位疊在網頁上*/
		position: absolute;
		/*權重*/
		z-index: 100;
		/*header 線條距離*/
		top: 3.2em;
		/* left:0 right:0表示滿版 */
		text-align: center;
		left: max-content;
		right: 0;
		height: 100vh;
		background: rgba(0,0,0,0.8);
	}
	.searchbag {
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 1em 0;
		background: linear-gradient(90deg, #65b1dd 35%, #5c87e2 60%);
		margin-right: 0em;
	}
	.searchbag input[type="search"] {
		width: 50vw;
		height: 2em;
	}
	.logo {
		width: 100%;
		display: flex;
		justify-content: center;
	}
	.menu li {
		flex-direction: column;
		width: 100%;
		align-items: flex-end;
		background: linear-gradient(90deg, #65b1dd 35%, #5c87e2 60%);
		border-bottom: 1px dashed #5452df;
	}
	.menu li a {
		transition: all 0.3s;
		color: #290ab1;
		padding: 0.8em 1em;
	}
	.menu li a:hover {
		border-radius: 0px 0px 0px 0px;
		-webkit-border-radius: 0px 0px 0px 0px;
		-moz-border-radius: 0px 0px 0px 0px;
		background: radial-gradient(circle at 100%, #5247CF 40%, #528fe4 60%, #8BC0E3 80%);
		color: #fff;
	}
	#burger {
		display: flex;
		justify-content:flex-end;
		font-size: 2.5em;
		margin: 0.25em 0.25em 0 0;
		text-decoration: none;
		/* 移除超連結底線 */
	}
	.fa-times {
	width:35px;
 
		color: #c4c4c4;
		text-decoration: none;
	}
	.fa-times:hover {
		color: azure;
	}

	/*jQuery點擊後動態在 body 加上 class 影響選單高度*/
	.burger-show .menu {
		max-height: 100vh;
	}
}

@media ( max-width : 499px) {
	.menu {
		overflow:scroll;
	}
}
/*NAV選單END*/
</style>

	<script>
	
		/*NAV選單*/
		$(document).ready(function() {
			$('#burger').on('click', function(event) {
				//$(".burgerclose").click(hideHandler);
				// 忽略讓原來 <a> 標籤本身的連結功能
				event.preventDefault();
				$('body').toggleClass('burger-show');//body新增toggleclass(開關class)
				/*  如果某個類別存在，就刪除他，若不存在就新增。*/
			});
			
		});
		var burger = document.getElementById("burger");
		burger.addEventListener("click", function(e){
		  if(e.target.classList.contains('fa-bars')){
		    e.target.classList.remove('fa-bars');
		    e.target.classList.add('fa-times');
		    $('body').toggleClass('burger-show', false);
		  }else{
		    e.target.classList.remove('fa-times');
		    e.target.classList.add('fa-bars')
		    $('body').toggleClass('burger-show', true);
		  }
		});

// 		$(document).mouseup(function(event) {
// 			var con = $('.searchbag');
// 			var con1 = $('.searchbag input[type="search"]');
// 			if (!con.is(event.target) && !con1.is(event.target)) {
// 				$('body').toggleClass('burger-show', false);
// 			}
// 		});

// 		function hideHandler(e) {
// 			$('body').toggleClass('burger-show', false);
// 			event.preventDefault();
// 			e.stopPropagation();
// 		}
	</script>
<!-- </body> -->