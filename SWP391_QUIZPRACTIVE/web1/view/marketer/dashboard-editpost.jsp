<%-- 
    Document   : dashboard-editpost
    Created on : 15-Jun-2023, 04:58:26
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Boxicons CDN Link -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="stylePostEdit.css">

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

        <!-- fontanswer icons -->
        <script src="https://kit.fontawesome.com/fe000f9b2a.js" crossorigin="anonymous"></script>

        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    </head>
    <body>
        <jsp:include page="sidebar-dashboard.jsp"></jsp:include>
            <section class="home-section">
            <jsp:include page="sidebar-top.jsp"></jsp:include>


            <div class="content container-fluid mt-3" style="width: 95%;">
                <div class="row filter">
                    <div class="num-entry">
                        <label><a href="#">DashBoard</a> / <a>List Post</a> / <a>Add Post</a></label>
                    </div>
                </div>
                <form class="row">
                    <div class="col-md-6">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="">Title:</label>
                                <div class="item-input">
                                    <input type="text">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="">Short content:</label>
                                <div class="item-input">
                                    <input type="text">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="">Content:</label>
                                <div class="item-input">
                                    <textarea name="message" id="message"></textarea><br>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="item-input">
                                    <button class="btn-dark">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="">Image:</label>
                                <div class="item-input">
                                    <input type="file" id="file-input" accept="image/*">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label for="">1920x480</label>
                            <img class="frame" id="img-preview">
                        </div>
                    </div>
                </form>
            </div>
            <div class="footer mt-3">
                <p>@Copyright by NamNH</p>
            </div>
        </section>
        <script src="tinymce/tinymce.min.js"></script>
        <script>
            tinymce.init({
                selector: "textarea",
                plugins: [
                    "advlist autolink lists link image charmap print preview anchor",
                    "searchreplace visualblocks code fullscreen emoticons textcolor",
                    "insertdatetime media table contextmenu paste imagetools autoresize"
                ],
                image_advtab: true,
                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent |image link imageupload | emoticons charmap | forecolor backcolor"
            })
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
    </body>
</html>
