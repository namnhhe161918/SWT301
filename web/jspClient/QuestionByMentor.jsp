<%-- 
    Document   : QustionByMentor
    Created on : Jul 7, 2023, 12:23:47 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
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
        
        
        <%int course_id = Integer.parseInt(request.getParameter("course_id"));%>
        <div class="container" style="margin-top: 15px; background-color: #F3F6E6 ; margin-bottom: 15px">
            <div class="back" style="padding: 20px">
                <a style="font-size: 20px; border-bottom: solid greenyellow 1px; width: 170px" href="CourseMentor">Back to dashboard</a>
            </div>
            
            <div class="row" style="padding: 50px 0">
                <!--create Qustion-->
                <div class="create col-md-4">
                    <h3 style="margin-bottom: 10px; border-bottom: solid 1px black; width: 300px">Create a Question</h3>
                    
                    <div class="modal-subject">
                        <div class="modal-container-subject">
                            <form action="QuestionByMentor" method="POST">
                                <input type="hidden" name="service" value="create">
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
                                    <button style="margin: 10px 0 0 300px; width: 80px; height: 30px; border-radius: 15%; " class="btn-create btn-success">Create</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div> 
                
                <!--course created-->
                <div class="col-md-8">
                    <%String course_name = (String) request.getAttribute("course_name");%>
                    <h3 style="margin-bottom: 10px; border-bottom: solid 1px black; width: 500px"><%=course_name%></h3>
                        <%ResultSet rsQuestion = (ResultSet) request.getAttribute("rsQuestion");%>
                    <table class="table">
                        <thead>
                            <tr class="text-center" style="background-color: #B8EA99 ">
                                <th scope="col">Num</th>
                                <th scope="col">Question Name</th>
                                <th scope="col">Update</th>
                                <th scope="col">Delete</th>
                            </tr>
                        </thead>

                        <tbody style="font-weight: 500" >
                            <%  int i = 0;
                                while (rsQuestion.next()) { 
                                    i++;
                            %>
                                <tr>
                                    <td class="text-center"> <%=i%> </td>
                                    <td class="text-center"> <%=rsQuestion.getString(1)%> </td>
                                    <!--update-->
                                    <td class="text-center">
                                        <button style="border: transparent" class="edit-btn"><a href="QuestionByMentor?service=update&question_id=<%=rsQuestion.getInt(2)%>"><i class="far fa-edit"></i></a></button>
                                    </td>
                                    <!--delete-->
                                    <td class="text-center">
                                        <button style="border: transparent" class="edit-btn"><a href="#"><i class="fa-solid fa-trash"></i></i></a></button>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>                                                               
            </div>
        </div>
    </body>
</html>
