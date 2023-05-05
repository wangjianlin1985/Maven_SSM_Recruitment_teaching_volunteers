<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员-登录</title>
    <script src="${ctx}/resource/libs/js/jquery.min.js?v=2.1.4"></script>
    <link href="${ctx}/resource/libs/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/resource/libs/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/resource/libs/css/animate.css" rel="stylesheet">
    <link href="${ctx}/resource/libs/css/style.css?v=4.1.0" rel="stylesheet">
    <script src="${ctx}/resource/libs/js/plugins/layer/layer.min.js"></script>
    <script src="${ctx}/resource/libs/js/plugins/layerUi/layui.js" charset="utf-8"></script>
    <!-- 多个图片上传 -->
    <script src="${ctx}/resource/libs/js/bootstrap-paginator.js" charset="utf-8"></script>
    <!-- 单张图片上传 -->
    <script src="${ctx}/resource/libs/js/upload.js" charset="utf-8"></script>
    <!-- vue验证 -->
    <script src="${ctx}/resource/libs/js/vue.js" charset="utf-8"></script>
    <script src="${ctx}/resource/libs/js/vue-resource.js" charset="utf-8"></script>
    <!-- 渲染 -->
    <script src="${ctx}/resource/libs/js/sys/table.js" charset="utf-8"></script>
    <!-- 插件 -->
    <link rel="stylesheet" href="${ctx}/resource/libs/js/plugins/layer/skin/layer.css" id="layui_layer_skinlayercss" style=""/>
    <link rel="stylesheet" href="${ctx}/resource/libs/js/plugins/layerUi/css/layui.css" media="all"/>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
    <script>if (window.top !== window.self) {
        window.top.location = window.location;
    }</script>
</head>
<body class="gray-bg">
<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name" style="margin-top: 30%; margin-bottom: 15px">
                <img alt="image" class="img-circle" style="width: 80px; height: 80px" src="${ctx}/resource/statics/images/loginlog.jpg">
            </h1>
        </div>
        <h3 style="margin-bottom: 10px; font-size: 30px">欢迎使用支教后台管理</h3>
        <form class="layui-form" action="/login.json" method="post" id="loginFrom">
            <div class="form-group">
                <input type="text"     class="form-control required"  name="name" placeholder="用户名" required="请输入用户名">
            </div>
            <div class="form-group">
                <input type="password" class="form-control required" name="pass" placeholder="密码" required="请输入密码">
            </div>
            <div class="form-group">
                <input type="text" class="form-control required" placeholder="验证码" id="captcha" name="captcha"  style="width: 60%;"/>
                <img id="captchaImage" src="${ctx}/web/captcha.form" style="width: 30%; height: 35px; float: right; margin-right: 15px; margin-top: -35px">
            </div>
            <button class="btn btn-primary block full-width m-b" class="layui-btn" lay-submit="" lay-filter="demo1">登 录</button>
            <button type="button" class="btn btn-primary block full-width m-b" class="layui-btn" lay-submit="" lay-filter="demo2">注 册</button>
            <p class="text-muted text-center">
                <%--<a href="javascript:;"><small>忘记密码了？</small></a> | <a href="javascript:;">注册一个新账号</a>--%>
            </p>
        </form>
    </div>
</div>
<!-- 全局js -->
<script src="${ctx}/resource/libs/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/resource/libs/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${ctx}/resource/libs/js/plugins/validate/messages_zh.min.js"></script>
<script src="${ctx}/resource/libs/js/bootstrap.min.js?v=3.3.6"></script>
<script>
    $('#captchaImage').click(function(){
        $('#captchaImage').attr("src", "${ctx}/web/captcha.form?timestamp=" + (new Date()).valueOf());
    });
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer

        //监听提交
        form.on('submit(demo1)', function (data) {
            $.post('${ctx}/login.json', data.field, function(data,status){
                if (!data.flag) {
                    layer.alert(data.message, {
                        title: '提示信息'
                    })
                } else {
                   window.location.href = "${ctx}/indexs.do"
                }
            },'json');
            return false;
        });

        form.on('submit(demo2)', function (data) {
            layer.open({
                type: 2,
                anim: 1,
                title: false,
                shadeClose: true,
                shade: 0.8,
                scrollbar: false,
                resize: false,
                area: ['900px', '650px'],
                content: '${ctx}/users/zc'
            });
        });
    });
</script>
</body>
</html>
