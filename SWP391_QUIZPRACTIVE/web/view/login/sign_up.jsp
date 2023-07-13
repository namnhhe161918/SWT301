
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
    <body onload="generate()">
        <div class="abcdy">
            <div class="left_slide ">
                <div class="left_slide-img">
                </div>
            </div>
            <div class="right_slide">
                <div class="login">
                    <div id="toast"></div>
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
                                    <input type="date" placeholder="Birthdate" name="dob" required  id="dob"/>
                                </div>
                            </div>
                            <div class="form-input">
                                <input type="email" placeholder="Email" name="email" required/>
                            </div>
                            <div class="form-input">
                                <div class="radio-gender">

                                    <label class="gender-input">
                                        <input type="radio" name="gender" value="1" checked>
                                        <span class="title-gender">Male</span>
                                    </label>

                                    <label class="gender-input">
                                        <input type="radio" name="gender" value="0">
                                        <span class="title-gender">Female</span>
                                    </label>
                                </div>
                            </div>
                            <div class="form-input">
                                <input type="text" placeholder="FullName" name="fullname" id="checkname" required/>
                            </div>
                            <div class="form-input">
                                <input type="password" placeholder="Password" id="password" name="pass" required onkeyup='check()'/>
                            </div>
                            <div class="form-input">
                                <input type="password" placeholder="Confirm Password"  id="repassword" name="cpass" required onkeyup='check()'/>
                            </div>
                            <div class="form-input">
                                <div class="radio-inputs">
                                    <c:forEach var="r" items="${chooserole}">
                                        <label class="radio">
                                            <input type="radio" name="role"  value="${r.id}" checked>
                                            <span class="name">${r.roleName}</span>
                                        </label> 
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="form-input" >
                                <input type="text" id="submitLogin" placeholder="Captcha code">
                            </div>
                            <span id="image" class="inline">
                            </span>

                            <span onclick="generate()" id="change">
                                Change
                            </span>
                            <span id="bt" onclick="printmsg()">Check</span><br /><br />

                            <p id="key"></p>
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
        <script type="text/javascript">
            var check = function () {
                if (document.getElementById('password').value ==
                        document.getElementById('repassword').value) {
                    toast({
                        title: "Success!",
                        message: "Matching",
                        type: "success",
                        duration: 5000
                    });
                } else {
                    toast({
                        title: "Error!",
                        message: "Not matching",
                        type: "error",
                        duration: 5000
                    });
                }
            };

            var birthdayInput = document.getElementById('dob');
            birthdayInput.addEventListener('blur', function () {
                var birthday = new Date(birthdayInput.value);
                var today = new Date();
                var age = today.getFullYear() - birthday.getFullYear();
                if (age < 18) {
                    toast({
                        title: "Warning!",
                        message: "You don't enough 18 age",
                        type: "warning",
                        duration: 5000
                    });
                    // Clear old input
                    document.getElementById("dob").value = "";
                }
            });

            var checkname = document.getElementById('checkname');
            checkname.addEventListener('blur', function () {
                var regex = /\d/;
                var getName = checkname.value;

                if (regex.test(getName)) {
                    toast({
                        title: "Warning!",
                        message: "FullName must be aphabets",
                        type: "warning",
                        duration: 5000
                    });
                    checkname.value = "";
                } 
            })

        </script>
        <script src="view/login/assets/js/mycode.js"></script>
        <script src="view/login/assets/js/codetoasitfy.js"></script>
    </body>
</html>
