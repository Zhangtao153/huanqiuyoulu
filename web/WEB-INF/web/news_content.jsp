<%--
  @author zth
  @create  2019-05-30 19:12
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <base href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"%>"/>
    <link rel="shortcut icon" href="images/favicon.ico">
    <meta charset="UTF-8">
    <title>${news.title}</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/huanqiu.css" />
    <style type="text/css">
        #news_content{ width: 1200px; margin: 0 auto; padding: 30px; border: 1px #F2F2F2 solid;}
        #news_content img{ max-width: 1000px;}

        #news_content h1{ line-height: 50px; font-size: 24px; font-weight: bold; color: #333;}
        #news_content h6{ line-height: 50px; font-size: 14px; color: #666;}
        #news_content .contents{ font-size: 14px; line-height: 35px;}
    </style>
</head>
<body>
<div style="border-bottom: 1px #ccc solid; background: #FFF; width: 100%; z-index: 900;" id="outnav">

    <div  id="topnav">

        <img src="img/logo.png"  style="max-width: 200px;"/>

        <ul>
            <li><a href="index.html">首页</a></li>
            <li id="globhouse" style="position: relative;"><a href="house_list.html" >海外地产  <span class="caret"></span></a>
                <div id="downmenu">
                    <c:forEach items="${countrys}" var="country">
                        <a href="country?cityid=${country.id}">${country.name}</a>
                    </c:forEach>
                </div>

            </li>
            <li><a href="news">海外资讯</a></li>
            <li><a href="news_content.html">关于我们</a></li>
            <li><a href="news_content.html">联系我们</a></li>
        </ul>
        <p>
            <span class="glyphicon glyphicon-phone-alt"></span>  :
            400-123-456
        </p>
    </div>
    <div style="clear: both;"></div>
</div>


<div id="new_banner">
    <img src="img/news_banner.jpg" width="100%" />
</div>

<%--描述：面包屑导航--%>

<div  style="height: 40px; background: #F2F2F2;">
    <div style="width: 1200px; margin: 0 auto;">
        <ol class="pathnav">
            <li><a href="#">首页</a></li>
            <li><a href="web/news_list.jsp">海外资讯</a></li>
            <li><a >${news.title}</a></li>
        </ol>
        <div style="clear: both;"></div>
    </div>
</div>

<%--正文--%>

<div id="news_content">
    <h1>${news.title}</h1>
    <h6>来源：环球第二家园 &nbsp; 作者：张三 &nbsp;  ${news.ctime}5</h6>
    <div class="contents">
        ${news.content}
    </div>
</div>


<%--页脚--%>
<div style="background:#2C3644; height: 280px; width: 100%;">
    <div id="pagefoot">
        <div id="foot_tel">
            <div class="left">
                <h3>环球优路</h3>
                <h5>youlu.com</h5>

                <h3><span class="glyphicon glyphicon-earphone"></span>&nbsp;123-456-789</h3>
                <h3><span class="glyphicon glyphicon-envelope"></span>&nbsp;1234566@qq.com</h3>
            </div>
            <div class="right">
                <div>
                    <img src="img/alipay.png" width="140" height="140" />
                    <p style="text-align: center;">支付宝</p>
                </div>

                <div>
                    <img src="img/weixin.png" width="140" height="140" />
                    <p style="text-align: center;">微信</p>
                </div>

                <div style="clear: both; text-align: center; ">
                    <br>
                    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您的支持是我唯一的动力</h4>
                </div>
            </div>
        </div>
        <div id="foot_bottom" style="clear: both; text-align: center; line-height: 50px;">
            Copyright © 2018 zth.com Inc. All Rights Reserved.
            潘小柔置业有限公司&nbsp;陕ICP备xxxxx号
        </div>
    </div>
</div>
<script type="text/javascript" src="js/jquery.min.js" ></script>
<script type="text/javascript" src="js/bootstrap.min.js" ></script>
<script type="text/javascript" src="js/huanqiu.js" ></script>
</body>
</html>

