<%@page import="uuu.ogkm.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="uuu.ogkm.service.ProductService"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <!-- <meta charset="UTF-8" /> -->
  <!--設定手機行動版-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/fancybox3/jquery.fancybox.css">
  <script src="https://kit.fontawesome.com/14c95c3413.js" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src='<%=request.getContextPath() %>/fancybox3/jquery.fancybox.js'></script>

  <title>翁卡克MUISC</title>
  <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico">

</head>

<body>
  <jsp:include page="/SubViews/NAV.jsp"/>

  <div id="muiscmenu">
    <ul class="muiscmenu">
      <li><a href="<%=request.getContextPath()%>/store.jsp?page=1">全部</a></li>
      <li><a href="<%=request.getContextPath()%>/store.jsp?category=JPOP&page=1">J-POP</a></li>
      <li><a href="<%=request.getContextPath()%>/store.jsp?category=ANIME&page=1">ANIME</a></li>
      <li><a href="<%=request.getContextPath()%>/store.jsp?category=VOCALOID&page=1">VOCALOID</a></li>
      <li><a href="<%=request.getContextPath()%>/store.jsp?category=VTuber&page=1">VTuber</a></li>
      <li><a href="<%=request.getContextPath()%>/storeSurrounding.jsp?page=1">周邊</a></li>
    </ul>
  </div>

  <% //1.取得REQUEST的FORM DATA 
  String keyword=request.getParameter("keyword");
  String category=request.getParameter("category");
  String pages = request.getParameter("page");
  //後續加上分類查詢

  //2.呼叫商業邏輯 
    ProductService ps=new ProductService(); 
    List<Product> list;
    if (keyword != null && keyword.length() > 0) {
      list = ps.getSelectProductsByName(keyword,pages);
    } else {
      list = ps.getSelectProductsByCategory("Surrounding",pages);
    }
  %>

    <div id="storepackage">
      <div class="songcontent">
        <%
          if (list !=null && list.size()> 0) {
          for (int i = 0; i < list.size(); i++) { 
        	  Product p=list.get(i);
        %>
            <div class="picturebag">
              <a href="javascript:getProduct1(<%=p.getId()%>)">
                <img class="productimg" src="<%=p.getPhotoUrl()%>" onerror='getMPERRImg(this)'>
              </a>
              <a href="ProductDescriptionmain1.jsp?productId=<%=p.getId()%>">
                <div class="pictureword">
                  <div><%=p.getName()%></div>
                  <div><%=p.getSinger()%></div>
                </div>
              </a>
            </div>
        <% } } else { %>
          <p>查無產品</p>
        <% } %>
      </div>
    </div>
    <div id="pfancybox"></div>
    <!--商品 END-->

    <jsp:include page="/SubViews/IntroductionColumn.jsp"></jsp:include>

    <!--內容結束-->
    <style>
      body {
        margin: 0;
        border: 0;
        padding: 0;
        max-width: 100%;
      }

      /*選單*/
      #muiscmenu {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 100%;
        margin-bottom: 0.25em;
        padding-top: 3.5em;
      }

      .muiscmenu {
        display: flex;
        justify-content: space-evenly;
        width: 100vw;
        max-width: 100%;
        height: 100%;
        min-height: 2em;
        background: linear-gradient(0deg, #f5f5f5 10%, #e6e6e6 30%, #e6e6e6 60%, #f5f5f5 90%);
        margin: 0;
        padding: 0;
                box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;
      }

      .muiscmenu li {
        display: flex;
        flex-direction: column;
        justify-content: center;
        list-style: none;
        /* 移除項目符號 */
      }

      .muiscmenu li a {
        color: #0e0c0c;
        text-decoration: underline #0a0707;
        font-size: 2.5vw;
      }

      .muiscmenu :hover {
        color: #adaaab;
        text-decoration: underline #adaaab;
      }

      /*選單 END*/

      #storepackage {
        display: grid;
        grid-template-columns:1fr;
        grid-template-rows: auto;
        grid-gap: 1em;
        padding: 0% 0em;
        margin-bottom: 1em;
        
      }

      /*商品表*/
      .songcontent {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-template-rows: repeat(3, 1fr);
        grid-gap: 1em;
        padding: 1em 1em;
        justify-items: center;
        align-items: center;
        background: linear-gradient(45deg, #c0bfbf 30%, #9b9b9b 70%);
       background: #e6e6e6;
      }

      .picturebag {
        width: 100%;
        border-radius:10PX;
        background: linear-gradient(45deg, #c0bfbf 30%, #9b9b9b 70%);
        box-shadow: rgba(136, 165, 191, 0.48) 6px 2px 16px 0px, rgba(255, 255, 255, 0.8) -6px -2px 16px 0px;
      box-shadow: rgba(0, 0, 0, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;
      }

      .picturebag a {
        text-decoration: none;
      }

      .picturebag img {
        transition: transform 1s ease;
        width: 100%;
        height: 20em;
        margin: auto;
        border-radius:10PX;
        transform: scale(0.95, 0.95);
        transition: box-shadow 500ms;
      }

      .picturebag img:hover {
        box-shadow: 0 0 2px 2px rgba(250, 187, 14, 0.9);
       
        transform: scale(1, 1);
        transition: transform 0.001s;
      }

      .pictureword {
        width: 100%;
      }

      .pictureword div {
        margin: 0;
        height: 1.5em;
        width: 25vw;
        max-width: 100%;
        white-space: nowrap;
        /*固定一行*/
        overflow: hidden;
        /*過長隱藏*/
        text-overflow: ellipsis;
        /*過長變...*/
      }

      /*商品表 END*/
      #pfancybox {
        display: none;
      }

      .fancybox__content {
        padding: 1em;
      }
      @media (max-width : 800px) {
      .picturebag img {
        height: 17.5em;
        }
      }
      @media (max-width : 600px) {
      .picturebag img {
        height: 12.5em;
        }
      }
    </style>

    <script>
    //周邊購買頁面
      function getProduct1(pId) {
        var xhr = $.ajax({
          url: 'ProductDescriptionajax1.jsp?productId=' + pId,
          method: 'GET'
        }).done(getProductDoneHandler);
      }

      function getProductDoneHandler(data, textStatus, jqXHR) {
        $("#pfancybox").html(data);
        $("#pfancybox").css('height', 'fit-content');
        $.fancybox.open({
          src: '#pfancybox', type: 'inline',
          opts: {
            afterShow: function (instance, current) {
              console.info('done!');
            }
          }
        });
      }

      //錯誤圖片
      function getMPERRImg(theImg) {
        theImg.src = '<%=request.getContextPath()%>/images/MPERR.png';
        theImg.onerror = null;
      }
    </script>
</body>

</html>