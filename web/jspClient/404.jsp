<%-- 
    Document   : 404
    Created on : 04-Jul-2023, 16:42:20
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <meta name="description" content="" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!-- Web Font -->
        <link
            href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

        <!-- ========================= CSS here ========================= -->
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="../assets/css/LineIcons.2.0.css" />
        <link rel="stylesheet" href="../assets/css/animate.css" />
        <link rel="stylesheet" href="../assets/css/tiny-slider.css" />
        <link rel="stylesheet" href="../assets/css/glightbox.min.css" />
        <link rel="stylesheet" href="../assets/css/main.css" />
    </head>
    <body>
        <div class="preloader" style="opacity: 0; display: none;">
            <div class="preloader-inner">
                <div class="preloader-icon">
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>


        <div class="error-area">
            <div class="d-table">
                <div class="d-table-cell">
                    <div class="container">
                        <div class="error-content">
                            <h1>404</h1>
                            <h2>Here Is Some Problem</h2>
                            <p>The page you are looking for it maybe deleted</p>
                            <div class="button">
                                <a href="<%= request.getContextPath() %>" class="btn">Go To Home</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="../assets/js/bootstrap.min.js"></script>
        <script src="../assets/js/wow.min.js"></script>
        <script src="../assets/js/tiny-slider.js"></script>
        <script src="../assets/js/glightbox.min.js"></script>
        <script>window.onload = function () {
                window.setTimeout(fadeout, 500);
            }
            function fadeout() {
                document.querySelector('.preloader').style.opacity = '0';
                document.querySelector('.preloader').style.display = 'none';
            }</script>
    </body> 
</html>
