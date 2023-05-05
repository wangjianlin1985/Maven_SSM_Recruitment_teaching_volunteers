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
    <title>类型管理</title>
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
<div class="wrapper wrapper-content animated fadeInRight"  id="vueContent">
    <!-- 表格展示列表版面-->
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>类型管理</h5>
        </div>
        <div class="ibox-content">
            <div class="row row-lg">
                <div class="col-sm-12">
                    <!-- Example Classes -->
                    <div id="toolbar">
                        <form class="form-inline layui-form">
                            <div class="layui-form-item toolbar-btn">
                                <button onclick="" class="btn btn-sm btn-primary" type="button" id="btnAdd">
                                    <i class="fa fa-plus"></i>&nbsp;&nbsp;增加
                                </button>
                                <div class="layui-inline">
                                    <label class="layui-form-label">类型名称</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="name" class="layui-input" v-model="name"/>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <table class ="table table-bordered">
                        <thead>
                        <tr>
                            <th data-field="id" data-sortable="true">类型名称</th>
                            <th data-field="edit" data-width="180px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="(row,index) in list">
                            <td>{{row.name}}</td>
                            <td>
                                <button class="btn btn-info btn-xs btnDataTable-update" :data-Id = 'row.id' @click="getEntity(row.id)"><i class="fa fa-paste"></i>&nbsp;&nbsp;修 改 </button>
                                <button class="btn btn-warning  btn-xs btnDataTable-del" :data-Id='row.id'><i class="fa fa-remove"></i>&nbsp;&nbsp;删 除 </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div id="Paginator" style="text-align: right">
                        <div style="text-align: left; width: 300px">总共 <span id="totalCount"></span> 条记录</div>
                        <ul id="pageLimit" style="margin-top: -15px"></ul>
                    </div>
                    <!-- End Example Classes -->
                </div>
            </div>
        </div>
    </div>
    <!-- 新增div (在涉及到多图上传的时候 新增和编辑最好使用同一个div) -->
    <div id="divNodeAdd" class="ibox float-e-margins hidden-div">
        <div class="ibox-title">
            <h5 class="icon-title-h5"><i class="fa fa-plus-square marginLf6"></i>新增</h5>
        </div>
        <div id="additem" class="ibox-content">
            <div class="row row-lg">
                <form class="layui-form col-sm-8" action="" id="saveS" enctype="multipart/form-data">
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">类型名称</label>
                        <div class="layui-input-block">
                            <input type="text" name="name" lay-verify="required" required autocomplete="off" placeholder="类型名称" class="layui-input">
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
    <!-- 编辑div -->
    <div id="divNodeEdit" class="ibox float-e-margins hidden-div">
        <div class="ibox-title">
            <h5 class="icon-title-h5"><i class="fa fa-pencil-square"></i>编辑</h5>
        </div>
        <div id="additem" class="ibox-content">
            <div class="row row-lg">
                <form class="layui-form col-sm-8" action="" id="saveS1" enctype="multipart/form-data">
                    <input type="hidden" name="id" :value="bean.id"/>
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">类型名称</label>
                        <div class="layui-input-block">
                            <input type="text" name="name" lay-verify="required" required autocomplete="off" placeholder="类型名称" class="layui-input" :value="bean.name">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn" lay-submit="" lay-filter="saveSub1">立即提交</button>
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
    var app = new Vue({
        el: "#vueContent",
        data: {
            list: [],
            role:'',
            flag:false,
            bean:'',
            name:'',
            pageIndex: 1
        },
        watch: {
            name: function(val) {
                this.initialize()
            },
        },
        mounted: function () {
            this.getUser();
            this.$nextTick(function () {
                this.initialize();
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
            initialize: function () {
                var _that = this;
                this.$http.post('${ctx}/type/listAll.json', {pageIndex: _that.pageIndex, name: _that.name},{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    _that.list = res.data.page.list;
                    getPage(res.data.page.size, res.data.page.pageNum, res.data.page.total, res.data.page.pages)
                }, function () {
                });
            },
            getEntity: function (id) {
                var _that = this;
                this.$http.post('${ctx}/type/edit.json', {id:id},{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    _that.bean = res.data.bean;
                    $('#divNodeAdd').hide();
                    $('#divNodeEdit').show();
                    $('html,body').animate({scrollTop: $('#divNodeEdit').offset().top}, 500);
                    $("#roleselect").val(_that.bean.role)
                    form.render('select');
                }, function () {
                });
            }
        }
    });

    layui.use(['form', 'layedit', 'laydate'], function () {
        form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;


        form.on('submit(saveSub1)', function(data){
            $.ajax({
                cache : true,
                type : "post",
                url : "${ctx}/type/update.json",
                data : $("#saveS1").serialize(),
                async : false,
                success : function(data) {
                    layer.alert(data.message, {
                        title: '提示信息'
                    })
                    $('#divNodeEdit').hide();
                    $('#divNodeAdd').hide();
                    app.initialize()
                }
            });
        });
        //监听提交
        form.on('submit(saveSub)', function(data){
            var form = new FormData($("#saveS")[0]);
            $.ajax({
                cache : true,
                type : "post",
                url : "${ctx}/type/save.json",
                data : form,
                async : false,
                contentType: false,
                processData: false,
                success : function(data) {
                    layer.alert(data.message, {
                        title: '提示信息'
                    })
                    $('#divNodeEdit').hide();
                    $('#divNodeAdd').hide();
                    app.initialize()
                }
            });
        });
    });

    //添加
    $("#btnAdd").on("click", function () {
        $('#divNodeEdit').hide();
        $('#divNodeAdd').show();
        $('html,body').animate({scrollTop: $('#divNodeAdd').offset().top}, 500);
        app.bean = ''
    });
    //修改
    $("#app").on("click", ".btnDataTable-update", function (e) {
        $('#divNodeAdd').hide();
        $('#divNodeEdit').show();
        $('html,body').animate({scrollTop: $('#divNodeEdit').offset().top}, 500);
        var dataid = $(this).attr("data-id");
    });

    //删除
    $("#app").on("click", ".btnDataTable-del", function () {
        var id = $(this).attr("data-Id")
        layer.confirm('确定要删除吗？', { icon: 3, title: '提示' }, function (index) {
            $.ajax({
                cache : true,
                type : "post",
                url : "${ctx}/type/delete.json",
                data : {id:id},
                async : false,
                success : function(data) {
                    layer.alert(data.message, {
                        title: '提示信息'
                    })
                    app.initialize();
                }
            });
        });
    });
</script>
</body>
</html>
