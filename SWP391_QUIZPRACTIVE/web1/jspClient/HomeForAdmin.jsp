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


             <div class="container" style="display: flex; position: relative">
            <jsp:include page="Sidebar.jsp"></jsp:include>

                <div class="content" style="margin-left: 50px; flex: 2">
                <%if(request.getAttribute("rsUser") != null) {
                    ResultSet rsUser = (ResultSet) request.getAttribute("rsUser");
                %>
                <h3 style="margin-bottom: 12px">User list</h3>
                <form method="post" action="User">
                    <input type="hidden" name="service" value="search">
                    <div style="display: flex">
                        <input style="padding: 4px 4px; width: 300px; margin-right: 12px" type="text" name="name" placeholder="Enter user name need to search...">
                        <div class="bottom-content">
                            <input class="btn btn-block btn-primary" type="submit" value="Search">
                        </div>

                    </div>
                </form>
                <table class="table">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Email</th>
                        <th scope="col">Password</th>
                        <th scope="col">Address</th>
                        <th scope="col">Actions</th>
                    </tr>

                    <%while(rsUser.next()) {%>
                    <tr>
                        <td><%=rsUser.getInt(1)%></td>
                        <td><%=rsUser.getString(5)%></td>
                        <td>
                            <%if(rsUser.getInt(13) == 1) {%>
                            <i class="fas fa-mars"></i>
                            <% } else { %>
                            <i class="fas fa-venus"></i>
                            <%}%>
                        </td>
                        <td><%=rsUser.getString(2)%></td>
                        <td><%=rsUser.getString(3)%></td>
                        <td><%=rsUser.getString(9)%></td>
                          <td>
                            <form method="POST" action="User">
                                <input type="hidden" name="service" value="deleteUser">
                                <input type="hidden" name="UserId" value="<%= rsUser.getInt("user_id") %>">
                                <button type="submit" class="delete-btn" data-toggle="modal" onclick="return confirm('Are you sure you want to delete this user?')">
                                    <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%}%>
                </table>
                <%}%>

                <%if(request.getAttribute("rsMentor") != null) {
                    ResultSet rsMentor = (ResultSet) request.getAttribute("rsMentor");
                %>
                <h3 style="margin-bottom: 12px">Mentor list</h3>
                <form method="post" action="Mentor">
                    <input type="hidden" name="service" value="search">
                    <div style="display: flex">
                        <input style="padding: 4px 4px; width: 300px; margin-right: 12px" type="text" name="name" placeholder="Enter mentor name need to search...">
                        <div class="bottom-content">
                            <input class="btn btn-block btn-primary" type="submit" value="Search">
                        </div>

                    </div>
                </form>
                <table class="table">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Email</th>
                        <th scope="col">Password</th>
                        <th scope="col">Address</th>
                        <th scope="col">Actions</th>
                    </tr>

                    <%while(rsMentor.next()) {%>
                    <tr>
                        <td><%=rsMentor.getInt(1)%></td>
                        <td><%=rsMentor.getString(5)%></td>
                        <td>
                            <%if(rsMentor.getInt(13) == 1) {%>
                            <i class="fas fa-mars"></i>
                            <% } else { %>
                            <i class="fas fa-venus"></i>
                            <%}%>
                        </td>
                        <td><%=rsMentor.getString(2)%></td>
                        <td><%=rsMentor.getString(3)%></td>
                        <td><%=rsMentor.getString(9)%></td>
                        <td>
                            <form method="POST" action="Mentor">
                                <input type="hidden" name="service" value="deleteMentor">
                                <input type="hidden" name="mentor_id" value="<%= rsMentor.getInt("mentor_id") %>">
                                <button type="submit" class="delete-btn" data-toggle="modal" onclick="return confirm('Are you sure you want to delete this mentor?')">
                                    <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                </button>
                            </form>
                        </td>

                    </tr>
                    <%}%>
                </table>
                <%}%>

                <%if(request.getAttribute("rsMarketer") != null) {
                    ResultSet rsMarketer = (ResultSet) request.getAttribute("rsMarketer");
                %>
                <h3 style="margin-bottom: 12px">Marketer list</h3>
                <form method="post" action="Marketer">
                    <input type="hidden" name="service" value="search">
                    <div style="display: flex">
                        <input style="padding: 4px 4px; width: 300px; margin-right: 12px" type="text" name="name" placeholder="Enter nmarketer name need to search...">
                        <div class="bottom-content">
                            <input class="btn btn-block btn-primary" type="submit" value="Search">
                        </div>
                       
                    </div>
                </form>
                 <table class="table">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Email</th>
                        <th scope="col">Password</th>
                        <th scope="col">Address</th>
                        <th scope="col">Action</th>
                    </tr>

                    <%while(rsMarketer.next()) {%>
                    <tr>
                        <td><%=rsMarketer.getInt(1)%></td>
                        <td><%=rsMarketer.getString(5)%></td>
                        <td>
                            <%if(rsMarketer.getInt(13) == 1) {%>
                            <i class="fas fa-mars"></i>
                            <% } else { %>
                            <i class="fas fa-venus"></i>
                            <%}%>
                        </td>
                        <td><%=rsMarketer.getString(2)%></td>
                        <td><%=rsMarketer.getString(3)%></td>
                        <td><%=rsMarketer.getString(9)%></td>
                        <td>
                            <form method="POST" action="Marketer">
                                <input type="hidden" name="service" value="deleteMarketer">
                                <input type="hidden" name="marketerId" value="<%= rsMarketer.getInt("marketer_id") %>">
                                <button type="submit" class="delete-btn" data-toggle="modal" onclick="return confirm('Are you sure you want to delete this marketer?')">
                                    <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%}%>
                 </table>
                
                <%}%>

                <%if(request.getAttribute("rsSubject") != null) {
                    ResultSet rsSubject = (ResultSet) request.getAttribute("rsSubject");
                %>
                <div style="display: flex">
                    <h3 style="margin-bottom: 12px">Subject list</h3>
                    <form style="margin-bottom: 12px; padding: 12px">
                        <div style="display: flex; align-items: center">
                            <input style="padding: 4px 4px; width: 300px; margin-right: 12px" type="text" name="user" placeholder="Enter subject name need to search...">
                            <div class="bottom-content">
                                <input id="submit" class="btn btn-block btn-primary" type="submit" value="Search">
                            </div>
                            <span href="SubjectController" class="btn-open-modal">Create subject</span>
                        </div>
                    </form>
                </div>
                <table class="table">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Image</th>
                        <th scope="col">Number of courses</th>
                        <th scope="col">Action</th>                    
                    </tr>

                    <%while(rsSubject.next()) {%>
                    <tr>
                        <td><%=rsSubject.getInt(2)%></td>
                        <td><%=rsSubject.getString(1)%></td>
                        <td><img style="width: 50px; height: 50px" src="<%=rsSubject.getString(3)%>"></td>
                        <td><%=rsSubject.getInt(4)%></td>
                        <td>
                            <form action="SubjectController" method="POST">
                                <input type="hidden" name="service" value="delete">
                                <input type="hidden" name="subject_id" value="<%=rsSubject.getInt(2)%>">

                                <button type="submit" class="delete-btn" data-toggle="modal" onclick="return confirm('Are you sure you want to delete this subject?')">                                   
                                    <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                </button>
                            </form>

                        </td>

                    </tr>
                    <%}%>

                </table>
                    
                        <div class="modal-subject">
                    <div class="modal-container-subject">
                        <div class="modal-subject-title">
                            <h4>Create new subject</h4>
                        </div>
                        <form <form action="SubjectController" method="POST">
                            <input type="hidden" name="service" value="addSubject">
                            <div class="input">
                                <label for="subject-name">Subject name</label><br>
                                <input type="text" name="name" />
                            </div>
                              <div class="input">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="button">
                                <span class="btn-cancel">Cancel</span>
                                <button style="margin-left: 6px" class="btn-create">Create</button>
                            </div>
                        </form>
                    </div>
                </div>
                    
                <%}%>

                <%if(request.getAttribute("rsCourse") != null) {
                    ResultSet rsCourse = (ResultSet) request.getAttribute("rsCourse");
                %>
                <h3 style="margin-bottom: 12px">Course list</h3>
                <table class="table">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Subject name</th>
                        <th scope="col">Course name</th>
                        <th scope="col">Image</th>
                        <th scope="col">Number of question</th>
                    </tr>

                    <%while(rsCourse.next()) {%>
                    <tr>
                        <td><%=rsCourse.getInt(1)%></td>
                        <td><%=rsCourse.getString(2)%></td>
                        <td><%=rsCourse.getString(3)%></td>
                        <td><img style="width: 50px; height: 50px" src="<%=rsCourse.getString(4)%>"></td>
                        <td><%=rsCourse.getInt(5)%></td>
                    </tr>
                    <%}%>
                </table>
                <%}%>

            </div>
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
