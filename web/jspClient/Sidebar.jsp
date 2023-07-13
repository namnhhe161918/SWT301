<%-- 
    Document   : Sidebar
    Created on : Jun 18, 2023, 6:28:30 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./assets/css/admin.css" />
    </head>
    <body>
        <div class="side-bar">
            <div class="side-bar-menu">
                <i class="icon fas fa-bars menu-icon"></i>
                <span strong class="menu-text">Menu</span>
            </div> 

            <div class="side-bar-item">
                <div class="item item-user">
                    <a class="item-link" href="User">
                        <i class="icon far fa-address-book"></i>
                        Student list
                    </a>
                </div>

                <div class="item item-user">
                    <a class="item-link" href="Mentor">
                        <i class="icon far fa-address-book"></i>
                        Mentor list
                    </a>
                </div>

                <div class="item item-user">
                    <a class="item-link" href="Marketer">
                        <i class="icon far fa-address-book"></i>
                        Marketer list
                    </a>
                </div>

                <div class="item item-subject">
                    <a class="item-link" href="Subject">
                        <i class="icon fas fa-book-open"></i>
                        Subject list
                    </a>
                </div>

                <div class="item item-course">
                    <a class="item-link" href="Course">
                        <i class="icon fas fa-book"></i>
                        Course list
                    </a>
                </div>

                <div class="item item-post">
                    <a class="item-link" href="Post">
                        <i class="icon fas fa-ad"></i>
                        Post list
                    </a>
                </div>
            </div>
        </div>
        
        <script src="./assets/js/main.js"></script>
    </body>
</html>
