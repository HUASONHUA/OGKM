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
      <li><a href="<%=request.getRequestURI()%>">全部</a></li>
      <li><a href="<%=request.getRequestURI()%>?NEW">NEW</a></li>
      <li><a href="<%=request.getRequestURI()%>?category=JPOP">J-POP</a></li>
      <li><a href="<%=request.getRequestURI()%>?category=ANIME">ANIME</a></li>
      <li><a href="<%=request.getRequestURI()%>?category=VOCALOID">VOCALOID</a></li>
      <li><a href="<%=request.getRequestURI()%>?category=VTuber">VTuber</a></li>
      <li><a href="<%=request.getContextPath()%>/storeSurrounding.jsp">周邊</a></li>
<%--       <li><a href="<%=request.getRequestURI()%>?category=Surrounding">周邊</a></li> --%>
    </ul>
  </div>

  <% //1.取得REQUEST的FORM DATA 
    String keyword=request.getParameter("keyword");
    String category=request.getParameter("category");
    String NEW=request.getParameter("NEW");
    String keywordname=request.getParameter("keywordname");
    String keywordsinger=request.getParameter("keywordsinger");
    //後續加上分類查詢

    //2.呼叫商業邏輯
    ProductService ps=new ProductService();
    List<Product> list;
    if (keyword != null && keyword.length() > 0) {
      list = ps.getSelectProductsByName(keyword);
    } else if (category != null && category.length() > 0) {
      list = ps.getSelectProductsByCategory(category);
    } else {
      list = ps.getAllNewProducts();
    }
  %>

  <div id="storepackage">
    <div class="rank">
      <div id="ranksinger">
        <ul>
          <h2>歌手排行</h2>
          <%  ProductService psSingerTop10=new ProductService();
              List<Product> listSingerTop10;
              listSingerTop10 = psSingerTop10.getselectProductsBySingerTop10();
              if (listSingerTop10 !=null && listSingerTop10.size()> 0) {
                for(int i=0;i<listSingerTop10.size();i++) {
                Product pSingerTop10=listSingerTop10.get(i);
          %>
          <li><a><%=pSingerTop10.getSinger() %></a></li>
          <% } } %>
        </ul>
      </div>
      <div id="ranksong">
        <ul>
          <h2>歌曲排行</h2>
           <% ProductService psSongTop10=new ProductService();
             List<Product> listSongTop10;
             listSongTop10 = psSongTop10.getselectProductsBySingerTop10();
             if (listSongTop10 != null && listSongTop10.size() > 0) {
               for(int i=0;i<listSingerTop10.size();i++) {
            	 Product pSongTop10=listSongTop10.get(i);
           %>
           <li><a><%=pSongTop10.getName() != null ? pSongTop10.getName() : "" %></a></li>
           <% } } %>
        </ul>
      </div>
    </div>

    <div class="songcontent">
      <% if (list !=null && list.size()> 0) {
        for (int i = 0; i < list.size(); i++) {
          Product p=list.get(i);
      %>
          <div class="picturebag">
            <a href="javascript:getProduct(<%=p.getId()%>)">
              <img class="productimg" src="<%=p.getPhotoUrl()%>" onerror='getMPERRImg(this)'>
            </a>
            <a href="ProductDescriptionmain.jsp?productId=<%=p.getId()%>">
              <div class="pictureword">
                <div><%=p.getName()%></div>
                <div><%=p.getSinger()%></div>
              </div>
            </a>
          </div>
        <% } } else { %>
          <p>查無產品</p>
      <%}%>
      </div>
    </div>
    <div id="pfancybox"></div>
    <!--商品 END-->

    <jsp:include page="/SubViews/IntroductionColumn.jsp"/>

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
        grid-template-columns: 15em 1fr;
        grid-template-rows: auto;
        grid-gap: 1em;
        padding: 0% 0em;
        margin-bottom: 1em;
        grid-template-areas: "rank songcontent"
      }

      /*排行榜*/
      .rank {
        grid-area: rank;
        display: grid;
        grid-template-rows: repeat(2, 28.5em);
        grid-gap: 1em;
        padding-left: 0.5em;
      }

      /*歌手排行
      #ranksinger {
        box-shadow: #000 1px 1px 5px 0px;
        box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset, rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;
        background-color: rgba(36, 36, 36,0.65);
      }
      */

      /*歌手排行 - 玻璃質感*/
      #ranksinger {
        position: relative;
        background: #1c0619e8;
        border: 1px solid #191919;
        border-radius: .4em;
        box-shadow: inset 2px 3px 0px 0px rgb(1 5 12 / 81%), 2px 3px 0px 0px rgba(0, 0, 0, 0.4);
        transform: perspective(1000px) rotateX(4deg);
      }
      #ranksinger:after {
        position: absolute;
        content: "";
        display: block;
        pointer-events: none;
        top: 0;
        left: 70%;
        width: 100%;
        height: 100%;
        transform: skew(18deg);
        background: linear-gradient(
          to bottom,
          hsla(0, 0%, 100%, 0.1) 0%,
          hsla(0, 0%, 100%, 0) 100%
        );
      }

      #ranksinger ul {
        height: 100%;
        counter-reset: section;
        margin: 0 1em;
        padding: 0;
        display: flex;
        flex-direction: column;
        justify-content: center;
        counter-reset: section;
      }

      #ranksinger h2 {
        margin: 0;
        color: #d6d6d6;
      }

      #ranksinger li:before {
        counter-increment: section;
        content: counter(section);
        display: inline-block;
        padding: 0 1em;
        margin-right: 1em;
        height: 2em;
        line-height: 2em;
        color: #000;
        background: #FFFFF0;
        border-radius: 3px;
        font-size: 0.8em;
      }

      #ranksinger li {
        width: 100%;
        border-bottom: 1px solid #FFF;
        line-height: 2em;
        height: 2em;
        overflow: hidden;
        color: #FFF;
        font-size: 1em;
      }

      /*前三名顏色*/
      #ranksinger li:nth-child(2):before {
        background: #FAFF72;
      }

      #ranksinger li:nth-child(3):before {
        background: #E9E7EF;
      }

      #ranksinger li:nth-child(4):before {
        background: #F2BE45;
      }

      /*前三名顏色 END*/
      #ranksinger li:nth-child(11):before {
        margin-right: 0.5em;
      }

      /*歌手排行 END*/

      /*歌曲排行 - 玻璃質感*/
      #ranksong {
        position: relative;
        background: #532503;
        border: 1px solid #191919;
        border-radius: .4em;
        box-shadow: inset 2px 3px 0px 0px rgb(1 5 12 / 81%), 2px 3px 0px 0px rgba(0, 0, 0, 0.4);
        transform: perspective(1000px) rotateX(4deg);
      }

      #ranksong:after {
        position: absolute;
        content: "";
        display: block;
        pointer-events: none;
        top: 0;
        left: 70%;
        width: 100%;
        height: 100%;
        transform: skew(18deg);
        background: linear-gradient(
          to bottom,
          hsla(0, 0%, 100%, 0.1) 0%,
          hsla(0, 0%, 100%, 0) 100%
        );
      }

      #ranksong ul {
        height: 100%;
        counter-reset: section;
        margin: 0 1em;
        padding: 0;
        display: flex;
        flex-direction: column;
        justify-content: center;
        counter-reset: section;
      }

      #ranksong h2 {
        margin: 0;
        color: #d6d6d6;
      }

      #ranksong li:before {
        counter-increment: section;
        content: counter(section);
        display: inline-block;
        padding: 0 1em;
        margin-right: 1em;
        height: 2em;
        line-height: 2em;
        color: #000;
        background: #FFFFF0;
        border-radius: 3px;
        font-size: 0.8em;
      }

      #ranksong li {
        width: 100%;
        border-bottom: 1px solid #FFF;
        line-height: 2em;
        height: 2em;
        overflow: hidden;
        color: #FFF;
        font-size: 1em;
      }

      /*前三名顏色*/
      #ranksong li:nth-child(2):before {
        background: #FAFF72;
      }

      #ranksong li:nth-child(3):before {
        background: #E9E7EF;
      }

      #ranksong li:nth-child(4):before {
        background: #F2BE45;
      }

      /*前三名顏色 END*/
      #ranksong li:nth-child(11):before {
        margin-right: 0.5em;
      }
      /*歌曲排行 END*/

      /*排行榜 END*/

      /*商品表*/
      .songcontent {
        grid-area: songcontent;
        display: grid;
        grid-template-columns: repeat(5, 1fr);
        grid-template-rows: repeat(4, 1fr);
        grid-gap: 1em;
        padding: 1em 1em 1em 1em;
        justify-items: center;
        align-items: center;
        background: linear-gradient(45deg, #c0bfbf 30%, #9b9b9b 70%);
        position: relative;
        overflow: scroll;
        height:55em;
      }

      .songcontent::-webkit-scrollbar{
        width: 0.5em;
        height: 0;
        }
        /*垂直滾動條和水平滾動條时交匯的部分 與 滾動條軌道*/
        .songcontent::-webkit-scrollbar-corner,
        .songcontent::-webkit-scrollbar-track{
        display: none;
        }
        /*滾動條 滑條*/
        .songcontent::-webkit-scrollbar-thumb{
        border-radius: 1em;
        background-color:rgba(112, 112, 112,0.5);
        }

      .picturebag {
        width: 100%;
      }

      .picturebag a {
        text-decoration: none;
      }

      .picturebag img {
        transition: transform 1s ease;
        width: 100%;
        height: 10em;
        margin: auto;
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
        width: 15vw;
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

      @media (min-width : 800px) AND (max-width : 1500px) {
        .songcontent {
          grid-area: songcontent;
          display: grid;
          grid-template-columns: repeat(4, 1fr);
          grid-template-rows: repeat(5, 1fr);
          height: 69em;
        }
      }
      /*小於1024PX*/
      @media (max-width : 800px) {
        #storepackage {
          display: grid;
          grid-template-columns: 1fr;
          grid-template-rows: 1fr auto;
          padding: 0% 0em;
          grid-template-areas: "songcontent""rank";
        }

        .muiscmenu li a {
          font-size: 3.5vw;
        }

        .rank {
          grid-area: rank;
          display: grid;
          grid-template-columns: repeat(2, 1fr);
          grid-template-rows: 1fr;
          padding: 0 1em;
          height: 100%;
        }

        /*歌手排行 800PX以下時*/
        #ranksinger li:before {
          padding: 0 0.8em;
          margin-right: 1.2em;
          font-size: 0.6em;
        }

        /*歌曲排行 800PX以下時*/
        #ranksong li:before {
          padding: 0 0.8em;
          margin-right: 1.2em;
          font-size: 0.6em;
        }

        .songcontent {
          grid-area: songcontent;
          display: grid;
          grid-template-columns: repeat(4, 1fr);
          grid-template-rows: repeat(5, 1fr);
          height: 64.5em;
        }

        .picturebag img {
          height: 9em;
        }
      }

      /*小於1024PX END*/
    </style>

    <script>
      function getProduct(pId) {
        var xhr = $.ajax({
          url: 'ProductDescriptionajax.jsp?productId=' + pId,
          method: 'GET'
        }).done(getProductDoneHandler);
      }

//       function getProduct1(pId) {
//         var xhr = $.ajax({
//           url: 'ProductDescriptionajax1.jsp?productId=' + pId,
//           method: 'GET'
//         }).done(getProductDoneHandler);
//       }

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