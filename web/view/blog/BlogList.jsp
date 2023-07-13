<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="Entities.Blog"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--FIXXED-->
        <link rel="stylesheet" href="view/blog/assets/blog-css/blogstyle.css"/>
        <!--favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo/lloo.png" />
        <title>Blog</title>
        <!--icon-->
        <link rel="stylesheet" href="view/themify-icons-font/themify-icons/themify-icons.css"/>
        <!-- ========================= CSS here ========================= -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

        <!--popup of Marketer-->
        <link rel="stylesheet" href="./assets/css/newcss.css"/>
        <!-- fontanswer icons -->
        <script src="https://kit.fontawesome.com/fe000f9b2a.js" crossorigin="anonymous"></script>

        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <style>
            .content {
                padding-left: 0px;
                padding-right: 0px;
            }
            .paginationn {
                text-align: left;
                margin: 30px 0 0 0;
                display: flex;
            }
            okok li {
                border: 1px solid black;
                border-radius: 5px;
                color: black;
            }

        </style>
        <script>
            function change() {
            <c:choose>
                <c:when test="${categoryblog != null}">
                var searchInput = document.getElementById('searchInput').value;
                var selectInput = document.getElementById('selectInput').value;
                var url = 'listpost?blog_id=${categoryblog.getBlog_id()}&search=' + encodeURIComponent(searchInput) + '&sort=' + encodeURIComponent(selectInput) + '&index=1';
                window.location.href = url;
                </c:when>
                <c:otherwise>
                var searchInput = document.getElementById('searchInput').value;
                var selectInput = document.getElementById('selectInput').value;
                var url = 'listpost?search=' + encodeURIComponent(searchInput) + '&sort=' + encodeURIComponent(selectInput) + '&index=1';
                window.location.href = url;
                </c:otherwise>
            </c:choose>


//                document.getElementById("f1").submit();
            }


        </script>
    </head>
    <body>
        <jsp:include page="/jspClient/Header.jsp" />

        <div class="space"></div>
        <div class="space"></div>

        <!-- slider -->
        <section class="page-section bg-light " id="sliders">
            <div id="demo" class="carousel slide" data-bs-ride="carousel">

                <!-- Indicators/dots -->
                <div class="carousel-indicators">
                    <c:forEach begin="0" var="bsl" end="${requestScope.totalSliderShow - 1}" > 
                        <button type="button" data-bs-target="#demo" data-bs-slide-to="${bsl}" class="${bsl == 0 ? "active" : ""}"></button>
                    </c:forEach>
                </div>

                <!-- The slideshow/carousel -->
                <!-- style="left: 20%; width: 60%;" -->
                <div class="carousel-inner">
                    <c:forEach var="ss" items="${sessionScope.listslider}">
                        <div class="carousel-item ${ss.slider_id == 1 ? "active" : ""}">
                            <a href="SubjectController?service=details&subject_id=${ss.subject_id}" style="width: 100%;"><img src="uploadslider/${ss.url}" alt="" class="d-block w-100"></a>
                        </div>
                    </c:forEach>
                </div>

                <!-- Left and right controls/icons -->
                <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </button>
            </div>
        </section>
        <!-- end slider -->

        <!----breadcrumbs-->
        <div class="breadcrumbs">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="breadcrumbs-content">
                            <h1 class="page-title" style="color: #000;">Featured Posts</h1>
                        </div>
                        <c:if test="${categoryblog != null}">
                            <div>
                                <p style="font-size: 2rem;"> Category : ${requestScope.categoryblog.getBlog_name()} </p>
                            </div> 
                        </c:if>

                    </div>
                    <div class="col-lg-6 col-md-6 col-12">
                        <ul class="breadcrumb-nav">
                            <li><a href="HomeController">Home</a></li>
                            <li>Blog List</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!----breadcrumbs-->

        <div class="content container">
            <div class="row">
            </div>

            <div class="row" id="content">
                <div class="blog_list col-md-8">
                    <c:set var="count" value="0" />
                    <c:forEach var="p" items="${requestScope.plist}" >

                        <div class="blog_item">
                            <h2 class="title_blog" style="font-size: 32px; font-weight: 400;"> <a href="detailpost?postid=${p.getPost_id()}">${p.getTittle()}</a></h2>
                            <div class="intro_author">
                                <div class="avatar_author" style="font-size: 2.9px;">
                                    <img src="assets/avatar/${p.getAm().getImage()}" alt="">
                                </div>
                                <div class="name_author">
                                    ${p.getAm().getDisplay_name()}
                                </div>
                                <div class="blog_infor">
                                    <c:set var="d" value="${p.changeFormat(p.getPosted_date())}"/>

                                    <div class="create_at"><p style="padding: 0 5px;">${d}</p></div>
                                </div>
                            </div>

                            <div class="body-item">
                                <div class="row">
                                    <div class="col-md-7 content_blog_item px-0">
                                        <p class="sub_paraph" style="text-align: justify;margin-left: 15px;color: black;">${p.getShort_content()}</p>
                                    </div>
                                    <div class="col-md-5 image-blog">
                                        <a href="detailpost?postid=${p.getPost_id()}"><img src="assets/images/thumbnail-post/${p.getImage()}" alt="banner.png" onerror="this.src='assets/images/thumbnail-post/broken-image.png'" style="border-radius: 6px; width: 100%;"></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:set var="count" value="${count + 1}" />
                    </c:forEach>

                    <c:if test="${count == 0}">
                        <div class="error-area">
                            <div class="d-table">
                                <div class="d-table-cell">
                                    <div class="container">
                                        <div class="error-content">
                                            <h1>404</h1>
                                            <p>Not Found!!!</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </c:if>
                </div>
                <div class="blog_right col-lg-4 col-md-5 col-12">

                    <aside class="">
                        <div class="sidebar blog-grid-page">

                            <div class="widget search-widget">
                                <h5 class="widget-title"><span>Search By Name </span></h5>
                                <c:choose>
                                    <c:when test="${categoryblog != null}">
                                        <form action="listpost?blog_id=${categoryblog.getBlog_id()}&index=1&" id="f1" onchange="change()">
                                        </c:when>
                                        <c:otherwise>
                                            <form action="listpost?index=1&" id="f1" onchange="change()">
                                            </c:otherwise>
                                        </c:choose>

                                        <div class="input"> <input type="text" placeholder="Search Here..." value="${requestScope.search}" name="search" id="searchInput">
                                        </div>
                                        <div class="search-input">
                                            <h5 class="widget-title mt-30"><span>Filter</span></h5>
                                            <select class="form-select" name="sort" id="selectInput">
                                                <option value="0" ${param['sort']==0?"selected":""}>Default</option>
                                                <option value="1" ${param['sort']==1?"selected":""}>Latest Post</option>
                                                <option value="2" ${param['sort']==2?"selected":""}>Latest Date</option>
                                            </select>
                                        </div>
                                    </form>
                            </div>

                            <div class="widget popular-feeds" style="margin-top: 0;">
                                <h5 class="widget-title"><span>Latest Post</span></h5>
                                <div class="popular-feed-loop">
                                    <div class="single-popular-feed">
                                        <div class="feed-desc">
                                            <h6 class="post-title"><a href="detailpost?detailpost=${latestp.getPost_id()}">${latestp.getTittle()}</a></h6>
                                                <c:set var="dd" value="${latestp.changeFormat(latestp.getPosted_date())}"/>
                                            <span class="time"><i class="lni lni-calendar"></i> ${dd}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--                            <div class="widget popular-feeds">
                                                            <h5 class="widget-title"><span>Popular Feeds</span></h5>
                                                            <div class="popular-feed-loop">
                                                                <div class="single-popular-feed">
                                                                    <div class="feed-desc">
                                                                        <h6 class="post-title"><a href="javascript:void(0)">Tips to write an impressive resume online for
                                                                                beginner</a></h6>
                                                                        <span class="time"><i class="lni lni-calendar"></i> 05th Nov 2023</span>
                                                                    </div>
                                                                </div>
                                                                <div class="single-popular-feed">
                                                                    <div class="feed-desc">
                                                                        <h6 class="post-title"><a href="javascript:void(0)">10 most important SEO focus areas for
                                                                                colleges
                                                                                and universities</a></h6>
                                                                        <span class="time"><i class="lni lni-calendar"></i> 24th March 2023</span>
                                                                    </div>
                                                                </div>
                                                                <div class="single-popular-feed">
                                                                    <div class="feed-desc">
                                                                        <h6 class="post-title"><a href="javascript:void(0)">7 things you should never say to your boss in
                                                                                your joblife</a></h6>
                                                                        <span class="time"><i class="lni lni-calendar"></i> 30th Jan 2023</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>-->
                            <div class="widget categories-widget">
                                <h5 class="widget-title"><span>Blog Categories</span></h5>
                                <ul class="custom">
                                    <%
                                        if(request.getAttribute("blist") != null){
                                      HashMap<Blog,Integer> hashmapBlog =  (HashMap<Blog,Integer>) request.getAttribute("blist");
                                      Set<Blog> keySet = hashmapBlog.keySet();
                                      for (Blog key : keySet) {
                                    %>
                                    <li>
                                        <a href="listpost?blog_id=<%=key.getBlog_id()%>"><%=key.getBlog_name()%> <span><%=hashmapBlog.get(key)%></span></a>
                                    </li>
                                    <%}}%>
                                </ul>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
            <div class="container-fluid pt-2">
                <div class="row justify-content-md-center">
                    <div class="pagination left">
                        <c:choose>
                            <c:when test="${categoryblog != null}">
                                <ul class="pagination-list">
                                    <c:if test="${index > 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="listpost?blog_id=${categoryblog.getBlog_id()}&search=${requestScope.search}&sort=${param['sort']}&index=${param['index']-1}">Previous</a>
                                        </li> 
                                    </c:if>
                                    <c:forEach var = "i" begin = "1" end = "${numberPage}">
                                        <li class="${param['index']==i?'page-item active':'page-item'}"><a href="listpost?blog_id=${categoryblog.getBlog_id()}&search=${requestScope.search}&sort=${param['sort']}&index=${i}" class="page-link">${i}</a></li>
                                        </c:forEach>
                                        <c:if test="${ index < numberPage}">
                                        <li class="page-item"><a class="page-link" href="listpost?blog_id=${categoryblog.getBlog_id()}&search=${requestScope.search}&sort=${param['sort']}&index=${param['index']+1}">Next</a></li>
                                        </c:if>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <ul class="pagination-list">
                                    <c:if test="${index > 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="listpost?search=${requestScope.search}&sort=${param['sort']}&index=${param['index']-1}">Previous</a>
                                        </li> 
                                    </c:if>
                                    <c:forEach var = "i" begin = "1" end = "${numberPage}">
                                        <li class="${param['index']==i?'page-item active':'page-item'}"><a href="listpost?search=${requestScope.search}&sort=${param['sort']}&index=${i}" class="page-link">${i}</a></li>
                                        </c:forEach>
                                        <c:if test="${ index < numberPage}">
                                        <li class="page-item"><a class="page-link" href="listpost?search=${requestScope.search}&sort=${param['sort']}&index=${param['index']+1}">Next</a></li>
                                        </c:if>
                                </ul>
                            </c:otherwise>
                        </c:choose>
                    </div>

                </div>
            </div>
        </div>
        <jsp:include page="/jspClient/Footer.jsp" />
        <!--/ End Footer Area -->
        <!-- ========================= scroll-top ========================= -->


        <!-- ========================= JS here ========================= -->
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/wow.min.js"></script>
        <script src="assets/js/tiny-slider.js"></script>
        <script src="assets/js/glightbox.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script type="text/javascript">
                                                //========= Category Slider 
                                                tns({
                                                    container: '.category-slider',
                                                    items: 3,
                                                    slideBy: 'page',
                                                    autoplay: false,
                                                    mouseDrag: true,
                                                    gutter: 0,
                                                    nav: false,
                                                    controls: true,
                                                    controlsText: ['<i class="lni lni-chevron-left"></i>', '<i class="lni lni-chevron-right"></i>'],
                                                    responsive: {
                                                        0: {
                                                            items: 1
                                                        },
                                                        540: {
                                                            items: 2
                                                        },
                                                        768: {
                                                            items: 4
                                                        },
                                                        992: {
                                                            items: 5
                                                        },
                                                        1170: {
                                                            items: 6
                                                        }
                                                    }
                                                }
                                                );
        </script>
    </body>
</html>


