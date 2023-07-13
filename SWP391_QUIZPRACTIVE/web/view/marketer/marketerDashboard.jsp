<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <!--FIXXED-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="view/marketer/assets/css/styleMain.css"/>

        <!--END FIXXED-->

        <!--favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo/lloo.png" />

        <!-- Bootstrap 4 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
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


            <!--section-->
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
                                    <li><a href="index.html">Home</a></li>
                                    <li>Dashboard</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--breadcrumbs-->
                <div class="container">
                    <div class="row">

                    <jsp:include page="/view/marketer/sidebar-dashboard.jsp"></jsp:include>


                        <div class="col-lg-9 col-md-8 col-12">
                            <div class="main-content">

                                <div class="details-lists">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-12">

                                            <div class="single-list">
                                                <div class="list-icon">
                                                    <i class="lni lni-postcard"></i>
                                                </div>
                                                <h3>
                                                    340
                                                    <span>Number of posts</span>
                                                </h3>
                                            </div>

                                        </div>
                                        <div class="col-lg-4 col-md-4 col-12">

                                            <div class="single-list two">
                                                <div class="list-icon">
                                                    <i class="lni lni-image"></i>
                                                </div>
                                                <h3>
                                                    23
                                                    <span>Number of sliders</span>
                                                </h3>
                                            </div>

                                        </div>
                                        <div class="col-lg-4 col-md-4 col-12">

                                            <div class="single-list three">
                                                <div class="list-icon">
                                                    <i class="lni lni-bug"></i>
                                                </div>
                                                <h3>
                                                    ##
                                                    <span>Null </span>
                                                </h3>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                <%
  Gson gsonObj = new Gson();
  Map<Object,Object> map = null;
  List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
  map = new HashMap<Object,Object>(); map.put("label", "FY11"); map.put("y", 146.65); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "FY12"); map.put("y", 201.46); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "FY13"); map.put("y", 202.69); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "FY14"); map.put("y", 201.7); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "FY15"); map.put("y", 175.51); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "FY16"); map.put("y", 132.03); list.add(map);
 
  String dataPoints = gsonObj.toJson(list);
                                %>

                                <div col-lg-12 col-md-12 col-12>
                                    <div id="chartContainer" style="height: 370px; width: 100%;"></div>

                                </div>
                            </div> 





































                            <!--                                <div class="row">
                                                                <div class="col-lg-6 col-md-12 col-12">
                            
                                                                    <div class="activity-log dashboard-block">
                                                                        <h3 class="block-title">My Activity Log</h3>
                                                                        <ul>
                                                                            <li>
                                                                                <div class="log-icon">
                                                                                    <i class="lni lni-alarm"></i>
                                                                                </div>
                                                                                <a href="javascript:void(0)" class="title">Your Profile Updated!</a>
                                                                                <span class="time">12 Minutes Ago</span>
                                                                                <span class="remove"><a href="javascript:void(0)"><i
                                                                                            class="lni lni-close"></i></a></span>
                                                                            </li>
                                                                            <li>
                                                                                <div class="log-icon">
                                                                                    <i class="lni lni-alarm"></i>
                                                                                </div>
                                                                                <a href="javascript:void(0)" class="title">You change your password</a>
                                                                                <span class="time">59 Minutes Ago</span>
                                                                                <span class="remove"><a href="javascript:void(0)"><i
                                                                                            class="lni lni-close"></i></a></span>
                                                                            </li>
                                                                            <li>
                                                                                <div class="log-icon">
                                                                                    <i class="lni lni-alarm"></i>
                                                                                </div>
                                                                                <a href="javascript:void(0)" class="title">Your ads approved!</a>
                                                                                <span class="time">5 Hours Ago</span>
                                                                                <span class="remove"><a href="javascript:void(0)"><i
                                                                                            class="lni lni-close"></i></a></span>
                                                                            </li>
                                                                            <li>
                                                                                <div class="log-icon">
                                                                                    <i class="lni lni-alarm"></i>
                                                                                </div>
                                                                                <a href="javascript:void(0)" class="title">You submit a new ads</a>
                                                                                <span class="time">8 hours Ago</span>
                                                                                <span class="remove"><a href="javascript:void(0)"><i
                                                                                            class="lni lni-close"></i></a></span>
                                                                            </li>
                                                                            <li>
                                                                                <div class="log-icon">
                                                                                    <i class="lni lni-alarm"></i>
                                                                                </div>
                                                                                <a href="javascript:void(0)" class="title">You subscribe as a pro user!</a>
                                                                                <span class="time">1 day Ago</span>
                                                                                <span class="remove"><a href="javascript:void(0)"><i
                                                                                            class="lni lni-close"></i></a></span>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                            
                                                                </div>
                                                                <div class="col-lg-6 col-md-12 col-12">
                            
                                                                    <div class="recent-items dashboard-block">
                                                                        <h3 class="block-title">Recent Ads</h3>
                                                                        <ul>
                                                                            <li>
                                                                                <div class="image">
                                                                                    <a href="javascript:void(0)"><img alt="#"
                                                                                                                      data-pagespeed-url-hash="1800032134"
                                                                                                                      src="https://demo.graygrids.com/themes/classigrids-demo/assets/images/dashboard/xuser-image.jpg.pagespeed.ic.YpFzrr6OVW.webp"></a>
                                                                                </div>
                                                                                <div class="product">
                                                                                    <a href="javascript:void(0)" class="title">iPhone 11 Pro Max</a>
                                                                                    <span class="time">12 Minutes Ago</span>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div class="image">
                                                                                    <a href="javascript:void(0)"><img alt="#"
                                                                                                                      data-pagespeed-url-hash="2094532055"
                                                                                                                      src="https://demo.graygrids.com/themes/classigrids-demo/assets/images/dashboard/xuser-image.jpg.pagespeed.ic.YpFzrr6OVW.webp"></a>
                                                                                </div>
                                                                                <div class="product">
                                                                                    <a href="javascript:void(0)" class="title">iPhone 11 Pro Max</a>
                                                                                    <span class="time">12 Minutes Ago</span>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div class="image">
                                                                                    <a href="javascript:void(0)"><img alt="#"
                                                                                                                      data-pagespeed-url-hash="2389031976"
                                                                                                                      src="https://demo.graygrids.com/themes/classigrids-demo/assets/images/dashboard/xuser-image.jpg.pagespeed.ic.YpFzrr6OVW.webp"></a>
                                                                                </div>
                                                                                <div class="product">
                                                                                    <a href="javascript:void(0)" class="title">iPhone 11 Pro Max</a>
                                                                                    <span class="time">12 Minutes Ago</span>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div class="image">
                                                                                    <a href="javascript:void(0)"><img alt="#"
                                                                                                                      data-pagespeed-url-hash="2683531897"
                                                                                                                      src="https://demo.graygrids.com/themes/classigrids-demo/assets/images/dashboard/xuser-image.jpg.pagespeed.ic.YpFzrr6OVW.webp"></a>
                                                                                </div>
                                                                                <div class="product">
                                                                                    <a href="javascript:void(0)" class="title">iPhone 11 Pro Max</a>
                                                                                    <span class="time">12 Minutes Ago</span>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                            
                                                                </div>
                                                            </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--section-->

        <jsp:include page="/jspClient/Footer.jsp" />
        <script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
        <script type="text/javascript">
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    title: {
                        text: "Imports of Ore and Minerals in India"
                    },
                    axisX: {
                        title: "Fiscal Year"
                    },
                    axisY: {
                        title: "Imports (in billion USD)",
                        includeZero: true
                    },
                    data: [{
                            type: "column",
                            yValueFormatString: "$#,##0.0# billion",
                            dataPoints: <%out.print(dataPoints);%>
                        }]
                });
                chart.render();

            }
        </script>
    </body>
</html>