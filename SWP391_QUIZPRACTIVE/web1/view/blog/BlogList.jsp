<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--FIXXED-->
        <link rel="stylesheet" href="view/blog/assets/blog-css/blogstyle.css"/>
        <!--favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo/lloo.png" />

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

                var searchInput = document.getElementById('searchInput').value;
                var selectInput = document.getElementById('selectInput').value;
                var url = 'listpost?search=' + encodeURIComponent(searchInput) + '&sort=' + encodeURIComponent(selectInput) + '&index=1';
                window.location.href = url;
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
                            <a href="#" style="width: 100%;"><img src="uploadslider/${ss.url}" alt="" class="d-block w-100"></a>
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

        <div class="content container">
            <div class="row">
                <form action="listpost?index=1&" id="f1" style="display: flex" onchange="change()">
                    <div class="col-sm-4 col-lg-6 pt-3" style="width: 33%;">
                        <h6 style="color: #055160; font-weight: 400; padding: 10px 0">Search By Name</h6>

                        <div class="input-group" style="width: 60%;">
                            <input type="search" class="form-control rounded" placeholder="Search" value="${requestScope.search}" aria-label="Search"
                                   aria-describedby="search-addon" name="search" id="searchInput"/>

                        </div>
                    </div>
                    <div class="col-sm-4 col-lg-6 pt-3" style="width: 33%;">
                        <h6 style="color: #055160; font-weight: 400; padding: 10px 0">Sort By</h6>
                        <select class="form-select" name="sort" aria-label=".form-select-sm example" style="width: 60%;" id="selectInput">
                            <option value="0" ${param['sort']==0?"selected":""}>Default</option>
                            <option value="1" ${param['sort']==1?"selected":""}>Latest Post</option>
                            <option value="2" ${param['sort']==2?"selected":""}>Latest Date</option>
                        </select>
                    </div>
                </form>
            </div>

            <div class="row" id="content">
                <div class="blog_list col-md-8 mt-sm-7">
                    <c:forEach var="p" items="${requestScope.plist}">
                        <div class="blog_item">
                            <div class="intro_author">
                                <div class="avatar_author" style="font-size: 2.9px;">
                                    <img src="../avatar/${p.getAm().getImage()}" alt="">
                                </div>
                                <div class="name_author">
                                    ${p.getAm().getDisplay_name()}
                                </div>
                            </div>
                            <div class="body-item">
                                <div class="content_blog_item">
                                    <h2 class="title_blog"> <a href="detailpost?detailpost=${p.getPost_id()}">${p.getTittle()}</a></h2>
                                    <p class="sub_paraph">${p.getShort_content()}</p>
                                    <div class="blog_infor">
                                        <div class="create_at"><p style="margin-top: 23%;padding: 0 5px; border-bottom: 2px solid black;">${p.getPosted_date()}</p></div>
                                    </div>
                                </div>
                                <div class="image-blog">
                                    <img src="view/blog/assets/img/imgPost/${p.getImage()}" alt="banner.png" onerror="this.src='view/blog/assets/img/broken-image.png'" width="200px" height="120px" style="border-radius: 6px">
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="blog_right col-md-4 mt-sm-7">

                    <div class="widget widget-latest-post">
                        <div class="widget-title">
                            <h3>Latest Post</h3>
                        </div>
                        <div class="widget-body">
                            <div class="latest-post-aside media">
                                <div class="lpa-right">
                                    <a href="detailpost?detailpost=${latestp.getPost_id()}" style="width: 100%;">
                                        <img src="view/blog/assets/img/imgPost/${latestp.getImage()}" onerror="this.src='view/blog/assets/img/broken-image.png'">
                                    </a>
                                </div>
                                <div class="lpa-left media-body">
                                    <div class="lpa-title">
                                        <h5><a href="detailpost?detailpost=${latestp.getPost_id()}">${latestp.getTittle()}</a></h5>
                                        <p class="sub_paraph" style="font-size: 10px;">${latestp.getShort_content()}</p>
                                    </div>
                                    <div class="lpa-meta">
                                        <a class="name" href="#">
                                            ${latestp.getAm().getDisplay_name()}
                                        </a>
                                        ${latestp.getPosted_date()}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget widget-tags">
                        <div class="widget-title">
                            <h3>Tags</h3>
                        </div>
                        <div class="widget-body">
                            <div class="nav tag-cloud">
                                <c:forEach items="${blist}" var="b">
                                    <a href="#">${b.getBlog_name()}<span>(${100})</span></a>

                                </c:forEach>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="transfor_page row-cols-1 mt-md-3  mb-sm-3">
                <nav aria-label="Page navigation example">
                    <ul class="okok paginationn justify-content-center">
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
                    </nav>
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
            <script type="text/javascript">
            
               function checkImage(img) {
                if (img.naturalWidth === 0 || img.naturalHeight === 0) {
                replaceImage(img);
                }
                }
                function replaceImage(img) {
                img.src = "view/blog/assets/img/broken-image.png";
                }
            </script>
        </body>
    </html>


