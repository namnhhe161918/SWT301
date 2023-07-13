<%-- 
    Document   : Result
    Created on : Jun 12, 2023, 11:57:24 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./assets/css/result.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="./assets/css/activity.css" />

        <!--popup of -->
        <link rel="stylesheet" href="./assets/css/newcss.css"/>
        <!-- fontanswer icons -->
        <script src="https://kit.fontawesome.com/fe000f9b2a.js" crossorigin="anonymous"></script>

        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    </head>
    <body>

        <%
        ResultSet rs = (ResultSet) request.getAttribute("rs");
        %>

        <div style="margin-bottom: 150px ">
            <jsp:include page="Header.jsp"></jsp:include>
        </div>

        <div class="container" style="margin-bottom: 150px ">
            <div class="row">
                <%while(rs.next()) {%>
                <div class="col-lg-2 col-md-3 col-sm-6">
                    <div class="activity">
                        <a class="activity-link" href="CourseController?service=review&id=<%=rs.getInt(1)%>">
                            <p class="activity-title"><%=rs.getString(2)%></p>
                            <div class="activity-content">
                                <p class="activity-number">Số lượng câu hỏi: <%=rs.getInt(5)%></p>
                                <div class="activity-score" style="
                                    <%if(rs.getInt(4) < 50) {%>
                                        background-color: rgb(238, 134, 134); 
                                    <%} else if(rs.getInt(4) >= 50 && rs.getInt(4) < 85) {%>
                                        background-color: rgb(239, 185, 86);
                                    <%} else {%>
                                        background-color: rgb(100, 231, 100);
                                    <%}%>
                                     ">
                                    <p>Grade: <%=rs.getInt(4)%>%</p>
                                </div>
                            </div>
                        </a>
                    </div>  
                </div>
            <%}%>
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>

        <a href="#" class="scroll-top btn-hover">
            <i class="lni lni-chevron-up"></i>
        </a>

        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/wow.min.js"></script>
        <script src="./assets/js/tiny-slider.js"></script>
        <script src="./assets/js/glightbox.min.js"></script>
        <script src="./assets/js/main.js"></script>
        <script>

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
