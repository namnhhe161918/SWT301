<!-- Start Header Area -->
<%@page import="Entities.AccountUser"%> 
<%@page import="Entities.AccountMarketer"%> 
<%@page import="Entities.AccountMentor"%> 
<%@page import="Entities.AccountMentor"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<header class="header navbar-area sticky">

    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-12">
                <div class="nav-inner">
                    <nav class="navbar navbar-expand-lg">
                        <a class="navbar-brand" href="#">
                            <strong>QUIZPRACTICE</strong>
                        </a>
                        <button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="toggler-icon"></span>
                            <span class="toggler-icon"></span>
                            <span class="toggler-icon"></span>
                        </button>
                      
                        <c:set var="setList" value="['HomeController', '#', '#', 'listpost']" />
                        <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                            <ul id="nav" class="navbar-nav ms-auto">
                                <li class="nav-item">
                                    <a href="HomeController"
                                       aria-label="Toggle navigation" class="<c:if test="${pageHome != null && setList.contains(pageHome)}">active</c:if>">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a href="Activity" aria-label="Toggle navigation" class="">Activity</a>
                                </li>
<!--                                <li class="nav-item">
                                    <a href="#" aria-label="Toggle navigation">Course List</a>
                                </li>-->
                                <li class="nav-item">
                                    <a href="listpost" aria-label="Toggle navigation" class="<c:if test="${pagePost != null && setList.contains(pagePost)}">active</c:if>">Blog List</a>
                                </li>
                                <li class="nav-item">
                                    <a class=" dd-menu collapsed" href="#"
                                       data-bs-toggle="collapse" data-bs-target="#submenu-1-4"
                                       aria-controls="navbarSupportedContent" aria-expanded="false"
                                       aria-label="Toggle navigation">Pages</a>
                                    <ul class="sub-menu mega-menu collapse" id="submenu-1-4">
                                        <li class="single-block">
                                            <ul>
                                                <!--<li class="nav-item"><a href="#">Sign Up</a></li>-->
                                                <!--<li class="nav-item"><a href="SubjectController">Sign In</a></li>-->
                                                <li class="nav-item"><a href="profile">Account Overview</a></li>

                                            </ul>
                                        </li>
                                        <li class="single-block">
                                            <ul>
                                                <li class="mega-menu-title">Link</li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class=" dd-menu collapsed" href="#"
                                       data-bs-toggle="collapse" data-bs-target="#submenu-1-3"
                                       aria-controls="navbarSupportedContent" aria-expanded="false"
                                       aria-label="Toggle navigation">More</a>
                                    <ul class="sub-menu collapse" id="submenu-1-3">
                                        <li class="nav-item"><a href="ViewAll?service=viewAllCourse">Courses</a></li>
                                        <li class="nav-item"><a href="ViewAll?service=viewAllMentor">Mentors</a></li>
                                        <!--<li class="nav-item"><a href="#">Link 4</a></lili>-->
                                    </ul>
                                </li>
                                <%if (session.getAttribute("accountMentor") != null) {%>
                                <li class="nav-item">
                                    <a href="CourseMentor" aria-label="Toggle navigation" class="">Post Course</a>
                                </li>
                                <% } %>

                            </ul>
                        </div> <!-- navbar collapse -->
                        <%if(session.getAttribute("accountUser") != null) {
                            AccountUser au = (AccountUser) session.getAttribute("accountUser");
                        %>                        
                        <h6 style="padding: 1rem;color: #081828;">Hello,<span><%=au.getDisplay_name()%></span> </h6>
                        <div style="display: flex;">
                            <img src="assets/avatar/<%=au.getImage()%>" alt="" onerror="this.src='assets/avatar/base.png'" style="border-radius: 50%;height: 3em;object-fit: cover;width: 3em;cursor: pointer;">
                            <i class="fa-solid fa-chevron-down" style="padding: 1rem;"></i>
                            <nav class="dropdown-ofme quote show">
                                <ul class="nav-dropdown">
                                    <li class="dropdown-i">
                                        <span class="avatarr"><img
                                                src="assets/avatar/<%=au.getImage()%>"
                                                alt="" onerror="this.src='assets/avatar/base.png'"></span>
                                        <span>
                                            <p id="d-name"><%=au.getDisplay_name()%></p>
                                        </span>
                                    </li>
                                    <li class="dropdown-i">Home</li>
                                    <li class="dropdown-i"><a href="profile">Profile Setting</a></li>
                                    <li class="dropdown-i"><a href="ChangePassword">ChangePassword</a></li>
                                    <li class="dropdown-i"><a href="signout">Sign out</a></li>
                                </ul>
                            </nav>
                        </div>
                        <%} else if(session.getAttribute("accountMarketer") != null) {
                            AccountMarketer amer = (AccountMarketer) session.getAttribute("accountMarketer");
                        %>
                        <h6 style="padding: 1rem;color: #081828;">Hello,<span><%=amer.getDisplay_name()%></span> </h6>
                        <div style="display: flex;">
                            <img src="assets/avatar/<%=amer.getImage()%>" alt="" onerror="this.src='assets/avatar/base.png'"  style="border-radius: 50%;height: 3em;object-fit: cover;width: 3em;cursor: pointer;">
                            <i class="fa-solid fa-chevron-down" style="padding: 1rem;cursor: pointer"></i>
                            <nav class="dropdown-ofme quote show">
                                <ul class="nav-dropdown">
                                    <li class="dropdown-i">
                                        <span class="avatarr"><img
                                                src="assets/avatar/<%=amer.getImage()%>" alt="" onerror="this.src='assets/avatar/base.png'"></span>
                                        <span>
                                            <p id="d-name"><%=amer.getDisplay_name()%></p>
                                            <p id="role">Marketer</p>
                                        </span>
                                    </li>
                                    <li class="dropdown-i">Home</li>
                                    <li class="dropdown-i"><a href="dashboardmarketer">Dashboard</a></li>
                                    <li class="dropdown-i"><a href="profile">Profile Setting</a></li>
                                    <li class="dropdown-i"><a href="ChangePassword">ChangePassword</a></li>
                                    <li class="dropdown-i"><a href="signout">Sign out</a></li>
                                </ul>
                            </nav>
                        </div>
                        <%} else if(session.getAttribute("accountMentor") != null) {
                            AccountMentor amor = (AccountMentor) session.getAttribute("accountMentor");
                        %>
                        <h6 style="padding: 1rem;color: #081828;"><span><%=amor.getDisplay_name()%></span> </h6>
                        <div style="display: flex;">
                            <img src="assets/avatar/<%=amor.getImage()%>" alt="" onerror="this.src='assets/avatar/base.png'"  style="border-radius: 50%;height: 3em;object-fit: cover;width: 3em;cursor: pointer;">
                            <i class="fa-solid fa-chevron-down" style="padding: 1rem;cursor: pointer"></i>
                            <nav class="dropdown-ofme quote show">
                                <ul class="nav-dropdown">
                                    <li class="dropdown-i">
                                        <span class="avatarr"><img
                                                src="assets/avatar/<%=amor.getImage()%>" alt="" onerror="this.src='assets/avatar/base.png'" ></span>
                                        <span>
                                            <p id="d-name"><%=amor.getDisplay_name()%></p>
                                            <p id="role">Marketer</p>
                                        </span>
                                    </li>
                                    <li class="dropdown-i">Home</li>
                                    <li class="dropdown-i"><a href="profile">Profile Setting</a></li>
                                    <li class="dropdown-i"><a href="ChangePassword">ChangePassword</a></li>
                                    <li class="dropdown-i"><a href="signout">Sign out</a></li>
                                </ul>
                            </nav>
                        </div>
                        <%} else {%>
                        <div class="login-button">
                            <ul>
                                <li>
                                    <a href="login"><i class="lni lni-enter"></i>Login</a>
                                </li>
                                <li>
                                    <a href="signup"><i class="lni lni-user"></i>Sign up</a>
                                </li>
                            </ul>
                        </div>
                        <%}%>
                    </nav> <!-- navbar -->
                </div>
            </div>
        </div> <!-- row -->
    </div> <!-- container -->
    <script>
        // dialog menu
        let iconUp = document.querySelector(".fa-chevron-down");
        let dialogMenu = document.querySelector(".dropdown-ofme");
        iconUp.addEventListener("click", () => {
            dialogMenu.classList.toggle("show");
        })
    </script>
</header>
<!-- End Header Area -->


  