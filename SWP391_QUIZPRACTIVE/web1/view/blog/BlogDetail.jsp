<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page  import="DAO.DAOBlog"%>
<%@page  import="DAO.DAOPost"%>
<%@page  import="DAO.DAOMarketer"%>
<%@page  import="DAO.DAOSubject"%>
<%@page  import="java.util.List"%>
<%@page  import="Entities.Post"%>
<%@page  import="Entities.AccountMarketer"%>
<%@page  import="Entities.Subject"%>
<%@page  import="Entities.Blog"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <!--FIXXED-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="view/blog/assets/blog-css/blogdetailstyle.css"/>
        <link rel="stylesheet" href="themify-icons-font/themify-icons/themify-icons.css"/>
        <!--END FIXXED-->

        <!--favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo/lloo.png" />

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>



        <!--Component-->
        <link
            href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

        <!--popup of Marketer-->
        <link rel="stylesheet" href="./assets/css/newcss.css"/>
        <!-- fontanswer icons -->
        <script src="https://kit.fontawesome.com/fe000f9b2a.js" crossorigin="anonymous"></script>

        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <style>
            .content{
                padding-left: 0px;
                padding-right: 0px;
            }
        </style>
    </head>
    <body>

        <jsp:include page="/jspClient/Header.jsp" ></jsp:include>


            <div class="space"></div>
            <div class="space"></div>
            <div class="space"></div>

            <div class="content container">
                <div class="row">
                    <div class="left-content col-md-8 ">

                        <div class="article_img">
                            <img src="view/blog/assets/img/imgPost/${postfollow.getImage()}" alt="" onerror="this.src='view/blog/assets/img/broken-image.png'">
                    </div>                        
                    <div class="title_article">
                        <h3>${postfollow.getTittle()}</h3>
                    </div>
                    <div class="intro_author">
                        <div class="avatar_author" style="font-size: 2.9px;">
                            <img src="view/avatar/${postfollow.getAm().getImage()}" alt="" onerror="this.src='view/blog/assets/img/broken-image.png'">
                        </div>
                        <div class="name_author">
                            ${postfollow.getAm().getDisplay_name()}
                        </div>
                    </div>
                    <div class="article_content">
                        <div class="paraph_content">
                            <p>${postfollow.getContent()}</p>
                        </div>
                    </div>

                </div>
                <div class="right-content col-md-4 ">
                    <div class="widget widget-latest-post">
                        <div class="widget-title">
                            <h3>Latest Post</h3>
                        </div>
                        <div class="widget-body">
                            <div class="latest-post-aside media">
                                <div class="lpa-right">
                                    <a href="cbd?detailpost=${latestp.getPost_id()}" style="width: 100%;">
                                        <img src="view/blog/assets/img/imgPost/${latestp.getImage()}" onerror="this.src='view/blog/assets/img/broken-image.png'">
                                    </a>
                                </div>
                                <div class="lpa-left media-body">
                                    <div class="lpa-title">
                                        <h5><a href="cbd?detailpost=${latestp.getPost_id()}">${latestp.getTittle()}</a></h5>
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

            <!--test casourel-->
            <section class="pt-5 pb-5">
                <div class="row justify-content-end">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="mb-3">Similar Posts</h3>
                        </div>
                    </div>

                    <div class="row">
                        <div class="card-deck col-md-12" style="display: flex; flex-flow: wrap;">
                            <c:forEach var="e" items="${listpexcept}">
                                <div class="card col-md-4" style="width: 30%; margin: 5px 4px" >
                                    <img class="card-img" 
                                         src="view/blog/assets/img/imgPost/${p.getImage()}" alt="banner.png" onerror="this.src='view/blog/assets/img/broken-image.png'">
                                    <div class="card-body">
                                        <h4 class="card-title"><a href="detailpost?detailpost=${e.getPost_id()}">${e.tittle}</a></h4>
                                        <p class="card-text">${e.getShort_content()}</p>

                                    </div>

                                </div>
                            </c:forEach>

                            <div class="col-md-4" style="position: relative;">
                                <div class="boxing-item" style="border: 1px solid black; position: absolute; top: 50%; left: 10%; width: 240px; height: 40px;"> <p style="text-align: center; line-height: 40px;"><a href="listpost">CHECK OUT OTHER POSTS</a></p> </div>
                            </div>
                        </div>
                    </div>
            </section>

        </div>

        <jsp:include page="/jspClient/Footer.jsp" />

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
                        items: 1,
                    },
                    540: {
                        items: 2,
                    },
                    768: {
                        items: 4,
                    },
                    992: {
                        items: 5,
                    },
                    1170: {
                        items: 6,
                    }
                }
            });



        </script>

    </body>
</html>
