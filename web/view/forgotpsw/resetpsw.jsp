<%-- 
    Document   : restpsw
    Created on : 01-Jun-2023, 17:23:06
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="view/forgotpsw/assets/restpswstyle.css"/>
        <title>Change Password Here</title>
    </head>
    <body>
        <div class="abcdy">
            <div class="abcd">
                <div class="forgot-psw">
                    <div class="forgot-header">
                        <h2 class="title-forgot">Reset your password for ${sessionScope.eemail}</h2>
                    </div>
                    <div class="forgot-form">
                        <form action="forgotten" method="POST">
                            <div class="form-input">
                                <input type="password" placeholder="password" id="password" name="password" required onkeyup="mycheck()"/>
                                <span class="UIInput-border"></span>
                            </div>
                            <div class="form-input">
                                <input type="password" placeholder="confirm password" id="repassword" name="repassword" required onkeyup="mycheck()"/>
                                <span class="UIInput-border"></span>
                            </div>
                            <p id='mess'></p>
                            <div class="form-signin">
                                <button type="submit">Save Password</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

                    <script type="text/javascript">
            var mycheck = function () {
                if (document.getElementById('password').value ==
                        document.getElementById('repassword').value) {
                    document.getElementById('mess').style.color = 'green';
                    document.getElementById('mess').innerHTML = 'matching';
                } else {
                    document.getElementById('mess').style.color = 'red';
                    document.getElementById('mess').innerHTML = 'not matching';
                }
            };
        </script>
    </body>
</html>
