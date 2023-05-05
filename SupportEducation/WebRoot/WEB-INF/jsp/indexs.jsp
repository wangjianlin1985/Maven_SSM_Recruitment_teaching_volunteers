<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>支教学校</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
    <link href="${ctx}/resource/libs/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/resource/libs/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/resource/libs/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/resource/libs/css/animate.css" rel="stylesheet">
    <link href="${ctx}/resource/libs/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="fixed-sidebar full-height-layout gray-bg  pace-done fixed-nav" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span><img alt="image" class="img-circle" style="width: 64px; height: 64px" src="${ctx}${user.photo}"/></span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear">
                                <span class="block m-t-xs"><strong class="font-bold">${user.realName}</strong></span>
                                <span class="text-muted text-xs block">
                                    <c:if test="${user.role == 0}">超级管理员</c:if>
                                    <c:if test="${user.role == 1}">管理员</c:if>
                                    <c:if test="${user.role == 2}">支教学校</c:if>
                                    <c:if test="${user.role == 3}">志愿者</c:if>
                                    <b class="caret"></b></span>
                            </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <%--<li><a class="J_menuItem" href="form_avatar.html">修改头像</a>--%>
                            <%--</li>--%>
                            <%--<li><a class="J_menuItem" href="form_avatar.html">修改密码</a>--%>
                            <%--</li>--%>
                            <%--<li><a class="J_menuItem" href="profile.html">账户管理</a>--%>
                            <%--</li>--%>
                            <%--<li><a class="J_menuItem" href="contacts.html">权限分配</a>--%>
                            <%--</li>--%>
                            <li class="divider"></li>
                            <li><a href="${ctx}/loginOut.do" >安全退出</a>
                            </li>
                        </ul>
                    </div>
                    <div class="logo-element">
                    </div>
                </li>
                <li>
                    <a class="J_menuItem" href="${ctx}/users/list.do?role=0"><i class="fa fa-columns"></i> <span class="nav-label">超级管理员</span></a>
                </li>
                <li>
                    <a class="J_menuItem" href="${ctx}/users/list.do?role=1"><i class="fa fa-columns"></i> <span class="nav-label">普通管理员</span></a>
                </li>
                <li>
                    <a class="J_menuItem" href="${ctx}/users/list.do?role=2"><i class="fa fa-columns"></i> <span class="nav-label">支教学校管理</span></a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">志愿者管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${ctx}/users/list.do?role=3"><i class="fa fa-columns"></i> <span class="nav-label">志愿者管理</span></a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${ctx}/apply/isDsjlist.do"><i class="fa fa-columns"></i> <span class="nav-label">大数据</span></a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="J_menuItem" href="${ctx}/apply/list.do"><i class="fa fa-columns"></i> <span class="nav-label">报名审核</span></a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">职位管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${ctx}/type/list.do">职位列表</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">网站设置</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${ctx}/photo/list.do">轮播图设置</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">评论管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${ctx}/evaluate/list.do">评论列表</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">留言管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${ctx}/message/list.do">留言列表</a>
                        </li>
                    </ul>
                </li>

            </ul>

        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-fixed-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <div class="navbar-header-title">支教后台管理</div>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <a class="white-fff" href="${ctx}/loginOut.do">
                            <i class="fa fa-sign-out"></i> 退出
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="${ctx}/open.do">首页</a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row J_mainContent" id="content-main">
            <a class="navbar-minimalize btn h-show-btn" href="#">
                <i class="h-show"></i>
            </a>
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx}/open.do" frameborder="0"
                    data-id="${ctx}//open.do" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">&copy; 2019-2022 <a href="" target="_blank">支教后台管理</a>
            </div>
        </div>
    </div>
    <!--右侧部分结束-->
    <!--右侧边栏开始-->
    <div id="right-sidebar">
        <div class="sidebar-container">
            <ul class="nav nav-tabs navs-3">
                <li class="active">
                    <a data-toggle="tab" href="#tab-1">
                        <i class="fa fa-gear"></i> 主题
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="sidebar-title">
                        <h3><i class="fa fa-comments-o"></i> 主题设置</h3>
                        <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                    </div>
                    <div class="skin-setttings">
                        <div class="title">主题设置</div>
                        <div class="setings-item">
                            <span>收起左侧菜单</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox"
                                           id="collapsemenu">
                                    <label class="onoffswitch-label" for="collapsemenu">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>固定顶部</span>

                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox"
                                           id="fixednavbar">
                                    <label class="onoffswitch-label" for="fixednavbar">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>固定宽度</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox"
                                           id="boxedlayout">
                                    <label class="onoffswitch-label" for="boxedlayout">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="title">皮肤选择</div>
                        <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                         <a href="#" class="s-skin-0">
                             默认皮肤
                         </a>
                    </span>
                        </div>
                        <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-1">
                            蓝色主题
                        </a>
                    </span>
                        </div>
                        <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-3">
                            黄色/紫色主题
                        </a>
                    </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--右侧边栏结束-->
</div>
<!-- 全局js -->
<script src="${ctx}/resource/libs/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/resource/libs/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/resource/libs/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/resource/libs/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${ctx}/resource/libs/js/plugins/layer/layer.min.js"></script>
<!-- 自定义js -->
<script src="${ctx}/resource/libs/js/hplus.js?v=4.1.0"></script>
<script type="text/javascript" src="${ctx}/resource/libs/js/contabs.js"></script>
<!-- 第三方插件 -->
<script src="${ctx}/resource/libs/js/plugins/pace/pace.min.js"></script>
</body>
</html>
