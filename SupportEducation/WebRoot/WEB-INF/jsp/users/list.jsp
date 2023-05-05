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
    <title>微征集、随手拍(游客游记)</title>
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
            <h5>用户个人管理</h5>
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
                                <c:if test="${role < 2}">
                                <button onclick="" class="btn btn-sm btn-primary" style="margin-left: 10px" type="button" id="addimport">
                                    <i class="fa fa-plus"></i>&nbsp;&nbsp;导入
                                </button>
                                </c:if>
                                <c:if test="${role >1}">
                                <button onclick="" class="btn btn-sm btn-primary" style="margin-left: 10px" type="button" id="reportExcl">
                                    <i class="fa fa-plus"></i>&nbsp;&nbsp;导出
                                </button>
                                </c:if>
                                <%--<div class="layui-inline">--%>
                                    <%--<label class="layui-form-label">角色类型</label>--%>
                                    <%--<div class="layui-input-inline">--%>
                                        <%--<select name="role" lay-verify="required"  lay-filter="role2">--%>
                                            <%--<option value="">请选择</option>--%>
                                            <%--<option value="0">超级管理员</option>--%>
                                            <%--<option value="1">管理员</option>--%>
                                            <%--<option value="2">学校</option>--%>
                                            <%--<option value="3">支教学校</option>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <div class="layui-inline">
                                    <label class="layui-form-label">联系电话</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="phone" class="layui-input" v-model="phone"/>
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">联系人</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="realName" class="layui-input" v-model="realName"/>
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">身份证号</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="sfz" class="layui-input" v-model="sfz"/>
                                    </div>
                                </div>
                                <%--<div class="layui-inline">--%>
                                    <%--<label class="layui-form-label">时间范围</label>--%>
                                    <%--<div class="layui-input-inline">--%>
                                        <%--<input type="text" class="layui-input" id="test6" placeholder=" - ">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            </div>
                        </form>
                    </div>
                    <table class ="table table-bordered">
                        <thead>
                        <tr>
                            <th data-field="id" data-sortable="true">登录名</th>
                            <th data-field="time" data-sortable="true" data-width="180px">真实姓名</th>
                            <th data-field="user" data-sortable="true" data-width="180px">权限</th>
                            <th data-field="reTime" data-sortable="true" data-width="180px">联系方式</th>
                            <th data-field="reTime" data-sortable="true" data-width="180px">身份证</th>
                            <th data-field="reTime" data-sortable="true" data-width="180px">地址</th>
                            <th data-field="reTime" data-sortable="true" data-width="180px">审核</th>
                            <th data-field="edit" data-width="180px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="(row,index) in list">
                            <td>{{row.name}}</td>
                            <td>{{row.realName}}</td>
                            <td>{{row.role | formatDateRole}}</td>
                            <td>{{row.phone}}</td>
                            <td>{{row.sfz}}</td>
                            <td>{{row.address}}</td>
                            <td>{{row.isSh == 0 ? '未审核' : '已审核'}}</td>
                            <td>
                                <button class="btn btn-info btn-xs btnDataTable-update" :data-Id = 'row.id' @click="getEntity(row.id)"><i class="fa fa-paste"></i>&nbsp;&nbsp;修 改 </button>

                                <button v-if="row.isSh == 0" class="btn btn-warning  btn-xs btnDataTable-sh" :data-Id='row.id'><i class="fa fa-remove"></i>&nbsp;&nbsp;审 核 </button>

                                <button class="btn btn-warning  btn-xs btnDataTable-del" :data-Id='row.id'><i class="fa fa-remove"></i>&nbsp;&nbsp;删 除 </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div id="Paginator" style="text-align: right">
                        <div style="text-align: left; width: 300px">总共 <span id="totalCount"></span> 条记录</div>
                        <ul id="pageLimit" style="margin-top: -15px"></ul>
                    </div>
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
                        <label class="layui-form-label form-label-must">登录名</label>
                        <div class="layui-input-block">
                            <input type="text" name="name" id="name" lay-verify="required" required autocomplete="off" placeholder="登录名" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">联系人</label>
                        <div class="layui-input-block">
                            <input type="text" name="realName" id="realName" lay-verify="required" required autocomplete="off" placeholder="真实姓名" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label form-label-must">权限</label>
                        <div class="layui-input-inline">
                            <select name="role" lay-verify="required"  lay-filter="role">
                                <option value="">请选择</option>
                                <option value="0" v-if="user.role == 0 && role == 0" selected="role == 0 ? selected : ''">超级管理员</option>
                                <option value="1" v-if="role == 1" selected>管理员</option>
                                <option value="2" v-if="role == 2" selected>支教学校</option>
                                <option value="3" v-if="role == 3" selected>志愿者</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label form-label-must">联系电话</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" id="phone" lay-verify="required|phone" autocomplete="off" class="layui-input"/>
                        </div>
                        <div class="layui-form-mid layui-word-aux">请填写11位数字</div>
                    </div>
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">身份证号</label>
                        <div class="layui-input-block">
                            <input type="text" name="sfz" id="sfz" lay-verify="required" required autocomplete="off" placeholder="身份证号" class="layui-input" >
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
                            <input type="text" name="address" id="address" lay-verify="required" required autocomplete="off" placeholder="地址" class="layui-input" >
                        </div>
                    </div>
                    <div class="layui-form-item" v-if="flag">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">学校名称</label>
                        <div class="layui-input-block">
                            <input type="text" name="schoolName" id="schoolName" lay-verify="required" required autocomplete="off" placeholder="学校名称" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">图片上传</label>
                        <div class="layui-input-block">
                            <div id="dropAreaAdd"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">简介</label>
                        <div class="layui-input-block">
                            <textarea name="schoolJs" id="schoolJs" style="height: 200px" required autocomplete="off" placeholder="简介" class="layui-input"></textarea>
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
                        <label class="layui-form-label form-label-must">登录名</label>
                        <div class="layui-input-block">
                            <input type="text" name="name" lay-verify="required" required autocomplete="off" placeholder="登录名" class="layui-input" :value="bean.name" disabled>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">联系人</label>
                        <div class="layui-input-block">
                            <input type="text" name="realName" lay-verify="required" required autocomplete="off" placeholder="真实姓名" class="layui-input" :value="bean.realName">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label form-label-must">权限</label>
                        <div class="layui-input-inline">
                            <select name="role" lay-verify="required"  lay-filter="role" id="roleselect">
                                <option value="">请选择</option>
                                <option value="0">超级管理员</option>
                                <option value="1">管理员</option>
                                <option value="2">支教学校</option>
                                <option value="3">志愿者</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label form-label-must">联系电话</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input" :value="bean.phone" />
                        </div>
                        <div class="layui-form-mid layui-word-aux">请填写11位数字</div>
                    </div>
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">身份证号</label>
                        <div class="layui-input-block">
                            <input type="text" name="sfz" lay-verify="required" required autocomplete="off" placeholder="身份证号" class="layui-input" :value="bean.sfz">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">登录密码</label>
                        <div class="layui-input-block">
                            <input type="password" id="pass1" name="pass" lay-verify="required" required autocomplete="off" placeholder="登录密码" class="layui-input" :value="bean.pass">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">确认密码</label>
                        <div class="layui-input-block">
                            <input type="password" id="rpass1" lay-verify="required" required autocomplete="off" placeholder="确认密码" class="layui-input" :value="bean.pass">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">地址</label>
                        <div class="layui-input-block">
                            <input type="text" name="address" lay-verify="required" required autocomplete="off" placeholder="地址" class="layui-input" :value="bean.address">
                        </div>
                    </div>
                    <div class="layui-form-item" v-if="flag">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">学校名称</label>
                        <div class="layui-input-block">
                            <input type="text" name="schoolName" lay-verify="required" required autocomplete="off" placeholder="学校名称" class="layui-input" :value="bean.schoolName">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">图片上传</label>
                        <div class="layui-input-block">
                            <div id="dropAreaAdd" style="width: 150px; height: 150px; border: 1px solid rgb(210, 210, 210); cursor: pointer;">
                                <div id="preview">
                                    <img :src="getImgUrl(bean.photo)" class="img-responsive" style="width: 150px;height: 150px;" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <!-- form-label-must 红色标注必须的class -->
                        <label class="layui-form-label form-label-must">简介</label>
                        <div class="layui-input-block">
                            <textarea name="schoolJs" style="height: 200px" required autocomplete="off" placeholder="简介" class="layui-input">{{bean.schoolJs}}</textarea>
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
        	ctx: '${ctx}',
            list: [],
            role:'${role}',
            user:'${user}',
            flag:false,
            bean:'',
            selected:'',
            phone:'',
            realName:'',
            sfz:'',
            pageIndex: 1
        },
        watch: {
            phone: function(val) {
                this.initialize()
            },
            realName:function (val) {
                this.initialize()
            },
            sfz:function (val) {
                this.initialize()
            }
        },
        mounted: function () {
            this.getUser();
            this.user = JSON.parse(this.user)
            this.$nextTick(function () {
                this.initialize();
            });

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
            },
            formatDateRole:function (val) {
                if (val == 0){
                    return "超级管理员"
                }
                if (val == 1){
                    return "管理员"
                }
                if (val == 2){
                    return "学校"
                }
                if (val == 3){
                    return "志愿者"
                }
            }
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

            //获取图片地址
            getImgUrl:function(icon){
                return this.ctx+icon;
            },

            initialize: function () {
                var _that = this;
                this.$http.post('${ctx}/users/listAll.json', {pageIndex: _that.pageIndex, sfz:_that.sfz,role: _that.role, phone:_that.phone, realName:_that.realName},{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    _that.list = res.data.page.datas;
                    _that.pageIndex = res.data.page.pageNum
                    getPage(res.data.page.size, res.data.page.pageNum, res.data.page.total, res.data.page.pages)
                }, function () {
                });
            },
            getEntity: function (id) {
                var _that = this;
                this.$http.post('${ctx}/users/edit.do', {id:id},{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    _that.bean = res.data.bean;
                    if (_that.user.role  == 1 && (_that.bean.role == 0)) {
                        layer.alert("权限不足", {
                            title: '提示信息'
                        })
                    } else {
                        $('#divNodeAdd').hide();
                        $('#divNodeEdit').show();
                        $('html,body').animate({scrollTop: $('#divNodeEdit').offset().top}, 500);
                        $("#roleselect").val(_that.bean.role)
                        form.render('select');
                        _that.flag = _that.bean.role == 2 ? true : false
                    }
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
                url : "${ctx}/users/update.json",
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
                        // $('#divNodeEdit').hide();
                        // $('#divNodeAdd').hide();
                        // app.initialize()
                        window.location.href = "${ctx}/users/list.do?role=${role}"
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
                url : "${ctx}/users/save.json",
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
                        // $('#divNodeEdit').hide();
                        // $('#divNodeAdd').hide();
                        // app.initialize()
                        window.location.href = "${ctx}/users/list.do?role=${role}"
                    }
                }
            });
        });
    });

    $("#reportExcl").on("click", function () {
        window.location.href = '${ctx}/users/reportExcl.do?role=${role}'
    });

    $("#addimport").on("click", function () {
        layer.open({
            type: 2,
            anim: 1,
            title: false,
            shadeClose: true,
            shade: 0.8,
            scrollbar: false,
            resize: false,
            area: ['400px', '350px'],
            content: '${ctx}/users/importExcl.do',
            btn: ['关闭'],
            yes: function (index, layero) {
                layer.close(index)
                app.initialize()
            },
            cancel: function(){
               layer.close()
               app.initialize()
            }
        });
    });

    //添加
    $("#btnAdd").on("click", function () {
        app.bean = ''
        $("#name").val("")
        $("#schoolJs").val("")
        $("#schoolName").val("")
        $("#address").val("")
        $("#sfz").val("")
        $("#phone").val("")
        $("#phone").val("")
        $("#realName").val("")
        $('#divNodeEdit').hide();
        $('#divNodeAdd').show();
        $('html,body').animate({scrollTop: $('#divNodeAdd').offset().top}, 500);
    });
    //修改
    // $("#app").on("click", ".btnDataTable-update", function (e) {
    //     $('#divNodeAdd').hide();
    //     $('#divNodeEdit').show();
    //     $('html,body').animate({scrollTop: $('#divNodeEdit').offset().top}, 500);
    //     var dataid = $(this).attr("data-id");
    //     console.log(dataid)
    // });

    //删除
    $("#app").on("click", ".btnDataTable-del", function () {
        var id = $(this).attr("data-Id")
        layer.confirm('确定要删除吗？', { icon: 3, title: '提示' }, function (index) {
            $.ajax({
                cache : true,
                type : "post",
                url : "${ctx}/users/delete.json",
                data : {id:id},
                async : false,
                success : function(data) {
                    layer.alert(data.message, {
                        title: '提示信息'
                    })
                    if (data.flag) 
                    app.initialize();
                }
            });
        });
    });

    $("#app").on("click", ".btnDataTable-sh", function () {
        var id = $(this).attr("data-Id")
        layer.confirm('确定要审核吗？', { icon: 3, title: '提示' }, function (index) {
            $.ajax({
                cache : true,
                type : "post",
                url : "${ctx}/users/sh.json",
                data : {id:id},
                async : false,
                success : function(data) {
                    layer.alert(data.message, {
                        title: '提示信息'
                    })
                    if (data.flag)
                        app.initialize();
                }
            });
        });
    });
</script>
</body>
</html>
