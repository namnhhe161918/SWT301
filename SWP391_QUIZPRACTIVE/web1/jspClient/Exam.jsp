<%-- 
    Document   : Learning
    Created on : Jun 7, 2023, 9:11:44 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="Entities.Question"%>
<%@page import="Entities.Answer"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>ClassiGrids - Classified Ads and Listing Website Template.</title>
        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <!-- Place favicon.ico in the root directory -->

        <!-- Web Font -->
        <link
            href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
        
        <link rel="stylesheet" href="./assets/css/newcss.css"/>
        <!-- fontanswer icons -->
        <script src="https://kit.fontawesome.com/fe000f9b2a.js" crossorigin="anonymous"></script>

        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!-- ========================= CSS here ========================= -->
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="./assets/css/LineIcons.2.0.css" />
        <link rel="stylesheet" href="./assets/css/animate.css" />
        <link rel="stylesheet" href="./assets/css/tiny-slider.css" />
        <link rel="stylesheet" href="./assets/css/glightbox.min.css" />
        <link rel="stylesheet" href="./assets/css/main.css" />
        <link rel="stylesheet" href="./assets/css/exam.css" />
        
        
    </head>
    <body>
        
        <%
        Vector<Question> listQuestion = (Vector<Question>) request.getAttribute("listQuestion");
        Vector<Answer> listAnswer = (Vector<Answer>) request.getAttribute("listAnswer");
        String nameCourse = (String) request.getAttribute("nameCourse");
        int id = (int) request.getAttribute("id");
        %>
        
        <div style="margin-bottom: 150px ">
            <jsp:include page="Header.jsp"></jsp:include>
        </div>
        
        <div style="text-align: center; margin-bottom: 20px">
            <h2><%=nameCourse%></h2>
        </div>
        
        <div class="container exam">
            <div class="content_exam">
                <form action="CourseController" method="post">
                    <input type="hidden" name="service" value="result">
                    <input type="hidden" name="id" value="<%=id%>">
                    <%int i = 0;
                    for (Question question : listQuestion) {
                        i++;%>
                    <div style="margin-bottom: 12px">
                        <p style="margin-bottom: 8px" class="question"><%=i%>. <%=question.getQuestion_name()%></p>
                        <%for (Answer answer : listAnswer) {
                            if(answer.getQuestion_id() == question.getQuestion_id()) {%> 
                            <input style="margin-bottom:8px" id="<%=answer.getAnswer_id()%>" class="<%=question.getQuestion_id()%>" name="question<%=question.getQuestion_id()%>" type="radio" value="<%=answer.getIs_correct()%>_<%=answer.getAnswer_id()%>" onclick="handleClick(className)"/>
                            <label for="<%=answer.getAnswer_id()%>"><%=answer.getAnswer_name()%></label><br>
                            <input type="hidden" name="answer<%=answer.getAnswer_id()%>" value="<%=answer.getAnswer_id()%>" >
                            <%}
                        }%>
                    </div>
                    <%}%>
                    <div class="bottom-content">
                        <input id="submit" class="btn btn-block btn-primary" type="submit" value="Submit">
                    </div>
                </form>
            </div>
                    
            <div class="menu_exam">
                <%for (Question question : listQuestion) {%>
                <div>
                    <p id="question<%=question.getQuestion_id()%>" class="number_question"><%=question.getQuestion_id()%></p>
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
            
            function handleClick(className) {
                document.getElementById('question' + className).classList.add('forcus');
            }
            
        </script>
    </body>
</html>
