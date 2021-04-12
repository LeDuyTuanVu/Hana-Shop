<%-- 
    Document   : history
    Created on : Jan 17, 2021, 12:24:33 AM
    Author     : Le Duy Tuan Vu
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> HISTORY </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Ribeye+Marrow&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/88a97fe5d9.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <style>
            a.fa-shopping-cart {
                position: relative;
                font-size: 1.5em;
                cursor: pointer;
            }
            span.fa-circle {
                position: absolute;
                font-size: 0.7em;
                top: 10px;
                color: rgb(138, 138, 138);
                right: 95px;
            }
            span.num {
                position: absolute;
                font-size: 0.4em;
                top: 13.2px;
                color: #fff;
                right: 99px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-dark navbar-expand-lg fixed-top bg-dark" id="mainNav">
            <div class="container-fluid"><a class="navbar-brand" href="#page-top" style="font-family: 'Ribeye Marrow', cursive; color: hotpink; font-size: 30px"> HANA SHOP </a><button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler navbar-toggler-right" type="button" data-toogle="collapse" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><i class="fas fa-bars"></i></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="nav navbar-nav ml-auto text-uppercase" style="margin-left: auto; font-family: 'Patua One', cursive; font-size: 19px">
                        <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#home" style=""> HOME </a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="MainController?btnAction=all products" style=""> ALL PRODUCT </a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#service"> SERVICE </a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#contact"> CONTACT </a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="MainController?btnAction=history"> ALL ORDER </a></li>
                            <c:if test="${not empty sessionScope.USER}">
                            <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#contact" style="color: hotpink">${sessionScope.USER.fullName}</a></li>
                            <a class="fas fa-shopping-bag" style="color: hotpink; margin-left: 8px; margin-right: 11px; margin-top: 7px; font-size: 22px" href="MainController?btnAction=cart page">
                                <span class="fa fa-circle fa-2x" style=""></span>
                                <c:if test="${empty sessionScope.NUM_PRO}">
                                    <span class="num">0</span>
                                </c:if>
                                <c:if test="${not empty sessionScope.NUM_PRO}">
                                    <span class="num">${sessionScope.NUM_PRO}</span>
                                </c:if>   

                            </a>
                            <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="MainController?btnAction=logout" style="color: blue"> LOGOUT </a></li>
                            </c:if>
                            <c:if test="${empty sessionScope.USER}">
                            <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="MainController?btnAction=login page" style="color: blue"> SIGN IN </a></li>
                            </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3" style="background-color: white; margin-top: 85px">
                    <div><p style="font-size: 25px; font-family: 'Patua One', cursive; margin-left: 6px; margin-bottom: 5px">SEARCH ORDER BY FILTER</p></div>       
                    <form action="MainController" method="POST">
                        <!--SEARCH PRODUCT BY NAME -->
                        <div>
                            <input style="margin-left: 6px; margin-top: 15px;" class="form-control" type="text" placeholder="Search product by name product"aria-label="Search" name="txtName" value="${requestScope.SEARCH_ORDER_BY_NAME}"></input>
                            <input style="margin-left: 6px; margin-top: 15px;" class="form-control" type="date" aria-label="Search" name="txtDate" value="${requestScope.SEARCH_ORDER_BY_DATE}"></input>
                            <c:if test="${not empty requestScope.MESS_SEARCH_ORDER}">
                                <p style="color: red; font-family: 'Patua One', cursive; margin-left: 6px; margin-top: 10px; margin-bottom: -7px; font-size: 17px">${requestScope.MESS_SEARCH_ORDER}</p>
                            </c:if>
                            <input type="submit" name="btnAction" value="SEARCH ORDER" style="height: 37px; margin-top: 20px; font-family: 'Patua One', cursive; margin-left: 6px; margin-bottom: -50px">
                        </div>                     
                    </form>
                </div>
                <!-- ALL PRODUCT -->
                <div class="col-md-9" style="display: flex; margin-top: 46px">   
                    <div class="album py-5 bg-light">  
                        <c:if test="${empty sessionScope.LIST_ORDER}">
                            <c:if test="${empty requestScope.MESS_SEARCH_ORDER}">
                                <p style="font-size: 25px; font-family: 'Patua One', cursive; color: red; margin-top: -9px; margin-bottom: 5px; margin-left: 25px"> You do not have any order ! &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                            </c:if>
                        </c:if>
                        <c:if test="${not empty requestScope.MESS_SEARCH_ORDER}">
                            <c:if test="${sessionScope.LIST_ORDER.size()==0}">
                                <p style="font-size: 25px; font-family: 'Patua One', cursive; color: red; margin-top: -10px; margin-bottom: 5px; margin-left: 28px">Can't find any products ! &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                            </c:if>
                        </c:if>
                        <div class="container">
                            <div class="row"> 
                                <!-- GET PRODUCT -->
                                <p style="margin-left: 28px">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                                <c:if test="${not empty sessionScope.LIST_ORDER}">
                                    <c:forEach var="order" items="${sessionScope.LIST_ORDER}">                                       
                                        <div class="col-md-3" style="margin-top: -37px; margin-bottom: 45px">
                                            <form action="MainController" method="POST">
                                                <div class="card mb-3 box-shadow" style="border: 2px solid #CCCCCC;">
                                                    <img class="card-img-top" src="${order.image}" data-holder-rendered="true" style="height: 225px; width: 100%; display: block;">
                                                    <hr>
                                                    <div class="card-body" style="font-family: 'Patua One', cursive;">
                                                        <p class="card-text" style="margin-top: -22px">${order.nameProduct} (${order.price}$/1)</p>                                              
                                                        <p class="card-text" style="margin-top: -10px">Quantity: ${order.quantity}</p>
                                                        <p class="card-text" style="margin-top: -10px">Amount: ${order.quantity*order.price} $</p>
                                                        <p class="card-text" style="margin-top: -10px">Date order: ${order.time}</p>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
