<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发布职位</title>
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
    <script src="${ctx}/resource/libs/js/pageNumber.js" charset="utf-8"></script>
    <style>
       .ydc-menu a{color: #8d8d8d}
    </style>
</head>
<body class="">
<%@ include file="head.jsp"%>
<section>
    <div class="ydc-content-slide ydc-body" id="vueContent">
        <div class="ydc-flex">
            <!-- left begin -->
            <div class="ydc-column ydc-column-2">
                <div class="ydc-menu">
                    <ul>
                        <li class="ydc-menu-item">
                            <a href="${ctx}/web/home.do" class=""><i class="ydc-icon ydc-icon-home fl"></i>首页</a>
                        </li>
                        <li class="ydc-menu-item"><a href="javascript:;" @click="onShow('app')"><i class="ydc-icon ydc-icon-find fl"></i>发布</a>
                        </li>
                        <li class="ydc-menu-item"><span class="ydc-menu-sub-title"><i class="ydc-icon ydc-icon-file fl"></i>管理</span>
                            <ul>
                                <li>
                                    <a href="javascript:;" @click="onShow('yfb')">已发布列表</a>
                                </li>
                                <li>
                                    <a href="javascript:;" @click="onShow('ybm')">已报名列表</a>
                                </li>
                                <li>
                                    <a href="javascript:;" @click="onShow('pllb')">评论列表</a>
                                </li>
                                <li>
                                    <a href="javascript:;" @click="onShow('admin')">联系管理员</a>
                                </li>
                                <li>
                                    <a href="javascript:;" @click="onShow('grxx')">个人信息管理</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <%--发布--%>
            <div class="wrapper wrapper-content animated fadeInRight onHide" style="width: 900px" id="app">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5 class="icon-title-h5"><i class="fa fa-plus-square marginLf6"></i>发布</h5>
                    </div>
                    <div id="additem" class="ibox-content">
                        <div class="row row-lg">
                            <form class="layui-form col-sm-8" action="" id="saveS" enctype="multipart/form-data">
                                <div class="layui-form-item">
                                    <!-- form-label-must 红色标注必须的class -->
                                    <label class="layui-form-label form-label-must">联系人</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="lxr" lay-verify="required" required autocomplete="off" placeholder="真实姓名" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <!-- form-label-must 红色标注必须的class -->
                                    <label class="layui-form-label form-label-must">联系电话</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="lxfs" lay-verify="required|phone" required autocomplete="off" placeholder="联系电话" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label form-label-must">职位类型</label>
                                    <div class="layui-input-inline">
                                        <select name="typeId" lay-verify="required"  lay-filter="role">
                                            <option value="">请选择</option>
                                            <option :value="row.id" v-for="row in list">{{ row.name }}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <!-- form-label-must 红色标注必须的class -->
                                    <label class="layui-form-label form-label-must">人数</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="rs" lay-verify="required|number" required autocomplete="off" placeholder="人数" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <!-- form-label-must 红色标注必须的class -->
                                    <label class="layui-form-label form-label-must">支教时间</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="time" id="date" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <!-- form-label-must 红色标注必须的class -->
                                    <label class="layui-form-label form-label-must">备注</label>
                                    <div class="layui-input-block">
                                        <textarea name="bz" style="height: 200px" required autocomplete="off" placeholder="简介" class="layui-input"></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button type="button" class="layui-btn" lay-submit="" lay-filter="saveSub2">立即提交</button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%--发布--%>
            <%--已发布--%>
            <div class="ydc-column ydc-column-8 onHide" id="yfb">
                <div class="ydc-release-content">
                    <div class="ydc-tabPanel ydc-tabPanel-release">
                        <div class="ydc-release-tab-head">
                            <ul>
                                <li class="hit">已发布列表</li>
                            </ul>
                        </div>
                        <div class="ydc-panes" >
                            <div class="ydc-panes-account" style="width: 900px; margin: 20px">
                                <table style="">
                                    <thead>
                                    <tr>
                                        <th style="text-align: center">职位</th>
                                        <th style="text-align: center">人数</th>
                                        <th style="text-align: center">开始时间</th>
                                        <th style="text-align: center">结束时长</th>
                                        <th style="text-align: center">联系人</th>
                                        <th style="text-align: center">联系方式</th>
                                        <th style="text-align: center">报名人数</th>
                                        <th style="text-align: center">状态</th>
                                        <th style="text-align: center">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(row,index) in yfbs">
                                            <td>{{ row.typeId|formatZw }}</td>
                                            <td>{{ row.rs }}</td>
                                            <td>{{ row.zjTime|formatDate }}</td>
                                            <td>{{ row.fwTime|formatDate }}</td>
                                            <td>{{ row.lxr }}</td>
                                            <td>{{ row.lxfs }}</td>
                                            <td>{{ row.rs - row.syrs }}</td>
                                            <td>{{ row.isFb==0 ? '招聘中' : '截止' }}</td>
                                            <td>
                                                <a href="javascript:;" @click="redetail(row.id)">详情</a>
                                                <a href="javascript:;" v-if="row.isFb == 0" @click="reEdit(row.id)">修改</a>
                                                <a href="javascript:;" v-if="row.isFb == 0" @click="isFb(row.id)">结束报名</a>
                                                <%--<a href="javascript:;" v-if="row.isFb == 1" @click="isPl(row.id, row.usersId)">评论</a>--%>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--已发布--%>
            <%--已报名--%>
            <div class="ydc-column ydc-column-8 onHide" id="ybm">
                <div class="ydc-release-content">
                    <div class="ydc-tabPanel ydc-tabPanel-release">
                        <div class="ydc-release-tab-head">
                            <ul>
                                <li class="hit">已报名列表</li>
                            </ul>
                        </div>
                        <div class="ydc-panes" >
                            <div class="ydc-panes-account" style="width: 900px; margin: 20px">
                                <table style="">
                                    <thead>
                                    <tr>
                                        <th style="text-align: center">报名人</th>
                                        <th style="text-align: center">报名职位</th>
                                        <th style="text-align: center">报名时间</th>
                                        <th style="text-align: center">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="(row,index) in ysbs">
                                        <td>{{ row.sbrName }}</td>
                                        <td>{{ row.typeName }}</td>
                                        <td>{{ row.sqTime|formatDate }}</td>
                                        <td><a href="javascript:;" v-if="row.releases.isFb == 1" @click="isPl(row.releases.id, row.releases.usersId, row.sqr)">评论</a></td>

                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--已报名--%>
            <div class="ydc-column ydc-column-8 onHide" id="admin">
            <section class="property-agent common">
                <h4 class="entry-title">联系管理员</h4>
                <div class="row">
                    <div class="col-lg-7">
                        <div class="address-widget clearfix">
                            <ul>
                                <li>标题：<input type="text" name="title" id="title" style="width: 710px; height: 35px"/></li>
                                <li>内容：<textarea style="width: 710px; height: 200px" id="nr"></textarea></li>
                                <li>
                                    <button type="button" @click="adminSave" class="btn btn-default btn-lg text-center btn-3d" data-hover="提交">提交</button></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            </div>
            <div class="ydc-column ydc-column-8 onHide" id="pllb">
                <div class="ydc-release-content">
                    <div class="ydc-tabPanel ydc-tabPanel-release">
                        <div class="ydc-release-tab-head">
                            <ul>
                                <li class="hit">评论列表</li>
                            </ul>
                        </div>
                        <div class="ydc-panes" >
                            <div class="ydc-panes-account" style="width: 900px; margin: 20px">
                                <table style="">
                                    <thead>
                                    <tr>
                                        <th style="text-align: center">评论人</th>
                                        <th style="text-align: center; width: 100px">评论时间</th>
                                        <th style="text-align: center">标题</th>
                                        <th style="text-align: center">内容</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="(row,index) in pls">
                                        <td>{{ row.plr.realName }}</td>
                                        <td>{{ row.evaluate.pjTime|formatDate }}</td>
                                        <td>{{ row.evaluate.title }}</td>
                                        <td>{{ row.evaluate.nr }}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wrapper wrapper-content animated fadeInRight"  id="grxx">
                <!-- 编辑div -->
                <div id="divNodeEdit" class="ibox float-e-margins hidden-div" style="width: 800px">
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
                                        <select name="role" lay-verify="required"  lay-filter="role" id="roleselect" disabled>
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
        </div>
    </div>
</section>

<script src="${ctx}/resource/libs/js/bootstrap-paginator.js" charset="utf-8"></script>
<!-- 单张图片上传 -->
<script src="${ctx}/resource/libs/js/upload.js" charset="utf-8"></script>
<!-- 自定义js -->
<%@ include file="foot.jsp"%>
<script>
    var form;
    $(function () {
        layui.use(['form', 'layedit', 'laydate'], function () {
            form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;
            //日期
            laydate.render({
                elem: '#date',
                range: true
            });
            form.on('select(role)', function(data){
                if (data.value == 2){
                    app.flag = true
                } else {
                    app.flag = false
                }
                form.render(); //更新全部
                form.render('select'); //刷新select选择框渲染
            })


            form.on('submit(saveSub2)', function(data){
                app.sub(data.field)
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
                    url : "${ctx}/users/updateGrxx.json",
                    data : form,
                    async : false,
                    contentType: false,
                    processData: false,
                    success : function(data) {
                        layer.alert(data.message, {
                            title: '提示信息'
                        })
                        if (data.flag) {
                            app.isGrxx()
                        }
                    }
                });
            });
        });
    })
    var app = new Vue({
        el: "#vueContent",
        data: {
            list: [],
            yfbs:'',
            ysbs:'',
            pls:'',
            bean:'',
            flag:false,
            ctx:'${ctx}',
            pageIndex2: 1,
            pageIndex : 1
        },
        mounted: function () {
            this.getUser();
            $('.onHide').hide();
            this.onShow('app')
            this.$nextTick(function () {
                this.getTypes()
            });

        }, filters:{
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
            formatZw:function (val) {
                for (var i= 0; i<app.list.length; i++){
                    if (app.list[i].id == val){
                        return app.list[i].name
                    }
                }
            }
        },
        methods: {
            //获取图片地址
            getImgUrl:function(icon){
                return this.ctx+icon;
            },
            getUser: function () {
                var _that = this;
                this.$http.post('${ctx}/users/getUser.json', {emulateJSON: true,cache:false,async:false}).then(function (res) {
                    if (res.user){
                        window.location.href = "${ctx}/login.do"
                    }
                }, function () {
                });
            },
            adminSave: function () {
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
                this.$http.post('${ctx}/web/adminSave.json',{nr: nr,title: title},{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    layer.alert(res.data.message, function (index) {
                        layer.close(index)
                        $("#title").val('');
                        $("#nr").val('');
                    },{title: '提示信息'})
                }, function () {
                });
            },
            isFb: function (id) {
                var _that = this;
                this.$http.post('${ctx}/web/isFb.json', {id:id}, {emulateJSON: true,cache:false,async:false}).then(function (res) {
                    layer.alert(res.data.message, {
                        title: '提示信息'
                    })
                    _that.initialize()
                }, function () {
                });
            },
            isPl: function (id, usersId, sqr) {
                console.log(sqr)
                layer.open({
                    type: 2,
                    anim: 1,
                    title: false,
                    shadeClose: true,
                    shade: 0.8,
                    scrollbar: false,
                    resize: false,
                    area: ['900px', '650px'],
                    content: '${ctx}/web/isPl.do?id=' + id + '&userId=' + usersId+ '&sqr=' + sqr
                });
            },
            redetail: function(id){
                layer.open({
                    type: 2,
                    anim: 1,
                    title: false,
                    shadeClose: true,
                    shade: 0.8,
                    scrollbar: false,
                    resize: false,
                    area: ['900px', '650px'],
                    content: '${ctx}/web/reDetail.do?id=' + id
                });
            },
            reEdit: function(id){
                layer.open({
                    type: 2,
                    anim: 1,
                    title: false,
                    shadeClose: true,
                    shade: 0.8,
                    scrollbar: false,
                    resize: false,
                    area: ['900px', '650px'],
                    content: '${ctx}/web/yfbEdit.do?id=' + id
                });
            },
            onShow: function (type) {
                $('.onHide').hide();
                $('#' + type).show();
                if (type == 'yfb'){
                    this.initialize()
                } else if (type == 'ybm'){
                    this.isYbm()
                } else if (type == 'pllb'){
                    this.isPllb()
                } else if (type == 'grxx'){
                    this.isGrxx()
                }
            },
            isGrxx: function () {
                var _that = this;
                this.getUser()
                this.$http.post('${ctx}/users/grxx.do',{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    _that.bean = res.data.bean;
                    console.log(_that.bean)
                    $('#divNodeEdit').show();
                    $('html,body').animate({scrollTop: $('#divNodeEdit').offset().top}, 500);
                    $("#roleselect").val(_that.bean.role)
                    form.render('select');
                    _that.flag = _that.bean.role == 2 ? true : false
                }, function () {
                });
            },
            isPllb: function () {
                var _that = this;
                this.$http.post('${ctx}/web/pllb.json', {offset: _that.pageIndex},{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    _that.pls = res.data.list;
                    // getPage(res.data.page.size, res.data.page.offset, res.data.page.total)
                }, function () {
                });
            },
            isYbm: function () {
                var _that = this;
                this.$http.post('${ctx}/web/ybmlist.json', {pageIndex: _that.pageIndex},{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    _that.ysbs = res.data.list;
                    // _that.pageIndex = res.data.page.pageNum
                    // getPage(res.data.page.size, res.data.page.pageNum, res.data.page.total, res.data.page.pages)
                }, function () {
                });
            },
            initialize: function () {
                var _that = this;
                this.$http.post('${ctx}/web/yfblist.json', {pageIndex: _that.pageIndex2, sfz:_that.sfz,role: _that.role, phone:_that.phone, realName:_that.realName},{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    _that.yfbs = res.data.list;
                    // _that.pageIndex2 = res.data.page.pageNum
                    // getPage(res.data.page.size, res.data.page.pageNum, res.data.page.total, res.data.page.pages)
                }, function () {
                });
            },
            sub: function(data) {
                this.$http.post('${ctx}/web/fbzwsave.json',data,{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    layer.alert(res.data.message, {
                        title: '提示信息'
                    })
                }, function () {
                });
            },
            getTypes: function (){
                var _that = this
                this.$http.post('${ctx}/type/getList.json',{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    _that.list = res.data.list;
                }, function () {
                });
            }
        }
    });
</script>
</body>
</html>