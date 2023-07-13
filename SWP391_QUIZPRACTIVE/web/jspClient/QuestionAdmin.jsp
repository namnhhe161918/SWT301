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

        <%
            String course_name = (String) request.getAttribute("coursename");
            int course_id = (int) request.getAttribute("course_id");
        %>


        <div style="margin-bottom: 100px">
            <jsp:include page="HeaderAdmin.jsp"></jsp:include>
        </div>


        <div class="container">
            <div style="margin-bottom: 20px; display: flex">
                <h4 style="margin-right: 8px"><%=course_name%></h4>
                <span class="btn-open-modal">Add new Question</span>
            </div>
            <%if(request.getAttribute("listQuestion") != null) {
                ResultSet listQuestion = (ResultSet) request.getAttribute("listQuestion");
            %>
            <table class="table">
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Content</th>
                    <th scope="col">Course name</th>
                    <th scope="col">Subject name</th>
                    <th scope="col">Action</th>
                </tr>

                <%int i = 0;
                while(listQuestion.next()) {
                    i++;%>
                <tr>
                    <td><%=i%></td>
                    <td><%=listQuestion.getString(2)%></td>
                    <td><%=listQuestion.getString(3)%></td>
                    <td><%=listQuestion.getString(4)%></td>
                    <td>
                        <button style="border: transparent" class="edit-btn"><a href="QuestionAdmin?service=edit&question_id=<%=listQuestion.getInt(1)%>"><i class="far fa-edit"></i></a></button>
                    </td>
                </tr>
                <%}%>
            </table>

            <div class="modal-subject" style="z-index: 1">
                <div class="modal-container-subject">
                    <div class="modal-subject-title">
                        <h4>Add new question</h4>
                    </div>
                    <form <form action="QuestionAdmin" method="get">
                        <input type="hidden" name="service" value="add">
                        <input type="hidden" name="course_id" value="<%=course_id%>">
                        <div class="input">
                            <label for="question-name">Question name</label><br>
                            <input id="question-name" type="text" name="name" />
                        </div>
                        <div class="input">
                            <label for="option-1">Option 1</label>
                            <input id="option-1" name="op1" type="text" class="form-control">
                            <select name="sl1">
                                <option value="1">True</option>
                                <option value="0">False</option>
                            </select>
                        </div>
                        <div class="input">
                            <label for="option-2">Option 2</label>
                            <input id="option-2" name="op2" type="text" class="form-control">
                            <select name="sl2">
                                <option value="1">True</option>
                                <option value="0">False</option>
                            </select>
                        </div>
                        <div class="input">
                            <label for="option-3">Option 3</label>
                            <input id="option-3" name="op3" type="text" class="form-control">
                            <select name="sl3">
                                <option value="1">True</option>
                                <option value="0">False</option>
                            </select>
                        </div>
                        <div class="input">
                            <label for="option-4">Option 4</label>
                            <input id="option-4" name="op4" type="text" class="form-control">
                            <select name="sl4">
                                <option value="1">True</option>
                                <option value="0">False</option>
                            </select>
                        </div>
                        <div class="input">
                            <label for="option-5">Option 5</label>
                            <input id="option-5" name="op5" type="text" class="form-control">
                            <select name="sl5">
                                <option value="1">True</option>
                                <option value="0">False</option>
                            </select>
                        </div>
                        <div class="button">
                            <span class="btn-cancel">Cancel</span>
                            <button style="margin-left: 6px" class="btn-create">Create</button>
                        </div>
                    </form>
                </div>
            </div>
            <%}%>
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
