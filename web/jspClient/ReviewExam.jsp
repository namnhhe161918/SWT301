<%-- 
    Document   : Result
    Created on : Jun 12, 2023, 11:57:24 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="Entities.Question"%>
<%@page import="Entities.Exam_results"%>
<%@page import="Entities.ResultTest"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./assets/css/result.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

        <!--popup of -->
        <link rel="stylesheet" href="./assets/css/newcss.css"/>
        <!-- fontanswer icons -->
        <script src="https://kit.fontawesome.com/fe000f9b2a.js" crossorigin="anonymous"></script>

        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    </head>
    <body>

        <%
        ResultTest rt = (ResultTest) request.getAttribute("rt");
        String nameCourse = (String) request.getAttribute("nameCourse");
        Vector<Question> listQuestion = (Vector<Question>) request.getAttribute("listQuestion");
        Vector<Exam_results> listEr = (Vector<Exam_results>) request.getAttribute("er");
        int id = (int) request.getAttribute("id");
        %>

        <div style="margin-bottom: 150px ">
            <jsp:include page="Header.jsp"></jsp:include>
            </div>

            <div style="text-align: center; margin-bottom: 20px">
                <h2><%=nameCourse%></h2>
        </div>

        <div class="result_detail">
            <div>
                <div style="margin-bottom: 12px">
                    <p class="result_detail_status"><%=rt.getStatus()%></p> 
                </div>
                <div class="result_detail_grade">
                    <p>Grade received <span style="color: green"><%=rt.getGrade()%>%</span></p>
                    <p>To pass 50% or higher</p>
                </div>
            </div>
        </div>

        <div style="padding: 0 300px; margin-bottom: 20px">
            <div class="content_exam">
                <%int i = 0, j = 0;
                for (Question question : listQuestion) {
                    j++;%>
                <div style="margin-bottom: 12px">
                    <p style="margin-bottom: 8px"><%=j%>. <%=question.getQuestion_name()%></p>
                    <%for (Exam_results er : listEr) {
                       if(er.getQuestion_id() == question.getQuestion_id()) {
                           i++;
                           if(er.getAnswer_choose() == er.getAnswer_id()) {%>
                    <span class="icon" id="icon_<%=i%>"></span>
                    <input style="margin-bottom:8px" readonly="" class="result" value="<%=er.getIs_correct()%>" type="radio" checked><span style="margin-left: 4px"><%=er.getAnswer_name()%></span><br>
                    <%} else {%>
                    <span id="icon_<%=i%>"></span>
                    <input style="margin-bottom:8px" readonly="" class="result" value="<%=er.getIs_correct()%>" type="radio"><span style="margin-left: 4px"><%=er.getAnswer_name()%></span><br>
                    <%}
                }
            }%>
                </div>
                <%}%>
                <div class="bottom-content">
                    <a href="CourseController?service=exam&id=<%=id%>" class="btn btn-block btn-primary">Try again</a>
                </div>
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
        <script src="./assets/js/result.js"></script>
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
