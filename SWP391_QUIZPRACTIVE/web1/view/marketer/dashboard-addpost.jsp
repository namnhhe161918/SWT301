<%-- 
    Document   : dashboard-addpost
    Created on : 15-Jun-2023, 04:58:15
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Boxicons CDN Link -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="view/marketer/assets/css/stylePostAdd.css">

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

        <!--Ajax-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    </head>
    <body>
        <jsp:include page="sidebar-dashboard.jsp"></jsp:include>
            <section class="home-section">
            <jsp:include page="sidebar-top.jsp"></jsp:include>
            
            <c:if test="${requestScope.message != null}">
                <div class=" container alert alert-danger alert-dismissible mt-3">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Failure!</strong> Subject invalid or Blog invalid Please re-choose.
                </div>
            </c:if>

            <div class="content container-fluid mt-3" style="width: 95%;">
                <div class="row filter">
                    <div class="num-entry">
                        <label><a href="#">DashBoard</a> / <a href="listpost">List Post</a> / <a>Add Post</a></label>
                    </div>
                </div>
                <form class="row" action="addpost" method="POST" enctype="multipart/form-data" >
                    <div class="col-md-6">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="">Title:</label>
                                <div class="item-input">
                                    <input type="text" name="title" required>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="">Short content:</label>
                                <div class="item-input">
                                    <input type="text" name="shortcontent" required>
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
                            <img class="frame" id="img-preview">
                        </div>
                        <div class="col-md-12 mt-3">
                            <div class="form-group">
                                <label for="">Relative Subject:</label>
                                <div class="item-input">
                                    <Select name="subject">
                                        <option value="-1">Choose relative subject</option>
                                        <option value="">A</option>
                                        <option value="">B</option>
                                        <option value="">C</option>
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
                                        <option value="">A</option>
                                        <option value="">B</option>
                                        <option value="">C</option>
                                    </Select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="item-input">
                                    <input type="radio" name="status" id="" checked>
                                    <label for="">pending</label>
                                </div>
                                <div class="item-input">
                                    <input type="radio" name="status" id="" disabled>
                                    <label for="">reject</label>
                                </div>
                                <div class="item-input">
                                    <input type="radio" name="status" id="" disabled>
                                    <label for="">approve</label>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="item-input">
                                    <button class="btn-dark" type="submit">Submit</button>
                                </div>
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
