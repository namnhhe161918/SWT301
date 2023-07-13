<%-- 
    Document   : sign_in
    Created on : 29-May-2023, 11:51:18
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in</title>
        <link rel="stylesheet" href="view/login/assets/myindex.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    </head>
    <body>
        <section class="abcdy row">
            <div class="left_slide col-md-6">
                <div class="left_slide-img">
                </div>
            </div>
            <div class="right_slide col-md-6">
                <div class="login">
                    <div class="login-header">
                        <h1>Sign in</h1>
                    </div>
                    <div class="login-form">
                        <c:set var="cookie" value="${pageContext.request.cookies}" />
                        <form action="login" method="POST" id="loginForm">
                            <div class="form-input">
                                <input type="email" placeholder="Enter email" name="email" value="${cookie.cemail.value}"/>
                            </div>
                            <div class="form-input">
                                <input type="password" placeholder="Enter password" name="password" value="${cookie.cpass.value}"/>
                            </div>
                            <div class="form-input">
                                <div class="checkboxxx">
                                    <input type="checkbox" name="remember" class="checkbox" ${cookie.crem.value != null ? 'checked' : ''}>
                                    <label for="rememberMeCheckbox">Remember me</label>
                                </div>
                                <div class="forgot-pass">
                                    <span><a href="restpassword" target="_blank">Forgot password?</a></span>
                                </div>
                            </div>
                            <div class="form-signin">
                                <button><span class="title_signin">Login</span></button>
                            </div>
                        </form>
                        <div class="login-form-footer">
                            <span class="text_footer"> Don't have an account? <a class="sign-up" href="signup">Sign
                                    Up!</a></span>
                        </div>
                    </div>
                </div>

                <div class="box_banner_mini"> QUIZ PRACTICE</div>

            </div>
        </section>
    </body>
    <script type="text/javascript">
       document.getElementById("loginForm").addEventListener("submit", function (event) {
            event.preventDefault();

            var _email = $("input[type='email']").val();
            var _password = $("input[type='password']").val();
            if (_email === "" || _email.length === 0) {
                window.alert("Please enter email!");
            } else if (_password === "" || _password.length === 0) {
                window.alert("Please enter password!");
            } else {
                event.currentTarget.submit();
            }

        });
    </script>
</html>
