<%-- 
    Document   : index
    Created on : 2016-7-6, 19:04:20
    Author     : Mt.Tao
--%>
<%@page contentType="text/html" pageEncoding="GB2312"%>
<%@ page import="java.sql.*"%>
<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
<%@ include file="systems.jsp" %>
<%
    //获得当前页面路径目录
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    String uname = (String) session.getAttribute("uname");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="<%=Description%>">
        <meta name="Keywords" content="<%=Keywords%>">
        <title><%=Sitename%></title>
        <link rel="stylesheet" href="<%=basePath%>css/style.css">
        <link rel="stylesheet" href="<%=basePath%>css/glide.core.min.css">
        <link rel="stylesheet" href="<%=basePath%>css/glide.theme.min.css">
        <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="js/html5.js"></script>
          <script src="js/respond.js"></script>
        <![endif]-->
    </head>
    <body>
        <%@ include file="inc/header.jsp" %>
        <div class="focus">
            <div class="module module--horizontal">
                <div id="Slideshow" class="glide">

                    <div class="glide__arrows">
                        <button class="glide__arrow prev" data-glide-dir="<">prev</button>
                        <button class="glide__arrow next" data-glide-dir=">">next</button>
                    </div>

                    <div class="glide__wrapper">
                        <ul class="glide__track">
                            <li class="glide__slide">
                                <div class="box"><img src="<%=basePath%>images/2.jpg" style="height: 420px" alt="peer"></div>
                            </li>
                            <li class="glide__slide">
                                <div class="box"><img src="<%=basePath%>images/1.jpg" style="height: 420px" alt="you and me"></div>
                            </li>
                            <li class="glide__slide">
                                <div class="box"><img src="<%=basePath%>images/3.jpg" style="height: 420px" alt="position"></div>
                            </li>
                        </ul>
                    </div>

                    <div class="glide__bullets"></div>

                </div>
            </div>
        </div>
        <div class="container">
            <jsp:include page="inc/top_news.jsp" flush="true"></jsp:include>
            <jsp:include page="inc/news.jsp" flush="true"></jsp:include>
         
            <figure class="left">
                <figcaption><i class="fa fa-file-photo-o"></i>巴黎5日游，我的感想</figcaption>
                <img src="<%=basePath%>images/112.jpg">
            </figure>
            <figure class="left">
                <figcaption><i class="fa fa-file-photo-o"></i>进口法国红葡萄酒到货</figcaption>
                <img src="<%=basePath%>images/113.jpg">
            </figure>
            <div class="clear"></div>
            <div class="update">
                <h1>MiniBarCMS更新内容</h1>
                <span>小型酒吧在线管理系统简称<mark>MiniBarCMS</mark>,于2010年由<mark>Mr.Tao</mark>开发并发布第一个版本</span>
                <div class="course_nr">
                    <ul class="course_nr2">
                        <li>
                            <div class="project">
                                <h2>2010</h2>
                                <p>MiniBarCMS第一版本开发成功。代码冗余，极大的影响了后续的前端重构问题，而且功能简单的minibar系统确拥有17.6M的体积，体积过于庞大</p>
                            </div>
                        </li>
                        <li>
                            <div class="project">
                                <h2>2011</h2>
                                <p><strong>1、</strong>重新改写了一些已知的错误。<br><strong>2、</strong>把FCKediter2.3升级到了FCKeditor2.4.6。<strong><br>3、</strong>更换了前后台Logo图片。</p>
                            </div>
                        </li>
                        <li>
                            <div class="project">
                                <h2>2016</h2>
                                <p><strong>1、</strong>增加Json获取文章数据，商品数据。
                                    <strong>2、</strong>FCKediter更改为ueditor。
                                    <strong>3、</strong>前端重构。
                                    <strong>4、</strong>增加font-awesome字体图标。等10多项优化和更新</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    <%@ include file="inc/footer.jsp" %>
    </body>
</html>
