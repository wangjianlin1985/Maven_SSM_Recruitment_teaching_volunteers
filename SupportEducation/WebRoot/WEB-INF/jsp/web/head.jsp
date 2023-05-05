
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="page-loader">
    <div class="loaders">
        <img src="${ctx}/resource/web/assets/images/loader/3.gif" alt="First Loader">
        <img src="${ctx}/resource/web/assets/images/loader/4.gif" alt="First Loader">
    </div>
</div>
<header id="site-header">
    <div id="site-header-top">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <div class="clearfix">
                    </div>
                </div>
                <div class="col-md-7">
                    <c:if test="${user != null}">
                        <div class="clearfix">
                            <div class="currency-in-header">
                                欢迎您：${user.realName}&nbsp;
                                <a href="${ctx}/web/loginOut.do"> 退出 </a>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${user == null}">
                        <div class="clearfix">
                            <a href="${ctx}/web/login.do"><button type="button" class="btn btn-warning btn-lg header-btn hidden-sm">登录</button></a>
                            <div class="currency-in-header">
                                <a href="${ctx}/web/login.do"> 注册 </a>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <figure id="site-logo">
                    <%--<a href="javascript:;"><img src="${ctx}/resource/web/assets/images/logo.png" alt="Logo"></a>--%>
                </figure>
            </div>
            <div class="col-md-6 col-sm-8">
                <nav id="site-nav" class="nav navbar-default">
                    <ul class="nav navbar-nav">
                        <li><a href="${ctx}/web/home.do">首页</a></li>
                        <c:if test="${user.role <=2}">
                        <li><a href="${ctx}/web/fbzw.do">支教管理</a></li>
                        </c:if>
                        <c:if test="${user.role ==3}">
                        <li><a href="${ctx}/web/grkj.do">个人空间</a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>
            <div class="col-md-3 col-sm-4">
                <div class="contact-in-header clearfix">
                    <i class="fa fa-mobile"></i>
                    <span>
                        联系方式
                        <br>
                    <strong>111 222 333 444</strong>
                    </span>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="top_slide_wrap">
    <ul class="slide_box bxslider">
        <c:forEach items="${list}" var="row">
            <li>
                <a href="#"><img src="${ctx}${row.address}" alt=""></a>
            </li>
        </c:forEach>
    </ul>
    <div class="op_btns clearfix">
        <a href="#" class="op_btn op_prev"><span></span></a>
        <a href="#" class="op_btn op_next"><span></span></a>
    </div>
</div>
</body>
</html>
