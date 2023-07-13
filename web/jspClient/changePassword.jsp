
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
        <!--popup of Marketer-->
        <link rel="stylesheet" href="./assets/css/newcss.css"/>
        <!-- fontanswer icons -->
        <script src="https://kit.fontawesome.com/fe000f9b2a.js" crossorigin="anonymous"></script>

        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <title>Change Password</title>
        
        <style>
           
        </style>
    </head>
    <body>
        <jsp:include page="/jspClient/Header.jsp" />
        
        <div class="container rounded bg-white mt-5">
            <div class="row" style="margin-top: 15%; margin-bottom: 15%;">
                <!-- Bootstrap to center form -->
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <!-- Start form -->
                    <form action="${pageContext.request.contextPath}/ChangePassword" method="POST" name="ChangePassword" id="ChangePassword">
                        <!-- Input old password -->
                        <div class="row" >
                            <div class="col-md-4" style="text-align: right">
                                <label class="label control-label">Old Password</label>
                            </div>
                            <div class="col-md-8">
                                <input type="password" class="form-control" name="oldPassword" placeholder="Enter old password" required>
                            </div>
                        </div>
                        <!-- Input new password -->
                        <div class="row" style="margin-top: 3vh;">
                            <div class="col-md-4" style="text-align: right">
                                <label class="label control-label">New Password</label>
                            </div>
                            <div class="col-md-8">
                                <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="Enter new password" onkeyup="check();" required>
                            </div>
                        </div>
                        <!-- Input confirm new password -->
                        <div class="row" style="margin-top: 3vh;">
                            <div class="col-md-4" style="text-align: right">
                                <label class="label control-label">Confirm Password</label>
                            </div>
                            <div class="col-md-8">
                                <input type="password" class="form-control" name="rePassword" id="rePassword" placeholder="Confirm new password" onkeyup="check();" required>
                            </div>
                        </div>
                        <div id="message" style="text-align: center; margin-top: 2vh"></div>
                        <br>
                        <!-- Submit form -->
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <button type="submit" id="submit" class="btn btn-success">Change password!</button>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </form>
                    <!-- Display messages, if any -->
                    <div style="text-align: center; margin-top: 2vh">
                        <h6 style="color:${messageColor}"><c:out value="${message}"/></h6>
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <jsp:include page="/jspClient/Footer.jsp" />
    </body>
</html>
