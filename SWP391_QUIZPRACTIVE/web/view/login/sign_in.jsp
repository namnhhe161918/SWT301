
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in</title>
        <link rel="stylesheet" href="view/login/assets/myindex.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
        <style>
            /* ======= Buttons ======== */

            /* Block */
            .btn {
                display: inline-block;
                text-decoration: none;
                background-color: transparent;
                border: none;
                outline: none;
                color: #fff;
                padding: 12px 48px;
                border-radius: 50px;
                cursor: pointer;
                min-width: 120px;
                transition: opacity 0.2s ease;
            }

            /* Modifier */
            .btn--size-l {
                padding: 16px 56px;
            }

            .btn--size-s {
                padding: 8px 32px;
            }

            .btn:hover {
                opacity: 0.8;
            }

            .btn + .btn {
                margin-left: 16px;
            }

            .btn--success {
                background-color: #71be34;
            }

            .btn--warn {
                background-color: #ffb702;
            }

            .btn--danger {
                background-color: #ff623d;
            }
            .btn--info {
                background-color: #2f86eb;
            }
            .btn--disabled {
                opacity: 0.5 !important;
                cursor: default;
            }

            /* ======= Toast message ======== */

            #toast {
                position: fixed;
                top: 32px;
                right: 32px;
                z-index: 999999;
            }

            .toast {
                display: flex;
                align-items: center;
                background-color: #fff;
                border-radius: 2px;
                padding: 7px 0;
                min-width: 400px;
                max-width: 450px;
                border-left: 4px solid;
                box-shadow: 0 5px 8px rgba(0, 0, 0, 0.08);
                transition: all linear 0.3s;
            }

            @keyframes slideInLeft {
                from {
                    opacity: 0;
                    transform: translateX(calc(100% + 32px));
                }
                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }

            @keyframes fadeOut {
                to {
                    opacity: 0;
                }
            }

            .toast--success {
                border-color: #47d864;
            }

            .toast--success .toast__icon {
                color: #47d864;
            }

            .toast--info {
                border-color: #2f86eb;
            }

            .toast--info .toast__icon {
                color: #2f86eb;
            }

            .toast--warning {
                border-color: #ffc021;
            }

            .toast--warning .toast__icon {
                color: #ffc021;
            }

            .toast--error {
                border-color: #ff623d;
            }

            .toast--error .toast__icon {
                color: #ff623d;
            }

            .toast + .toast {
                margin-top: 24px;
            }

            .toast__icon {
                font-size: 24px;
            }

            .toast__icon,
            .toast__close {
                padding: 0 16px;
            }

            .toast__body {
                flex-grow: 1;
            }

            .toast__title {
                font-size: 16px;
                font-weight: 600;
                color: #333;
            }

            .toast__msg {
                font-size: 14px;
                color: #888;
                margin-top: 6px;
                line-height: 1.5;
            }

            .toast__close {
                font-size: 20px;
                color: rgba(0, 0, 0, 0.3);
                cursor: pointer;
            }

        </style>
    </head>
    <body>
        <section class="abcdy row">
            <div class="left_slide col-md-6">
                <div class="left_slide-img">
                </div>
            </div>
            <div class="right_slide col-md-6">
                <div class="login">
                    <div id="toast"></div>

                    <div class="login-header">
                        <h1>Sign in</h1>
                    </div>
                    <c:if test="${notExist != null}">
                        <div class="notExist">
                            <p style="text-align: center; color: red">${sessionScope.notExist}</p>
                        </div>
                    </c:if>
                    <div class="login-form">
                        <c:set var="cookie" value="${pageContext.request.cookies}" />
                        <form method="POST" action="login" id="loginForm">
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
            if (_email.length === 0 && _password.length === 0) {
                toast({
                    title: "Error!",
                    message: "Please enter your email and password",
                    type: "error",
                    duration: 5000
                });
            } else if (_email.length === 0) {
                toast({
                    title: "Warning!",
                    message: "Please enter your email",
                    type: "warning",
                    duration: 5000
                });
            } else if (_password.length === 0) {
                toast({
                    title: "Warning!",
                    message: "Please enter your password",
                    type: "warning",
                    duration: 5000
                });
            } else {
                event.currentTarget.submit();
            }
        });

    </script>
    <script src="view/login/assets/js/codetoasitfy.js"></script>
</html>
