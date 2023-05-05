<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>支教申请网</title>
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
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/statics/css/style.css" />
    <script src="${ctx}/resource/libs/js/jquery.min.js?v=2.1.4"charset="utf-8"></script>
    <script src="${ctx}/resource/libs/js/bootstrap.min.js?v=3.3.6"charset="utf-8"></script>
    <script src="${ctx}/resource/libs/js/bootstrap-paginator.js" charset="utf-8"></script>
    <!-- 单张图片上传 -->
    <script src="${ctx}/resource/libs/js/upload.js" charset="utf-8"></script>
    <!-- vue验证 -->
    <script src="${ctx}/resource/libs/js/vue.js" charset="utf-8"></script>
    <script src="${ctx}/resource/libs/js/vue-resource.js" charset="utf-8"></script>
    <script src="${ctx}/resource/libs/js/pageNumber.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${ctx}/resource/libs/ll/css/jquery.bxslider.css">
    <link rel="stylesheet" href="${ctx}/resource/libs/ll/css/style.css">
    <script src="${ctx}/resource/libs/js/pageNumber.js" charset="utf-8"></script>
</head>
<body class="listing-template">
<%@ include file="head.jsp"%>
<div id="vueContent">
    <div id="advance-search" class="main-page clearfix">
        <div class="container">
            <form action="#" id="adv-search-form" class="clearfix">
                <fieldset>
                    <select name="location" id="main-location" v-model="selectId">
                        <option value="">请选择支教类型</option>
                        <c:forEach items="${types}" var="row">
                            <option value="${row.id}">${row.name}</option>
                        </c:forEach>
                    </select>
                </fieldset>
            </form>
        </div>
    </div>
    <section id="property-listing">
    <div class="container section-layout">
        <div class="row">
            <div class="col-lg-4 col-sm-6 layout-item-wrap" v-for="(row,index) in list">
                <article class="property layout-item clearfix">
            <figure class="feature-image">
                <a class="clearfix zoom" href="">
                    <img data-action="zoom" :src="getImgUrl(row.photo)" alt="Property Image" style="width: 350px; height: 202px"></a>
            </figure>
            <div class="property-contents clearfix">
                <header class="property-header clearfix">
                    <div class="pull-left">
                        <h6 class="entry-title"><a href="">{{ row.schoolName}}</a></h6>
                        <span class="property-location"><i class="fa fa-map-marker"></i> {{ row.address }}</span>
                    </div>
                    <button class="btn btn-default btn-price pull-right btn-3d" data-hover="详情" @click="detail(row.id)"><strong>详情</strong></button>
                </header>
                <div class="property-meta clearfix">

                </div>
                <div class="contents clearfix">
                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. </p>
                </div>
                <div class="author-box clearfix">
                    <a href="#" class="author-img"><img src="${ctx}/resource/web/assets/images/agents/1.jpg" alt="Agent Image"></a>
                    <cite class="author-name">Personal Seller: <a href="#">Linda Garret</a></cite>
                    <span class="phone"><i class="fa fa-phone"></i> 00894 692-49-22</span>
                </div>
            </div>
        </article>
        </div>
        </div>
        </div>
        <%--<ul id="pagination" class="text-center clearfix">--%>
            <%--<li class="disabled"><a href="#">Previous</a></li>--%>
            <%--<li><a href="#">1</a></li>--%>
            <%--<li><a href="#">3</a></li>--%>
            <%--<li><a href="#">4</a></li>--%>
            <%--<li><a href="#">Next</a></li>--%>

        <%--</ul>--%>
    </div>
</section>
</div>
<%@ include file="foot.jsp"%>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${ctx}/resource/web/assets/js/jquery.min.js"></script>
<script src="${ctx}/resource/web/assets/js/jquery.migrate.js"></script>
<script src="${ctx}/resource/web/assets/js/bootstrap.min.js"></script>
<script src="${ctx}/resource/web/plugins/slick-nav/jquery.slicknav.min.js"></script>
<script src="${ctx}/resource/web/plugins/slick/slick.min.js"></script>
<script src="${ctx}/resource/web/plugins/jquery-ui/jquery-ui.min.js"></script>
<%--<script src="${ctx}/resource/web/plugins/tweetie/tweetie.js"></script>--%>
<script src="${ctx}/resource/web/plugins/forms/jquery.form.min.js"></script>
<script src="${ctx}/resource/web/plugins/forms/jquery.validate.min.js"></script>
<script src="${ctx}/resource/web/plugins/modernizr/modernizr.custom.js"></script>
<script src="${ctx}/resource/web/plugins/wow/wow.min.js"></script>
<script src="${ctx}/resource/web/plugins/zoom/zoom.js"></script>
<script src="${ctx}/resource/web/plugins/mixitup/mixitup.min.js"></script>
<script src="${ctx}/resource/web/plugins/whats-nearby/source/WhatsNearby.js"></script>
<script src="${ctx}/resource/web/assets/js/theme.js"></script>
<script src="${ctx}/resource/statics/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/resource/statics/js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/resource/libs/ll/js/jquery-1.11.1.min_044d0927.js"></script>
<script type="text/javascript" src="${ctx}/resource/libs/ll/js/jquery.bxslider_e88acd1b.js"></script>
<script src="${ctx}/resource/libs/js/bootstrap-paginator.js" charset="utf-8"></script>
<script type="text/javascript">
    (function(){
        $(".bxslider").bxSlider({
            auto:true,
            prevSelector:$(".top_slide_wrap .op_prev")[0],nextSelector:$(".top_slide_wrap .op_next")[0]
        });
    })();
</script>
<script type="text/javascript">
    var app = new Vue({
        el: "#vueContent",
        data: {
            list: [],
            selectId:'',
            ctx:'${ctx}'
        },
        mounted: function () {
            this.$nextTick(function () {
                this.initialize();
            });
        },
        watch:{
          'selectId': function (curVal,oldVal) {
              app.selectId = curVal
              app.initialize()
          }
        },
        methods: {
            //获取图片地址
            getImgUrl:function(icon){
                return icon;
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
            detail: function (id) {
                window.location.href = "${ctx}/web/detail.do?id=" + id
            },
            initialize: function (type) {
                var _that = this;
                this.$http.post('${ctx}/web/listAll.json', {typeId:_that.selectId},{emulateJSON: true,cache:false,async:false}).then(function (res) {
                    _that.list = res.data.list;
                    // getPage(res.data.page.size, res.data.page.offset, res.data.page.total)
                }, function () {
                });
            }
        }
    });
</script>
</body>
</html>
