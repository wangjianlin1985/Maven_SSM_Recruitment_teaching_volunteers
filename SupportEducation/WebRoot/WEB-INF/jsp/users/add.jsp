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
            <h5 class="icon-title-h5"><i class="fa fa-plus-square marginLf6"></i>新增</h5>
        </div>
        <div id="additem" class="ibox-content">
            <div class="row row-lg">
                <form class="layui-form col-sm-8" action="" id="saveS" enctype="multipart/form-data">
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">登录名</label>
                        <div class="layui-input-block">
                            <input type="text" name="name" lay-verify="required" required autocomplete="off" placeholder="登录名" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">联系人</label>
                        <div class="layui-input-block">
                            <input type="text" name="realName" lay-verify="required" required autocomplete="off" placeholder="真实姓名" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label form-label-must">权限</label>
                        <div class="layui-input-inline">
                            <select name="role" lay-verify="required"  lay-filter="role">
                                <option value="">请选择</option>
                                <option value="1" selected>普通管理员</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label form-label-must">联系电话</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input"/>
                        </div>
                        <div class="layui-form-mid layui-word-aux">请填写11位数字</div>
                    </div>
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">身份证号</label>
                        <div class="layui-input-block">
                            <input type="text" name="sfz" lay-verify="required" required autocomplete="off" placeholder="身份证号" class="layui-input" >
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">登录密码</label>
                        <div class="layui-input-block">
                            <input type="password" id="pass" name="pass" lay-verify="required" required autocomplete="off" placeholder="登录密码" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">确认密码</label>
                        <div class="layui-input-block">
                            <input type="password" id="rpass" lay-verify="required" required autocomplete="off" placeholder="确认密码" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">地址</label>
                        <div class="layui-input-block">
                            <input type="text" name="address" lay-verify="required" required autocomplete="off" placeholder="地址" class="layui-input" >
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">图片上传</label>
                        <div class="layui-input-block">
                            <div id="dropAreaAdd"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn" lay-submit="" lay-filter="saveSub">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    var form;
    layui.use(['form', 'layedit', 'laydate'], function () {
        form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;
        //日期
        laydate.render({
            elem: '#date'
        });

        //日期范围
        laydate.render({
            elem: '#test6'
        });

        form.on('select(role2)', function(data){
            app.role = data.value
            app.initialize()
            form.render(); //更新全部
            form.render('select');
        })

        form.on('select(role)', function(data){
            if (data.value == 2){
                app.flag = true
            } else {
                app.flag = false
            }
            form.render(); //更新全部
            form.render('select'); //刷新select选择框渲染
        })

        var formData = new FormData();
        new DragImgUpload("#dropAreaAdd,#dropAreaEdit",{
            callback:function (files) {
                //回调函数，可以传递给后台等等
                formData.append("file", files[0])
            }
        })
        form.on('submit(saveSub1)', function(data){
            if ($("#pass1").val() != $("#rpass1").val()){
                layer.alert("两次密码不一致", {
                    title: '提示信息'
                })
                return false;
            }
            var form = new FormData($("#saveS1")[0]);
            form.append("file", formData.get("file"))
            $.ajax({
                cache : true,
                type : "post",
                url : "${ctx}/web/update.json",
                data : form,
                async : false,
                contentType: false,
                processData: false,
                error : function(request) {
                    parent.layer.alert("未选择图片");
                },
                success : function(data) {
                    if (!data.flag) {
                        layer.alert(data.message, {
                            title: '提示信息'
                        })
                    } else {
                        window.location.href = "${ctx}/users/list.do?role=0"
                    }
                }
            });
        });
        //监听提交
        form.on('submit(saveSub)', function(data){
            if ($("#pass").val() != $("#rpass").val()){
                layer.alert("两次密码不一致", {
                    title: '提示信息'
                })
                return false;
            }
            var form = new FormData($("#saveS")[0]);
            form.append("file", formData.get("file"))
            $.ajax({
                cache : true,
                type : "post",
                url : "${ctx}/web/save.json",
                data : form,
                async : false,
                contentType: false,
                processData: false,
                error : function(request) {
                    parent.layer.alert("未选择图片");
                },
                success : function(data) {
                    layer.confirm(data.message, { icon: 3, title: '提示' }, function (index) {
                        top.location.href = '${ctx}/indexs.do'
                    });
                }
            });

        });
    });
</script>
</body>
</html>
