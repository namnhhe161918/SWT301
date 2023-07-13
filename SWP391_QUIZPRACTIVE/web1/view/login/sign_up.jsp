<%-- 
    Document   : sign_up
    Created on : 29-May-2023, 11:51:27
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.time.LocalDate"%>
<%@page import = "java.time.Month"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
        <link rel="stylesheet" href="view/login/assets/myRegister.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
    <body>
        <div class="abcdy">
            <div class="left_slide ">
                <div class="left_slide-img">
                </div>
            </div>
            <div class="right_slide">
                <div class="login">
                    <div class="login-header">
                        <h1>Sign up</h1>
                    </div>
                    <div class="login-form">
                        <form action="signup" method="POST">
                            <div class="form-input">
                                <div class="dob-input">
                                    <div class="title">
                                        <p>Please Enter Your Birthday</p>
                                        <span id="datemess"></span>
                                    </div>
                                    <input type="date" placeholder="Birthdate" name="dob" required onkeyup='checkdate();'/>
                                </div>
                            </div>
                            <div class="form-input">
                                <input type="email" placeholder="Email" name="email" required/>
                            </div>
                            <div class="form-input">
                                <div class="radio-gender">

                                    <label class="gender-input">
                                        <input type="radio" name="gender" value="1">
                                        <span class="title-gender">Male</span>
                                    </label>

                                    <label class="gender-input">
                                        <input type="radio" name="gender" value="0">
                                        <span class="title-gender">Female</span>
                                    </label>
                                </div>
                            </div>
                            <div class="form-input">
                                <input type="text" placeholder="FullName" name="fullname" required/>
                            </div>
                            <div class="form-input">
                                <input type="password" placeholder="Password" id="password" name="pass" required onkeyup='check();'/>
                            </div>
                            <div class="form-input">
                                <input type="password" placeholder="Confirm Password"  id="repassword" name="cpass" required onkeyup='check();'/>
                            </div>
                            <span id='message'></span>
                            <div class="form-input">
                                <div class="radio-inputs">
                                    <c:forEach var="r" items="${chooserole}">
                                        <label class="radio">
                                            <input type="radio" name="role" ${r.id == 4 ? 'checked' : ''} value="${r.id}">
                                            <span class="name">${r.roleName}</span>
                                        </label> 
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="form-input">
                                <input type="text" id="submitLogin" placeholder="Captcha code">
                            </div>
                            <span id="image" class="inline">
                            </span>

                            <span onclick="generate()" id="change">
                                Change
                            </span>
                            <span id="bt" onclick="printmsg()">Check</span><br /><br />

                            <p id="key" style="color: black"></p>
                            <p class="form-row" style="color: red; font-weight: 600">
                                ${messregis}
                            </p>
                            <div class="form-signup">
                                <button type="submit" id="btnRegister" disabled=""><span class="title_signup">Join for
                                        free</span></button>
                            </div>
                            <p class="message"></p>
                        </form>
                        <div class="login-form-footer">
                            <span class="text_footer"> Alrealy has account? <a class="sign-in" href="login">Sign
                                    In Here!</a></span>
                        </div>
                    </div>
                </div>

                <div class="box_banner_mini"> QUIZ PRACTICE</div>

            </div>
        </div>
        <script src="view/login/assets/js/mycode.js"></script>
        <script type="text/javascript">
                                var check = function () {
                                    if (document.getElementById('password').value ==
                                            document.getElementById('repassword').value) {
                                        document.getElementById('message').style.color = 'green';
                                        document.getElementById('message').innerHTML = 'matching';
                                    } else {
                                        document.getElementById('message').style.color = 'red';
                                        document.getElementById('message').innerHTML = 'not matching';
                                    }
                                };

                                function checkdate() {
                                    if (document.getElementById('date').value <=
                                            "2077-01-01" && document.getElementById('date').value >= "1900-01-01") {
                                        document.getElementById('datemess').style.color = 'green';
                                        document.getElementById('datemess').innerHTML = "Valid";
                                    } else {
                                        document.getElementById('datemess').style.color = 'red';
                                        document.getElementById('datemess').innerHTML = 'Invalid birthdate (Birthdate only in range [ 1/1/1990-1/1/2077 ])';
                                    }
                                }
        </script>
    </body>
</html>
