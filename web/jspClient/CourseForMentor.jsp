<%-- 
    Document   : HomePage
    Created on : May 19, 2023, 3:15:45 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entities.AccountMentor"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Quiz Practice</title>
        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />
        <!-- Place favicon.ico in the root directory -->

        <!--Link icon-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-pfMvQ9Z7V5BJI7QVJjwfnYGAKBtUxjlh2R8lG4b/ZzWWTd1kApqFw3L8eB0jo+0gQvO4+6N0x5sqi/qXZMvG1Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />

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
        <link rel="stylesheet" href="assets/css/main.css" />

        <!--popup of Marketer-->
        <link rel="stylesheet" href="./assets/css/newcss.css"/>
        <!-- fontanswer icons -->
        <script src="https://kit.fontawesome.com/fe000f9b2a.js" crossorigin="anonymous"></script>

        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    </head>

    <body>


        
        <jsp:include page="Header.jsp"></jsp:include>
        
        
        <div class="container" style="margin-top: 150px; background-color: #F5EAEA; margin-bottom: 150px">
            <div class="row" style="padding: 50px 0">
                <!--create course-->
                <div class="create col-md-4">
                    <h3 style="margin-bottom: 10px; border-bottom: solid 1px black; width: 300px">Create a Course</h3>
                    
                    <div class="modal-subject">
                        <div class="modal-container-subject">
                            <form action="CourseMentor" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="service" value="add">
                                <div class="input">
                                    <label for="course-name"> <strong>Course name</strong></label><br>
                                    <input class="form-control" id="course-name" type="text" name="name" required/>
                                </div>
                                <div class="input">
                                    <label for="course-description"> <strong>Description</strong></label>
                                    <input id="course-description" name="description" type="text" class="form-control" required>
                                </div>
                                <div class="input">
                                    <label for="course-image"> <strong>Image</strong> </label>
                                    <input id="course-image" name="image" type="file" class="form-control" required>
                                </div>
                                <div class="input" style="margin-top: 10px">
                                    <label for="publish"> <strong>Publish</strong></label>
                                    <select id="publish" name="publish">
                                        <option value="1">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                </div>
                                <div>
                                    <label for="subject-name"> <strong>Subject name: </strong> </label>
                                    <%ResultSet rsSubject = (ResultSet) request.getAttribute("rsSubject");%>
                                    
                                    <select id="subject-name" name="subject_id">
                                        <%while(rsSubject.next()) {%>
                                            <option value="<%=rsSubject.getInt(1)%>"><%=rsSubject.getString(2)%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="button">
                                    <button style="margin: 10px 0 0 300px; width: 80px; height: 30px; border-radius: 15%; " class="btn-create btn-success">Create</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div> 
                
                <!--course created-->
                <div class="col-md-8">
                    <h3 style="margin-bottom: 10px; border-bottom: solid 1px black; width: 500px">Courses you have posted</h3>
                    <%ResultSet rsCourse = (ResultSet) request.getAttribute("rsCourse");%>
                    <table class="table">
                        <thead>
                            <tr class="text-center" style="background-color: #9D8C9D">
                                <th scope="col">Num</th>
                                <th scope="col">Subject Name</th>
                                <th scope="col">Course Name</th>
                                <th scope="col">Image</th>
                                <th scope="col">Questions</th>
                                <th scope="col">View question</th>
                                <th scope="col">Update</th>
                                <th scope="col">Delete</th>
                            </tr>
                        </thead>

                        <tbody style="font-weight: 500" >
                            <%  int i = 0;
                                while (rsCourse.next()) {
                                i++;
                            %>
                            <tr>
                                <td class="text-center"> <%=i%> </td>
                                <td class="text-center"> <%=rsCourse.getString(2)%> </td>
                                <td class="text-center"> <%=rsCourse.getString(3)%> </td>
                                <td> 
                                    <img style="width: 50px; height: 50px" src="<%=rsCourse.getString(4)%>"> 
                                </td>
                                <td class="text-center"><%=rsCourse.getInt(5)%></td>
                                <td> 
                                    <a class="text-center" href="QuestionByMentor?service=show&course_id=<%=rsCourse.getInt(1)%>"> Question Details <i class="far fa-question-circle"></i></a> 
                                </td>
                                <td class="text-center">
                                    <!--update-->
                                    <button style="border: transparent" class="edit-btn"><a href="CourseMentor?service=update&course_id=<%=rsCourse.getInt(1)%>"><i class="far fa-edit"></i></a></button>
                                </td>
                                <td class="text-center">
                                    <!--delete-->
                                    <form action="CourseMentor" method="POST">
                                        <input type="hidden" name="service" value="delete">
                                        <input type="hidden" name="course_id" value="<%=rsCourse.getInt(1)%>">

                                        <button type="submit" class="delete-btn" data-toggle="modal" onclick="return confirm('Are you sure you want to delete this course?')">                                   
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                        
                        
                        
                </div>
                       
                        
                        
                <form method="CourseMentor" action="post">
                    <input type="hidden" value="service" name="update">
                </form>
            </div>
        </div>    






            <!-- start Footer -->
        <jsp:include page="Footer.jsp"></jsp:include>
        <!--/ End Footer Area -->



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
