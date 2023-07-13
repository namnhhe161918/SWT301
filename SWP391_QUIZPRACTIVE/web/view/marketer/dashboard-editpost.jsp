
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Entities.Subject"%>
<%@page import="Entities.Blog"%>
<%@page import="Entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOSubject"%>
<%@page import="DAO.DAOBlog"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="view/marketer/assets/css/stylePostAdd.css">

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
                    <strong>Failure!</strong> Subject or Blog invalid Please re-choose.
                </div>
            </c:if>
            <c:if test="${requestScope.notification != null}">
                <div class=" container alert alert-success alert-dismissible mt-3">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Saved Change!</strong> Successfully
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
                                <li><a href="dashboardlistpost">List Post</a></li>
                                <li>Edit Post</li>
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
                            <form class="row" action="updatepost" method="POST" enctype="multipart/form-data" >
                            <%
                               Post po = (Post) request.getAttribute("post");
                                        if(po != null){
                            %>
                            <div class="col-lg-4 col-md-12 col-12">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="">Title:</label>
                                        <div class="item-input">
                                            <input type="text" name="title" value="<%=po.getTittle()%>" required>
                                        </div>
                                    </div>
                                </div> 
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="">Short content:</label>
                                        <div class="item-input">
                                            <textarea type="text" name="shortcontent" required><%=po.getShort_content()%></textarea>
                                        </div>
                                    </div>
                                </div> 

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="">Image:</label>
                                        <div class="item-input">
                                            <input type="file" id="file-input" accept="image/*" name="upfile">
                                            <input type="hidden"  name="upfilehide" value="<%=po.getImage()%>"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <img class="frame" id="img-preview" src="assets/images/thumbnail-post/<%=po.getImage()%>">
                                </div>

                                <div class="col-md-12 mt-3">
                                    <div class="form-group">
                                        <label for="">Relative Subject:</label>
                                        <div class="item-input">
                                            <Select name="subject">
                                                <option value="-1">Choose relative subject</option>
                                                <%
                                                     DAOSubject sdb = new DAOSubject();    
                                                     List<Subject> list = sdb.getAll();
                                                  
                                                     for(Subject s : list){
                                                %>
                                                <option value="<%=s.getSubject_id()%>" <%=s.getSubject_id() == po.getSubject_id() ? "selected" : "" %> ><%=s.getSubject_name()%></option>
                                                <% }%>
                                            </Select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 mt-3">
                                    <div class="form-group">
                                        <label for="">Category Blog:</label>
                                        <div class="item-input">
                                            <Select name="blog">
                                                <option value="-1">Choose category blog</option>
                                                <%
                                                 DAOBlog bdb = new DAOBlog();    
                                                 ArrayList<Blog> blist = bdb.getAll2();
                                                 for(Blog b : blist){
                                                %>
                                                <option value="<%=b.getBlog_id()%>" <%=b.getBlog_id() == po.getBlog_id() ? "selected" : "" %> ><%=b.getBlog_name()%></option>
                                                <% }%>
                                            </Select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="item-input">
                                            <label for="">Posted Date:</label>
                                            <input type="datetime" value="<%=po.getPosted_date()%>" readonly/>
                                        </div>
                                    </div>
                                </div>         

                            </div>

                            <div class="col-lg-8 col-md-12 col-12">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="">Content:</label>
                                        <div class="item-input">
                                            <textarea name="message" id="message"><%=po.getContent()%></textarea><br>	
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% }%>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="item-input">
                                        <button class="btn-dark" type="submit">Save Change</button>
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
            function redirect() {
                window.location.href = ('dashboardlistpost');
            }
        </script>
        <script src="tinymce/tinymce.min.js"></script>
        <script>
            tinymce.init({
                selector: "#message",
                plugins: [
                    "advlist autolink lists link image charmap print preview anchor",
                    "searchreplace visualblocks code fullscreen emoticons textcolor",
                    "insertdatetime media table contextmenu paste imagetools autoresize"
                ],
                image_advtab: true,
                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent |image link imageupload | emoticons charmap | forecolor backcolor",
                imagetools_toolbar: "rotateleft rotateright | flipv fliph | editimage imageoptions",
                autoresize_on_init: false,
                autoresize_bottom_margin: 5,
                setup: function (editor) {
                    var inp = $('<input id="tinymce-uploader" type="file" name="pic" accept="image/*" style="display:none">');
                    $(editor.getElement()).parent().append(inp);
                    inp.on("change", function () {
                        var input = inp.get(0);
                        var file = input.files[0];
                        var formData = new FormData();
                        formData.append("file", file);
                        formData.append('filetype', 'image');
                        $.ajax({
                            url: "ImageUploadServlet",
                            type: "POST",
                            data: formData,
                            contentType: false,
                            processData: false,
                            success: function (response) {
                                var imageUrl = "upload/" + response;
                                editor.insertContent('<img src="' + imageUrl + '"/>');
                                inp.val('');
                            },
                            error: function (xhr, status, error) {
                                console.log(error);
                            }
                        });
                    });
                    editor.addButton('imageupload', {
                        text: "",
                        icon: 'image',
                        onclick: function (e) {
                            inp.trigger('click');
                        }
                    });
                }
            });
        </script>
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
            })
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
            var span = document.getElementsByClassName("cclose")[0];

            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            };
        </script>
    </body>
</html>
