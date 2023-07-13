<%-- 
    Document   : HomePage
    Created on : May 19, 2023, 3:15:45 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.*"%>
<%@page import="Entities.Question"%>
<%@page import="Entities.Answer"%>
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
                
            <%
                Vector<Question> vectorQues = (Vector<Question>) request.getAttribute("vectorQues");
                Question question = vectorQues.get(0);
                Vector<Answer> vectorAns = (Vector<Answer>) request.getAttribute("vectorAns");
            %>
                <form action="Course" method="POST">
                    <input type="hidden" name="service" value="edit">
                    <div class="input">
                        <input type="hidden" name="question_id" value="<%=question.getQuestion_id()%>">
                        <label for="question-name">Question name</label><br>
                        <input id="question-name" type="text" name="question-name" class="form-control" value="<%=question.getQuestion_name()%>" />
                    </div>
                    <%for(int i = 0; i < vectorAns.size(); i++) {%>
                    <div class="input">
                        <label for="option-<%=i%>">Option <%=(i+1)%></label>
                        <input id="option-<%=i%>" name="op<%=i%>" type="text" value="<%=vectorAns.get(i).getAnswer_name()%>" class="form-control">
                        <select name="sl<%=i%>">
                            <option value="1" <%=vectorAns.get(i).getIs_correct() == 1 ? "selected" : ""%>>True</option>
                            <option value="0" <%=vectorAns.get(i).getIs_correct() == 0 ? "selected" : ""%>>False</option>
                        </select>
                    </div>
                        <%}%>
                    <div class="button">
                        <a href="Course">Cancel</a>
                        <button type="submit" name="submit" style="margin-left: 6px" class="btn-create">Update</button>
                    </div>
                </form>
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
