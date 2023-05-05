<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="${ctx}/resource/libs/css/bootstrap.min.css?v=3.3.6" rel="stylesheet"charset="utf-8">
    <link href="${ctx}/resource/libs/css/font-awesome.css?v=4.4.0" rel="stylesheet"charset="utf-8">
    <link href="${ctx}/resource/libs/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet"charset="utf-8">
    <link href="${ctx}/resource/libs/css/animate.css" rel="stylesheet"charset="utf-8">
    <link href="${ctx}/resource/libs/css/style.css?v=4.1.0" rel="stylesheet"charset="utf-8">

    <!-- 全局js -->
    <script src="${ctx}/resource/libs/js/jquery.min.js?v=2.1.4"charset="utf-8"></script>
    <script src="${ctx}/resource/libs/js/bootstrap.min.js?v=3.3.6"charset="utf-8"></script>
    <!-- 自定义js -->
    <script src="${ctx}/resource/libs/js/content.js?v=1.0.0"charset="utf-8"></script>
    <!-- Bootstrap table -->
    <script src="${ctx}/resource/libs/js/plugins/bootstrap-table/bootstrap-table.min.js"charset="utf-8"></script>
    <script src="${ctx}/resource/libs/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"charset="utf-8"></script>
    <script src="${ctx}/resource/libs/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"charset="utf-8"></script>

    <!-- Peity -->
    <script src="${ctx}/resource/libs/js/demo/bootstrap-table-demo.js"charset="utf-8"></script>

    <script src="${ctx}/resource/libs/js/plugins/layer/layer.min.js"charset="utf-8"></script>
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
    <link rel="stylesheet" href="${ctx}/resource/libs/js/plugins/layer/skin/layer.css" id="layui_layer_skinlayercss" style="" charset="utf-8"/>
    <link rel="stylesheet" href="${ctx}/resource/libs/js/plugins/layerUi/css/layui.css" media="all" charset="utf-8"/>
    <script src="${ctx}/resource/libs/js/pageNumber.js" charset="utf-8"></script>

</head>
<body id="app" class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight" id="vueContent">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5 class="icon-title-h5"><i class="fa fa-plus-square marginLf6"></i>上传</h5>
        </div>
        <div id="additem" class="ibox-content">
            <div class="row row-lg">
                <form class="layui-form col-sm-8" action="" id="saveS" enctype="multipart/form-data">
                    <button type="button" class="layui-btn" id="test1">
                        <i class="layui-icon">&#xe67c;</i>上传文件
                    </button>
                    <a href="${ctx}/resource/import/users.xls" class="layui-btn" style="margin-left: 10px" id="test2">
                        <i class="layui-icon">&#xe67c;</i>下载模板
                    </a>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    var form;
    var layer;

    layui.use(['form','upload'], function(){
        var upload = layui.upload;
        form = layui.form;
        layer = layui.layer;
        //执行实例
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            ,url: '${ctx}/users/importsave.json' //上传接口
            ,accept: 'file'
            ,done: function(res){
                //上传完毕回调
                layer.confirm(res.message, { icon: 3, title: '提示' }, function (index) {
                    layer.closeAll()
                });
            }
            ,error: function(){
                //请求异常回调
            }
        });
    });
</script>
</body>
</html>
