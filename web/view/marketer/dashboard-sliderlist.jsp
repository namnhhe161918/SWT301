<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Dashboard-Marketer</title>
       <link rel="stylesheet" href="view/marketer/assets/css/stylePostList.css">

        <!--END FIXXED-->

        <!--favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo/lloo.png" />

        <!-- Bootstrap 4 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

        <!--Component-->
        <link
            href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

        <!--popup of Marketer-->
        <link rel="stylesheet" href="./assets/css/newcss.css"/>
        <!-- fontanswer icons -->
        <script src="https://kit.fontawesome.com/fe000f9b2a.js" crossorigin="anonymous"></script>

        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


        <script type="text/javascript">
            function change() {

                var searchInput = document.getElementById('searchInput').value;
                var selectInput = document.getElementById('selectInput').value;

                var url;
                if (searchInput === '' && selectInput !== '') {
                    url = 'listslider?entry=' + encodeURIComponent(selectInput);
                } else if (searchInput !== '' && selectInput === '') {
                    url = 'listslider?search=' + encodeURIComponent(searchInput);
                } else {
                    url = 'listslider?search=' + encodeURIComponent(searchInput) + '&entry=' + encodeURIComponent(selectInput);
                }
                window.location.href = url;
            }

            function redirect() {
                window.location.href = 'addslider';
            }
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.ddelete').on('click', function () {
                    var id = $(this).parent().find('#id').val();
                    $('#hiid').val(id);
                });
            });
        </script>
            <style>
            /*dropdown*/
            .dashboard-menu ul li.active>a,
            a[aria-expanded="true"] {
                /*background: #5830e0;*/
            }

            a[data-toggle="collapse"] {
                position: relative;
            }

            .dropdown-toggle::after {
                display: block;
                position: absolute;
                top: 50%;
                right: 20px;
                transform: translateY(-50%);
            }
        </style>
    </head>

    <body>
        <jsp:include page="/jspClient/Header.jsp" ></jsp:include>


            <section class="dashboard section">
                <!--breadcrumbs-->
                <div class="breadcrumbs" style="background-color: #f9f9f9">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-6 col-md-6 col-12">
                                <div class="breadcrumbs-content">
                                    <h1 class="page-title">Dashboard</h1>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-12">
                                <ul class="breadcrumb-nav">
                                    <li><a href="HomeController">Home</a></li>
                                    <li><a href="dashboardmarketer">Dashboard</a></li>
                                    <li>List Slider</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--breadcrumbs-->

                <div class="container">
                    <div class="row">
                    <jsp:include page="/view/marketer/sidebar-dashboard.jsp"></jsp:include>

                    <div class="col-lg-9 col-md-8 col-12" style="background-color: #fff;">
                            <div class="row filter">
                                <div class="col-lg-3 col-md-4 num-entry">
                                    <form action="" onchange="change()" id="f1">
                                        <label>Show</label>
                                        <select name="entry" id="selectInput" >
                                            <option value="10" ${param['entry']==10?"selected":""}>10</option>
                                        <option value="5" ${param['entry']==5?"selected":""}>5</option>
                                        <option value="3" ${param['entry']==3?"selected":""}>3</option>
                                    </select>
                                    <label>entries</label>
                                </form>
                            </div>
                            <div class="col-lg-5 col-md-5 search-name text-lg-center">
                                <form action="" onchange="change()" id="f1">
                                    <label for="search">Search:</label>
                                    <input type="text" name="search" id="searchInput" value="${requestScope.search}">
                                </form>
                            </div>
                            <div class="col-lg-4 col-md-3 btn-add text-lg-end">
                                <button class="btn-warning add-slider" onclick="redirect()">Add Slider</button>
                            </div>
                        </div>
                        <div class="row">
                            <table class="table">
                                <thead class="">
                                    <tr>
                                        <th scope="col">Id <i class="fa-solid fa-arrow-up" style="float: right; margin-top: 4px;"></i></th>
                                        <th scope="col">Content <i class="fa-solid fa-arrow-up-a-z" style="float: right; margin-top: 4px;"></i></th>
                                        <th scope="col">Slider_url</th>
                                        <th scope="col">Status</th>
                                        <th scope="col" style="text-align: center;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="l" items="${requestScope.listslider}" varStatus="i">
                                        <tr>
                                            <td scope="row">${i.index + 1}</td>
                                            <td>${l.content}</td>
                                            <td style="width: 30%;"><img src="uploadslider/${l.url}" alt="${l.url}" width="90%"></td>
                                            <td style="width: 12%;">

                                                <c:if test="${l.isShow}">
                                                    <span ><i class="visiblle fa-regular fa-eye" style="cursor: not-allowed; background-color: #0080008a"></i> </span>
                                                </c:if>
                                                <c:if test="${!l.isShow}">
                                                    <span ><i class="hide fa-regular fa-eye-slash" style="cursor: not-allowed; background-color: red"></i></span>
                                                    </c:if>

                                            </td>
                                            <td style="text-align: center;">
                                                <span><a href="#" data-toggle="modal"
                                                         data-target="#exampleModal" class="ddelete"><i class=" delete fa-regular fa-trash-can"></i></a>
                                                    <input type="hidden" name="id" id="id" value="${l.slider_id}">
                                                </span>
                                                <span><a href="updateslider?id=${l.slider_id}"><i class="edit fa-regular fa-pen-to-square"></i></a></span>
                                            </td> 
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="container-fluid pt-2">
                            <div class="row justify-content-md-center">
                                <div class="pagination center">
                                    <ul class="pagination-list">
                                            <c:if test="${index > 1}">
                                            <li>
                                                <a href="dashboardlistslider?search=${requestScope.search}&entry=${param['entry']}&index=${param['index']-1}"><i class="lni lni-chevron-left"></i></a>
                                            </li> 
                                            </c:if>
                                            <c:forEach var = "i" begin = "1" end = "${numberPage}">
                                            <li class="${param['index']==i?'pa-active':''}"><a href="dashboardlistslider?search=${requestScope.search}&entry=${param['entry']}&index=${i}">${i}</a></li>
                                            </c:forEach>
                                            <c:if test="${ index < numberPage}">
                                            <li><a href="dashboardlistslider?search=${requestScope.search}&entry=${param['entry']}&index=${param['index']+1}"><i class="lni lni-chevron-right"></i></a></li>
                                            </c:if>
                                    </ul>
                                </div>

                            </div>
                        </div>


                    </div>
                </div>

            </div>

            <!--Delete Modal HTML-->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="${pageContext.request.contextPath}/deleteslider" method="POST">

                            <div class="modal-header">
                                <div class="container d-flex pl-0">
                                    <h5 class="modal-title ml-2" id="exampleModalLabel">Delete this slider?</h5>
                                </div>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p class="text-muted">If you delete this slider will be gone forever. Are you sure you want to proceed?
                                </p>
                            </div>
                            <input type="hidden" name="id" id="hiid">

                            <div class="modal-footer">
                                <button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="/jspClient/Footer.jsp" />

        <script>
            let sidebar = document.querySelector(".sidebar");
            let closeBtn = document.querySelector("#btn");

            closeBtn.addEventListener("click", () => {
                sidebar.classList.toggle("open");
                menuBtnChange();//calling the function(optional)
            });

            // following are the code to change sidebar button(optional)
            function menuBtnChange() {
                if (sidebar.classList.contains("open")) {
                    closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
                } else {
                    closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");//replacing the iocns class
                }
            }
        </script>
    </body>
</html>
