

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="view/forgotpsw/assets/forgotstyle.css"/>
        <title>Forgotten Password</title>
    </head>
    <body>
        <div class="abcdy">
            <div class="abcd">
                <div class="forgot-psw">
                    <div class="forgot-header">

                        <h1 class="title-forgot">Reset your password</h1>
                        <%
                            String merror = (String) request.getAttribute("msgerror");
                        %>
                        <%if(merror != null){%>
                        <div id="message" style="color: red">
                            <ul>
                                <li><%=merror%></li>
                            </ul>
                        </div>
                        <%}%>
                        <p class="paragraph">We'll email you a link to log in and reset your password.</p>
                    </div>
                    <div class="forgot-form">
                        <form action="restpassword" method="POST">
                            <div class="form-input">
                                <input type="text" placeholder="abc.gmail.com" name="email" value="${sessionScope.eemail}" />
                            </div>
                            <span class="UIInput-border"></span>
                            <div class="form-signin">
                                <button><p class="title_submit">Submit</p></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
