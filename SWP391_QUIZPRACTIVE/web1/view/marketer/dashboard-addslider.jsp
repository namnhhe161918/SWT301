

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Entities.Subject"%>
<%@page import="java.util.List"%>
<%@page import="DAO.DAOSubject"%>
<!DOCTYPE html>
<html lang="vn">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Boxicons CDN Link -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="view/marketer/assets/css/styleSliderAdd.css">

        <!-- Bootstrap 4 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
        
        <!--Ajax-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!-- fontanswer icons -->
        <script src="https://kit.fontawesome.com/fe000f9b2a.js" crossorigin="anonymous"></script>

    </head>
    <body>
        <jsp:include page="sidebar-dashboard.jsp"></jsp:include>
            <section class="home-section">
            <jsp:include page="sidebar-top.jsp"></jsp:include>
            
            <c:if test="${requestScope.message != null}">
                <div class=" container alert alert-danger alert-dismissible mt-3">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Failure!</strong> Subject invalid Please re-choose.
                </div>
            </c:if>

            <div class="content container-fluid mt-3" style="width: 95%;">
                <div class="row filter">
                    <div class="num-entry">
                       <label><a href="#">DashBoard</a> / <a href="listslider">List Slider</a> / <a>Add Slider</a></label>
                    </div>
                </div>
                <form class="row" action="addslider" method="POST" enctype="multipart/form-data" >
                    <div class="col-md-6">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="">Content:</label>
                                <div class="item-input">
                                   <input type="text" name="content" required>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="">Note:</label>
                                <div class="item-input">
                                     <input type="text" name="note" required> 
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
                                        for(Subject s : list){
                                        %>
                                        <option value="<%=s.getSubject_id()%>"><%=s.getSubject_name()%></option>
                                        <% }%>
                                    </Select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="item-input">
                                       <input type="radio" name="status" value="1" checked> visable
                                    <input type="radio" name="status" value="0"> hide
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="">Image:</label>
                                <div class="item-input">
                                    <input type="file" id="file-input" accept="image/*" name="upfile">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label for="">1920x480</label>
                            <img class="frame" id="img-preview" >
                        </div>
                    </div>
                    <div class="col-md-12 mt-3">
                        <div class="form-group">
                            <div class="item-input">
                                <button class="btn-dark" id="submit" type="submit">Submit</button>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- The Modal -->
                <div id="myModal" class="mmodal">
                    <span class="close">&times;</span>
                    <img class="modal-ccontent" id="img01">
                    <div id="caption">alt.png</div>
                </div>
            </div>


        </div>
        <div class="footer mt-3">
            <p>@Copyright by NamNH</p>
        </div>
    </section>
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


        // dialog menu
        let iconUp = document.querySelector(".fa-chevron-down");
        let dialogMenu = document.querySelector(".dropdown-ofme");
        iconUp.addEventListener("click", () => {
            dialogMenu.classList.toggle("show");
            dialogChange();
        })
        function dialogChange() {
            if (dialogMenu.classList.contains("show")) {
                iconUp.classList.replace("fa-chevron-down", "fa-chevron-up");
            } else {
                iconUp.classList.replace("fa-chevron-up", "fa-chevron-down");
            }
        }
    </script>
    <script>
        const input = document.getElementById('file-input');
        const image = document.getElementById('img-preview');

        input.addEventListener('change', (e) => {
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
        img.onclick = function () {
            modal.style.display = "block";
            modalImg.src = this.src;
        };
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        };
    </script>
</body>
</html>
