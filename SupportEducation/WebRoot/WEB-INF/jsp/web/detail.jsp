<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>详情</title>
    <!-- Styles -->
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
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ctx}/resource/web/assets/js/jquery.min.js"></script>
    <script src="${ctx}/resource/web/assets/js/jquery.migrate.js"></script>
    <script src="${ctx}/resource/web/assets/js/bootstrap.min.js"></script>
    <script src="${ctx}/resource/web/plugins/slick-nav/jquery.slicknav.min.js"></script>
    <script src="${ctx}/resource/web/plugins/slick/slick.min.js"></script>
    <script src="${ctx}/resource/web/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="${ctx}/resource/web/plugins/tweetie/tweetie.js"></script>
    <script src="${ctx}/resource/web/plugins/forms/jquery.form.min.js"></script>
    <script src="${ctx}/resource/web/plugins/forms/jquery.validate.min.js"></script>
    <script src="${ctx}/resource/web/plugins/modernizr/modernizr.custom.js"></script>
    <script src="${ctx}/resource/web/plugins/wow/wow.min.js"></script>
    <script src="${ctx}/resource/web/plugins/zoom/zoom.js"></script>
    <script src="${ctx}/resource/web/plugins/mixitup/mixitup.min.js"></script>
    <script src="${ctx}/resource/web/plugins/whats-nearby/source/WhatsNearby.js"></script>
    <script src="${ctx}/resource/web/assets/js/theme.js"></script>
    <script src="${ctx}/resource/libs/js/vue.js" charset="utf-8"></script>
    <script src="${ctx}/resource/libs/js/vue-resource.js" charset="utf-8"></script>
<style>
    .property-single-meta {
        background: url("${ctx}${bean.photo}") right no-repeat;
        background-size: 45% auto
    }
</style>
</head>
<body class="">
<%@ include file="head.jsp"%>
<div id="property-single">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-7">
                <section class="property-meta-wrapper common">
                    <h3 class="entry-title">${bean.schoolName}</h3>
                    <div class="property-single-meta">
                        <ul class="clearfix">
                            <li><span>学校名称 :</span> ${bean.schoolName}</li>
                            <li><span>联系人 :</span> ${bean.realName}</li>
                            <li><span>联系电话 :</span> ${bean.phone}</li>
                            <li><span>学校地址 :</span>${bean.address}</li>
                        </ul>
                    </div>
                </section>
                <section class="property-contents common">
                    <div class="entry-title clearfix">
                        <h4 class="pull-left">学校简介 </h4></a>
                    </div>
                    <p>
                        ${bean.schoolJs}
                    </p>
                </section>
                <section class="property-single-features common clearfix">
                    <h4 class="entry-title">招聘职位</h4>
                    <ul class="property-single-features-list clearfix">
                        <c:forEach items="${res}" var="row">
                            <li style="width: 200px">
                                <span>招聘职位 :</span> ${row.zw}
                            </li>
                            <li style="width: 200px">
                                <span>招聘人数 :</span> ${row.releases.rs}
                            </li>
                            <li style="width: 200px">
                                <span>剩余人数 :</span> ${row.releases.syrs}
                            </li>
                            <li style="width: 200px">
                                <span>开始时间 :</span>  <fmt:formatDate value="${row.releases.zjTime}" type="date" pattern="yyyy-MM-dd"/>
                            </li>
                            <li style="width: 300px">
                                <span>结束是时间 :</span> <fmt:formatDate value="${row.releases.fwTime}" type="date" pattern="yyyy-MM-dd"/>
                            </li>
                        </c:forEach>
                    </ul>
                </section>
                <section class="property-agent common">
                    <h4 class="entry-title">评论</h4>
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="address-widget clearfix">
                                <ul>
                                    <c:forEach items="${list2}" var="row">
                                        <li style="color: #0C0C0C; width: 600px"><i class="fa fa-map-marker"></i>
                                            <c:if test="${row.plr.role == 2}">支教学校：</c:if>
                                            <c:if test="${row.plr.role == 3}">志愿者：</c:if>
                                                ${row.plr.realName} &nbsp; 评论时间：<fmt:formatDate value="${row.evaluate.pjTime}" type="date" pattern="yyyy-MM-dd"/>
                                            <p>评论标题：${row.evaluate.title}</p>
                                            <p>评论内容：${row.evaluate.nr}</p>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="col-lg-4 col-md-5">
                <div id="property-sidebar">
                    <section class="widget adv-search-widget clearfix">
                        <h5 class="title hide">Search your Place</h5>
                        <div id="advance-search-widget" class="clearfix">
                            <form action="#" id="adv-search-form">
                                <div id="widget-tabs">
                                    <ul class="tab-list clearfix">
                                        <li><a class="btn" href="#tab-1">报名</a></li>
                                    </ul>
                                    <div id="tab-1" class="tab-content current">
                                        <fieldset class="clearfix">
                                            <div>
                                                <label for="main-location">职位</label>
                                                <select name="location" id="main-location" v-model="selectId">
                                                    <option :value="item.id" v-for="item in typs">{{ item.name }}</option>
                                                </select>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <button type="button" @click="sub" class="btn btn-default btn-lg text-center btn-3d" data-hover="开始报名">开始报名</button>
                                </div>
                            </form>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="foot.jsp"%>
<a href="#top" id="scroll-top"><i class="fa fa-angle-up"></i></a>
<script>
    var app = new Vue({
        el: "#property-single",
        data: {
            list: [],
            typs: '',
            selectId:'',
            id:'${bean.id}'
        },
        mounted: function () {
            this.$nextTick(function () {
                this.getTypes()
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
                this.$http.post('${ctx}/web/bmsave.json',{releaseId:this.id, typeId:this.selectId},{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    alert(res.data.message)
                }, function () {
                });
            },
            getTypes: function (){
                var _that = this
                this.$http.post('${ctx}/type/getList.json',{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    _that.typs = res.data.list;
                }, function () {
                });
            }
        }
    });
</script>
</body>
</html>