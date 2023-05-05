
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<link rel="shortcut icon" href="" type="image/x-icon">
<link href="${ctx}/resource/libs/css/font-awesome.css?v=4.4.0" rel="stylesheet"charset="utf-8">
<link href="${ctx}/resource/libs/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet"charset="utf-8">
<link href="${ctx}/resource/libs/css/animate.css" rel="stylesheet"charset="utf-8">
<link href="${ctx}/resource/libs/css/style.css?v=4.1.0" rel="stylesheet"charset="utf-8">
<script src="${ctx}/resource/libs/js/jquery.min.js?v=2.1.4"charset="utf-8"></script>
<script src="${ctx}/resource/libs/js/bootstrap.min.js?v=3.3.6"charset="utf-8"></script>
<script src="${ctx}/resource/libs/js/content.js?v=1.0.0"charset="utf-8"></script>
<script src="${ctx}/resource/libs/js/plugins/bootstrap-table/bootstrap-table.min.js"charset="utf-8"></script>
<script src="${ctx}/resource/libs/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"charset="utf-8"></script>
<script src="${ctx}/resource/libs/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"charset="utf-8"></script>
<script src="${ctx}/resource/libs/js/demo/bootstrap-table-demo.js"charset="utf-8"></script>
<script src="${ctx}/resource/libs/js/plugins/layer/layer.min.js"charset="utf-8"></script>
<script src="${ctx}/resource/libs/js/plugins/layerUi/layui.js" charset="utf-8"></script>
<script src="${ctx}/resource/libs/js/bootstrap-paginator.js" charset="utf-8"></script>
<!-- 单张图片上传 -->
<script src="${ctx}/resource/libs/js/upload.js" charset="utf-8"></script>
<script src="${ctx}/resource/libs/js/vue.js" charset="utf-8"></script>
<script src="${ctx}/resource/libs/js/vue-resource.js" charset="utf-8"></script>
<link rel="stylesheet" charset="utf-8" href="${ctx}/resource/web/login/css/reset.css">
<link rel="stylesheet" charset="utf-8" href="${ctx}/resource/web/login/css/reg.css">
</head>
<body>
<div class="login_header">
    <div class="header_center clearfix">
        <div class="myfl">
            <a href="${ctx}/web/home.do"><img src=""/></a>
            <span>欢迎登陆</span>
        </div>
        <div class="myfr">
            <a href="${ctx}/web/home.do">返回首页</a><span></span><a href="javascript:;" class="collection_web">收藏网站</a>
        </div>
    </div>
</div>
<div class="login_content clearfix" >
    <input type="hidden" id="memberType" value="" />
    <form action="/login" method="post">
        <input type="hidden" name="memberType" id="parameter" value="1"/>
        <div class="login_box myfr" style="height: 450px">
            <p class="tabchange clearfix">
                <span class="myfl sign_select" id="usertype" onclick="roleSet(2)">支教学校登录</span>
                <em class="myfl"></em>
                <span class="myfl bor_bottom" id="sellertype" onclick="roleSet(3)">志愿者登录</span>
            </p>
            <p class="system_error"></p>
            <input type="hidden" id="role" value="3"/>
            <input type="text" name="name" value="" placeholder="用户名" id="username"/>
            <p class="username_error"><span>用户名不能为空!</span></p>
            <input type="password" placeholder="登录密码" id="password" name="pass" maxlength="16" value=""/>
            <p class="password_error"><span>密码不能为空!</span></p>
            <input type="text" placeholder="验证码" id="captcha" name="captcha"  style="width: 60%"/>
            <img id="captchaImage" src="${ctx}/web/captcha.form" style="width: 25%; height: 46px; float: right; margin-right: 28px">
            <p class="password_error"><span>验证码不能为空!</span></p>
            <input type="button" value="立即登录" class="submit_btn" onclick="sublogin()">
            <input type="button" value="注册" class="submit_btn" onclick="zhuc()">
        </div>
    </form>
</div>
<div class="login_bottom">xxxxx</div>
<script type="text/javascript" charset="utf-8" src="${ctx}/resource/web/login/js/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resource/web/login/js/web_method/method.js"></script>

<script>
    $('#captchaImage').click(function(){
        $('#captchaImage').attr("src", "${ctx}/web/captcha.form?timestamp=" + (new Date()).valueOf());
    });

    (function () {
        'use strict';
        var name_regular = /^[0-9a-zA-Z-_ \u4e00-\u9fa5]*$/,                 //获取登录类型。
            Sellerdom = $("#sellertype"),                          //获取商家切换节点
            Userdom = $("#usertype"),                              //密码输入框
            Parameter = $("#parameter");                          //传给后台的type
        if(window.localStorage.StorageUserType == 2){
            Sellerdom.addClass("sign_select");
            Sellerdom.removeClass("bor_bottom");
            Userdom.addClass("bor_bottom");
            Userdom.removeClass("sign_select");
            Parameter.val("2");
        }
        //用户切换
        Userdom.on("click",function () {
            if(Userdom.attr("class").indexOf("sign_select") <= -1){
                Userdom.addClass("sign_select");
                Userdom.removeClass("bor_bottom");
                Sellerdom.addClass("bor_bottom");
                Sellerdom.removeClass("sign_select");
                Parameter.val("1");
            }
        });
        //商家切换
        Sellerdom.on("click",function () {
            if(Sellerdom.attr("class").indexOf("sign_select") <= -1){
                Sellerdom.addClass("sign_select");
                Sellerdom.removeClass("bor_bottom");
                Userdom.addClass("bor_bottom");
                Userdom.removeClass("sign_select");
                Parameter.val("2");
            }
        });
    }());

    $(function () {
        console.log($("#role").val())
    })
    function roleSet(role) {
        $("#role").val(role)
        console.log($("#role").val())
    }
    function sublogin() {
        var name = $("#username").val();
        var pass = $("#password").val();
        var captcha = $("#captcha").val();
        if (name == '' || pass == '' || captcha == ''){
            layer.confirm("请输入完整信息", { icon: 3, title: '提示' }, function (index) {
                layer.close(layer.index)
            });
            return;
        }
        $.ajax({
            type: "post",
            dataType: "json",
            url : "${ctx}/web/login.json",
            data : {name:name, pass:pass, captcha:captcha, role:$("#role").val()},
            async : false,
            error : function(request) {
                parent.layer.alert("网络超时");
            },
            success : function(data) {
                if (data.flag){
                    top.location.href = '${ctx}/web/home.do'
                } else {
                    layer.confirm(data.message, { icon: 3, title: '提示' }, function (index) {
                        layer.close(index);
                    });
                }
            }
        });
    }
    function zhuc(){
        layer.open({
            type: 2,
            anim: 1,
            title: false,
            shadeClose: true,
            shade: 0.8,
            scrollbar: false,
            resize: false,
            area: ['900px', '650px'],
            content: '${ctx}/web/add?role=' + $("#role").val()
        });
    }

</script>
</body>
</html>
