<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Entities.AccountMarketer"%> 
<div class="col-lg-3 col-md-4 col-12">
    <div class="dashboard-sidebar">
        <% 
               if(session.getAttribute("accountMarketer") != null) {
                           AccountMarketer am = (AccountMarketer) session.getAttribute("accountMarketer");
        %>
        <div class="user-image">

            <img src="assets/avatar/<%=am.getImage()%>"
                 onerror="this.src='assets/avatar/base.png'"
                 width="50px" height="50px" />
            <h3><%=am.getDisplay_name()%>
                <span><a href="javascript:void(0)"><%=am.getEmail()%></a></span>
            </h3>
        </div>
        <% }%>
        <c:set var="setList" value="['dashboardmarketer', 'dashboardlistpost','addpost','listslider','addslider','updatepost', 'updateslider']" />
        <div class="dashboard-menu">
            <ul>
                <li><a class="<c:if test="${pageMarketerdasboard != null && setList.contains(pageMarketerdasboard)}">active</c:if>" href="dashboardmarketer"><i class="lni lni-dashboard"></i>
                            Dashboard</a></li>
                    <li class="active">
                        <a href="#postSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle <c:if test="${pagepost != null && setList.contains(pagepost)}">active</c:if>">Posts</a>
                        <ul class="collapse list-unstyled" id="postSubmenu">
                            <li>
                                <a href="dashboardlistpost">List Post</a>
                            </li>
                            <li>
                                <a href="addpost">Add Post</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#sliderSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle <c:if test="${pageslider != null && setList.contains(pageslider)}">active</c:if>">Slider</a>
                    <ul class="collapse list-unstyled" id="sliderSubmenu">
                        <li>
                            <a href="listslider">List Sliders</a>
                        </li>
                        <li>
                            <a href="addslider">Add Sliders</a>
                        </li>
                    </ul>
                </li>
                <li><a href="#"><i class="lni lni-graph"></i>Analytics</a></li>
                
            </ul>
            <div class="button">
                <a class="btn" href="signout">Logout</a>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });

    </script>
</div>