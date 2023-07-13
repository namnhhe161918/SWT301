<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Entities.Subject"%>
<%@page import="Entities.Slider"%>
<%@page import="java.util.List"%>
<%@page import="DAO.DAOSubject"%>
<%@page import="DAO.DAOSlider"%>
<!DOCTYPE html>
<html lang="vn">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Boxicons CDN Link -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="view/marketer/assets/css/styleSliderAdd.css">

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

            <c:if test="${requestScope.message != null}">
                <div class=" container alert alert-danger alert-dismissible mt-3">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Failure!</strong> Subject invalid Please re-choose.
                </div>
            </c:if>
            <c:if test="${requestScope.notification != null}">
                <div class=" container alert alert-success alert-dismissible mt-3">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Save Change!</strong> Successfully
                </div>
            </c:if>
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
                                <li><a href="listslider">List Slider</a></li>
                                <li>Edit Slider</li>
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

                            <form class="row" action="updateslider" method="POST" enctype="multipart/form-data">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="">Content:</label>
                                        <div class="item-input">
                                            <input type="text" name="content" value="${slider.content}" required />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="">Note:</label>
                                    <div class="item-input">
                                        <input type="text" name="note" value="${slider.note}" required> 
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="">Relative Subject:</label>
                                    <div class="item-input">
                                        <Select name="subject">
                                            <option value="-1">Select subject</option>
                                            <%
                                            DAOSubject sdb = new DAOSubject();    
                                            List<Subject> list = sdb.getAll();
                                            Slider sr = (Slider) request.getAttribute("slider");
                                            if(sr != null){
                                            for(Subject s : list){
                                            %>
                                            <option value="<%=s.getSubject_id()%>" <%=s.getSubject_id() == sr.getSubject_id() ? "selected" : "" %> ><%=s.getSubject_name()%></option>
                                            <% }%>
                                        </Select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="item-input">
                                        <input type="radio" name="status" value="1" <%=sr.isIsShow() == true ? "checked" : "" %> > visable
                                        <input type="radio" name="status" value="0" <%=sr.isIsShow() == false ? "checked" : "" %> > hide
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="">Image:</label>
                                    <div class="item-input">
                                        <input type="hidden" id="custId" name="upfilehide" value="<%=sr.getUrl()%>">
                                        <input type="file" id="file-input" accept="image/*" name="upfile">
                                    </div>
                                </div>
                            </div>
                            <% }%>

                            <div class="col-md-12">
                                <img class="frame" id="img-preview" src="uploadslider/${slider.url}">
                            </div>
                            <div class="col-md-12 mt-3">
                                <div class="form-group">
                                    <div class="item-input">
                                        <button class="btn-dark" type="submit">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- The Modal -->
                    <div id="myModal" class="mmodal">
                        <span class="cclose">&times;</span>
                        <img class="modal-ccontent" id="img01">
                        <div id="caption">alt.png</div>
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
                menuBtnChange(); //calling the function(optional)
            });
            // following are the code to change sidebar button(optional)
            function menuBtnChange() {
                if (sidebar.classList.contains("open")) {
                    closeBtn.classList.replace("bx-menu", "bx-menu-alt-right"); //replacing the iocns class
                } else {
                    closeBtn.classList.replace("bx-menu-alt-right", "bx-menu"); //replacing the iocns class
                }
            }


            // dialog menu
            let iconUp = document.querySelector(".fa-chevron-down");
            let dialogMenu = document.querySelector(".dropdown-ofme");
            iconUp.addEventListener("click", () => {
                dialogMenu.classList.toggle("show");
                })

        </script>
        <script>
                        <script>
            const input = document.getElementById('file-input');
            const image = document.getElementById('img-preview');
        input.addEventListener('change', (e) => 
                {
                        if (e.target.files.length) {
                            const src = URL.createObjectURL(e.target.files[0]);
            image.src = src;
                        }
            });
            </script>
            <script type="text/javascript">
                const modal = document.getElementById("myModal");           
        const img = document.getElementById("img-preview");
        const modalImg = document.getElementById("img01");
                img.onclick = function () 
                {
                                modal.style.display = "block";
                modalImg.src = this.src;
        };
        // Get the <span> element that closes the modal
                var span = document.getElementsByClassName("cclose")[0];
            
            // When the user clicks on <span> (x), close the modal                                    
                span.onclick = function () 
                        {
                                modal.style.display = "none";
            };
</script>
</body>
</html>
