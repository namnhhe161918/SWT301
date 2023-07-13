<%-- 
    Document   : HomePage
    Created on : May 19, 2023, 3:15:45 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Quiz Practice</title>
        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />

        <!--model-->


        <!-- model -->
        <!-- Place favicon.ico in the root directory -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!--Link icon-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-pfMvQ9Z7V5BJI7QVJjwfnYGAKBtUxjlh2R8lG4b/ZzWWTd1kApqFw3L8eB0jo+0gQvO4+6N0x5sqi/qXZMvG1Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

        <!-- Web Font -->
        <link

            href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

        <!-- ========================= CSS here ========================= -->
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="./assets/css/LineIcons.2.0.css" />
        <link rel="stylesheet" href="./assets/css/animate.css" />
        <link rel="stylesheet" href="./assets/css/tiny-slider.css" />
        <link rel="stylesheet" href="./assets/css/glightbox.min.css" />
        <link rel="stylesheet" href="./assets/css/main.css" />
        <link rel="stylesheet" href="./assets/css/admin.css" />
    </head>

    <body>

            <div style="margin-bottom: 100px ">
                <jsp:include page="HeaderAdmin.jsp"></jsp:include>
            </div>
            
            <div class="container">
            <%if(request.getAttribute("notifi") != null) {
                String notifi = (String) request.getAttribute("notifi");%>
                <h2 style="color: green"><%=notifi%></h2>   
            <%}%> 

            <%if(request.getAttribute("rsCourse") != null) {
                ResultSet rsCourse = (ResultSet) request.getAttribute("rsCourse");
                if(rsCourse.next()) {%>
                <form action="Course" method="POST">
                    <input type="hidden" name="service" value="edit">
                    <input type="hidden" name="course_id" value="<%=rsCourse.getInt(1)%>">
                    <input type="hidden" name="subject_id" value="<%=rsCourse.getInt(2)%>">
                    <input type="hidden" name="mentor_id" value="<%=rsCourse.getInt(3)%>">
                    <input type="hidden" name="is_publish" value="<%=rsCourse.getInt(7)%>">
                    <input type="hidden" name="quantity" value="<%=rsCourse.getInt(8)%>">
                    <input type="hidden" name="created_date" value="<%=rsCourse.getString(9)%>">
                    <input type="hidden" name="updated_date" value="<%=rsCourse.getString(10)%>">
                    <div class="input">
                        <label for="course-name">Course name</label><br>
                        <input id="course-name" type="text" name="name" class="form-control" value="<%=rsCourse.getString(4)%>" />
                    </div>
                    <div class="input">
                        <label for="course-description">Description</label>
                        <input id="course-description" name="description" type="text" class="form-control" value="<%=rsCourse.getString(5)%>">
                    </div>
                    <div class="input">
                        <label for="ourse-image">Image</label>
                        <input id="ourse-image" name="image" type="text" value="<%=rsCourse.getString(6)%>" class="form-control">
                    </div>
                    <div class="button">
                        <a href="Course">Cancel</a>
                        <button type="submit" name="submit" style="margin-left: 6px" class="btn-create">Update</button>
                    </div>
                </form>
                <%}
            }%>
                <a href="Course">Back to dashboard</a>
            </div>



        <!-- ========================= scroll-top ========================= -->
        <a href="#" class="scroll-top btn-hover">
            <i class="lni lni-chevron-up"></i>
        </a>

        <!-- ========================= JS here ========================= -->
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/wow.min.js"></script>
        <script src="./assets/js/tiny-slider.js"></script>
        <script src="./assets/js/glightbox.min.js"></script>
        <script src="./assets/js/main.js"></script>
        <script src="./assets/js/admin.js"></script>
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
