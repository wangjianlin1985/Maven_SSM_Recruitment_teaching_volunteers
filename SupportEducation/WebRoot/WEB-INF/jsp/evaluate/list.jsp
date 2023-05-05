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
    <title>评论管理</title>
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
                            <div class="layui-form-item">
                                <label class="layui-form-label">评价人</label>
                                <div class="layui-input-inline">
                                    <select lay-filter="pjr" id="pjr">
                                        <option value="">请选择</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <table class ="table table-bordered">
                        <thead>
                        <tr>
                            <th style="width: 200px" data-field="id" data-sortable="true">评价人</th>
                            <th style="width: 180px" data-field="id" data-sortable="true">职位名称</th>
                            <th style="width: 120px" data-field="id" data-sortable="true">评价时间</th>
                            <th data-field="id" data-sortable="true">评价内容</th>
                            <th style="width: 90px" data-field="edit" data-width="180px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="(row,index) in list">
                            <td style="width: 200px">{{row.plr.realName}}</td>
                            <td style="width: 100px">{{row.type.name}}</td>
                            <td style="width: 120px">{{row.evaluate.pjTime|formatDate}}</td>
                            <td>{{row.evaluate.nr}}</td>
                            <td>
                                <button class="btn btn-warning  btn-xs btnDataTable-del" :data-Id='row.evaluate.id'><i class="fa fa-remove"></i>&nbsp;&nbsp;删 除 </button>
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
</div>
<script>
    var form;
    var app = new Vue({
        el: "#vueContent",
        data: {
            list: '',
            userlist:'',
            userId:'',
            pageIndex: 1
        },
        filters:{
            formatDate:function (val) {
                var padDate=function(va) {
                    va = va < 10 ? '0' + va : va;
                    return va
                }
                var value=new Date(val);
                var year=value.getFullYear();
                var month=padDate(value.getMonth()+1);
                var day=padDate(value.getDate());
                var hour=padDate(value.getHours());
                var minutes=padDate(value.getMinutes());
                var seconds=padDate(value.getSeconds());
                return year+'-'+month+'-'+day;
            }
        },
        mounted: function () {
            this.getUser();
            this.$nextTick(function () {
                layui.use(['form'], function () {
                    form = layui.form;
                    var layer = layui.layer;
                    form.on('select(pjr)', function(data){
                        app.userId = data.value
                        app.initialize()
                    });
                });
                this.initialize();
                this.getListUsers();
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
                this.$http.post('${ctx}/evaluate/listAll.json', {userId:_that.userId, pageIndex: _that.pageIndex},{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    _that.list = JSON.parse(res.data.list);
                    getPage(res.data.page.size, res.data.page.pageNum, res.data.page.total, res.data.page.pages)
                }, function () {
                });
            },
            getListUsers: function () {
                var _that = this;
                var op1 = '<option value="'
                var op2 = '">'
                var op3 = '</option>'
                this.$http.post('${ctx}/evaluate/userlist.json',{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    var list = res.data.list;
                    $("#pjr").find("option").remove();
                    $("#pjr").append(op1 + op2 + "请选择" + op3)
                    for(var i = 0; i < list.length; i++){
                        $("#pjr").append(op1 + list[i].id + op2 + list[i].realName + op3);
                        layui.use('form', function(){
                            var form = layui.form;
                            form.render("select");
                        });
                    }
                }, function () {
                });
            },
        }
    });
    $("#app").on("click", ".btnDataTable-del", function () {
        var id = $(this).attr("data-Id")
        layer.confirm('确定要删除吗？', { icon: 3, title: '提示' }, function (index) {
            $.ajax({
                cache : true,
                type : "post",
                url : "${ctx}/evaluate/delete.json",
                data : {id:id},
                async : false,
                success : function(data) {
                    layer.alert(data.message, {
                        title: '提示信息'
                    })
                    if (data.flag)app.initialize();
                }
            });
        });
    });
</script>
</body>
</html>
