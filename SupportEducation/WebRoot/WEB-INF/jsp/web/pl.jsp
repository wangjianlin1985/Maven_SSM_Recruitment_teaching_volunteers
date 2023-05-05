<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name='TTUNION_verify' content='b846c3c2b85efabc496d2a2b8399cd62'>
    <meta name="sogou_site_verification" content="gI1bINaJcL"/>
    <meta name="360-site-verification" content="37ae9186443cc6e270d8a52943cd3c5a"/>
    <meta name="baidu_union_verify" content="99203948fbfbb64534dbe0f030cbe817">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE;chrome=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="author" content="AUI, a-ui.com">
    <meta name="baidu-site-verification" content="ZVPGgtpUfW"/>
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Poppins:400,600" rel="stylesheet">
    <!-- favicon and touch icons -->
    <link rel="shortcut icon" href="${ctx}/resource/web/assets/images/favicon.png" >
    <!-- Bootstrap -->
    <link href="${ctx}/resource/web/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/resource/web/plugins/slick/slick.css" rel="stylesheet">
    <link href="${ctx}/resource/web/plugins/slick-nav/slicknav.css" rel="stylesheet">
    <link href="${ctx}/resource/web/plugins/wow/animate.css" rel="stylesheet">
    <link href="${ctx}/resource/web/assets/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/resource/web/assets/css/theme.css" rel="stylesheet">
    <script src="${ctx}/resource/web/assets/js/jquery.min.js"></script>
    <script src="${ctx}/resource/web/assets/js/jquery.migrate.js"></script>
    <script src="${ctx}/resource/web/assets/js/bootstrap.min.js"></script>
    <script src="${ctx}/resource/web/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="${ctx}/resource/web/plugins/forms/jquery.form.min.js"></script>
    <script src="${ctx}/resource/web/plugins/forms/jquery.validate.min.js"></script>
    <script src="${ctx}/resource/web/plugins/modernizr/modernizr.custom.js"></script>
    <script src="${ctx}/resource/web/plugins/wow/wow.min.js"></script>
    <script src="${ctx}/resource/web/plugins/zoom/zoom.js"></script>
    <script src="${ctx}/resource/web/plugins/mixitup/mixitup.min.js"></script>
    <script src="${ctx}/resource/web/assets/js/theme.js"></script>
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/web/admin/css/core.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/web/admin/css/icon.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/web/admin/css/home.css">
    <script src="${ctx}/resource/libs/js/vue.js" charset="utf-8"></script>
    <script src="${ctx}/resource/libs/js/vue-resource.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${ctx}/resource/libs/js/plugins/layer/skin/layer.css" id="layui_layer_skinlayercss" style="" charset="utf-8"/>
    <link rel="stylesheet" href="${ctx}/resource/libs/js/plugins/layerUi/css/layui.css" media="all" charset="utf-8"/>
    <script src="${ctx}/resource/libs/js/plugins/layer/layer.min.js"charset="utf-8"></script>
    <script src="${ctx}/resource/libs/js/plugins/layerUi/layui.js" charset="utf-8"></script>
    <script src="${ctx}/resource/libs/js/bootstrap-paginator.js" charset="utf-8"></script>
    <link href="${ctx}/resource/libs/css/bootstrap.min.css?v=3.3.6" rel="stylesheet"charset="utf-8">
    <link href="${ctx}/resource/libs/css/font-awesome.css?v=4.4.0" rel="stylesheet"charset="utf-8">
    <link href="${ctx}/resource/libs/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet"charset="utf-8">
    <link href="${ctx}/resource/libs/css/animate.css" rel="stylesheet"charset="utf-8">
    <link href="${ctx}/resource/libs/css/style.css?v=4.1.0" rel="stylesheet"charset="utf-8">
</head>
<body class="">
<div class="wrapper wrapper-content animated fadeInRight onHide" style="width: 900px" id="app">
    <div class="ibox float-e-margins">
        <div id="additem" class="ibox-content">
            <div class="row row-lg">
                <form class="layui-form col-sm-8" action="" id="saveS" enctype="multipart/form-data">
                    <div class="layui-form-item">
                        <section class="property-agent common">
                            <h4 class="entry-title">发表评论</h4>
                            <div class="row">
                                <div class="col-lg-7">
                                    <div class="address-widget clearfix">
                                        <ul id="property-single">
                                            <li><input type="text" name="title" id="title" style="width: 710px; height: 35px"/></li>
                                            <li><textarea style="width: 710px; height: 200px" name="nr" id="nr"></textarea></li>
                                            <li>
                                              <button type="button" @click="sub" class="btn btn-default btn-lg text-center btn-3d" data-hover="提交评论">提交评论</button></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    var app = new Vue({
        el: "#property-single",
        data: {
            id:'${id}',
            userId:'${userId}',
            sqr:'${sqr}'
        },mounted: function () {
            this.$nextTick(function () {
                this.getUser();
            });

        },
        methods: {
            getUser: function () {
                var _that = this;
                this.$http.post('${ctx}/users/getUser.json', {emulateJSON: true,cache:false,async:false}).then(function (res) {
                    if (res.user){
                        window.location.href = "${ctx}/login.do"
                    }
                }, function () {
                });
            },
            sub: function() {
                var nr = $("#nr").val();
                var title = $("#title").val();
                if (title == ''){
                    layer.alert("请填写标题内容", {
                        title: '提示信息'
                    })
                    return
                }
                if (nr == ''){
                    layer.alert("请填写评论内容", {
                        title: '提示信息'
                    })
                    return
                }
                this.$http.post('${ctx}/web/plsave.json',{releaseId:this.id, usersId: this.userId,bpj:this.sqr, nr: nr,title: title},{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    layer.alert(res.data.message, function () {
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index)
                    },{title: '提示信息'})
                }, function () {
                });
            }
        }
    });
</script>
</body>
</html>