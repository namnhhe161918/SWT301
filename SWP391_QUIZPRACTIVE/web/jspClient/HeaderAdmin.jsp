<%-- 
    Document   : HeaderAdmin
    Created on : Jun 18, 2023, 4:43:33 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entities.AccountAdmin"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header class="header navbar-area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <div class="nav-inner">
                        <nav class="navbar navbar-expand-lg" style="display: flex; justify-content: space-between">
                            <a class="navbar-brand" href="User">
                               QUIZPRACTICE
                            </a>
                            <%
                                AccountAdmin aa = (AccountAdmin) session.getAttribute("accountAdmin");
                            %>
                            <div class="login-button">
                                <ul>
                                    <li>
                                        <a href="#"><i class="lni lni-enter"></i>Hello Admin</a>
                                    </li>
                                    <li>
                                        <a href="signout"><i class="lni lni-user"></i> Logout</a>
                                    </li>
                                </ul>
                            </div>
                        </nav> <!-- navbar -->
                    </div>
                </div>
            </div> <!-- row -->
        </div> <!-- container -->
    </header>
    </body>
</html>
