<%-- 
    Document   : cart
    Created on : Jan 11, 2021, 11:18:07 PM
    Author     : Le Duy Tuan Vu
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> CART </title>
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
                font-size: 0.6em;
                top: 13px;
                color: rgb(138, 138, 138);
                right: 98px;
            }
            span.num {
                position: absolute;
                font-size: 0.4em;
                top: 14px;
                color: #fff;
                right: 100px;
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
                        <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#services"> SERVICE </a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#contact"> CONTACT </a></li>
                            <c:if test="${not empty sessionScope.USER}">
                            <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="MainController?btnAction=history"> HISTORY </a></li>
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
                            <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="MainController?btnAction=LOGIN PAGE" style="color: blue"> SIGN IN </a></li>
                            </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3" style="background-color: white; margin-top: 90px; font-family: 'Patua One', cursive; font-size: 25px;">
                    <form action="MainController" method="POST">
                        <p style="margin-left: 13px">Number of product : ${sessionScope.NUM_PRO}</p>
                        <p style="margin-left: 13px; margin-top: -10px; margin-left: 13px">Total : ${sessionScope.CART.getTotal()} $</p>
                        <p style="font-size: 20px; margin-bottom: -5px; margin-left: 13px">Name</p><input style="font-size: 18px; font-family: monospace; margin-bottom: 12px; margin-left: 13px" type="text" name="txtNameCustomer" value="${sessionScope.NAME_CUS}">
                        <c:if test="${not empty requestScope.MESS_NAME_CUS}">
                            <p style="color: red; font-size: 18px; margin-left: 13px; margin-top: -10px; margin-bottom: 5px">${requestScope.MESS_NAME_CUS}</p>
                        </c:if>
                        <p style="font-size: 20px; margin-bottom: -5px; margin-left: 13px">Phone</p><input style="font-size: 18px; font-family: monospace; margin-bottom: 12px; margin-left: 13px" type="number" name="txtPhoneCustomer" value="${sessionScope.PHONE_CUS}">
                        <c:if test="${not empty requestScope.MESS_PHONE_CUS}">
                            <p style="color: red; font-size: 18px; margin-left: 13px; margin-top: -10px; margin-bottom: 5px">${requestScope.MESS_PHONE_CUS}</p>
                        </c:if>
                        <p style="font-size: 20px; margin-bottom: -5px; margin-left: 13px">Email</p><input style="font-size: 18px; font-family: monospace; margin-bottom: 12px; margin-left: 13px" type="text" name="txtEmailCustomer" value="${sessionScope.EMAIL_CUS}">
                        <c:if test="${not empty requestScope.MESS_EMAIL_CUS}">
                            <p style="color: red; font-size: 18px; margin-left: 13px; margin-top: -10px; margin-bottom: 5px">${requestScope.MESS_EMAIL_CUS}</p>
                        </c:if>
                        <p style="font-size: 20px; margin-bottom: -5px; margin-left: 13px">Address</p><input style="font-size: 18px; font-family: monospace; margin-bottom: 20px; margin-left: 13px;" type="text" name="txtAddressCustomer" value="${sessionScope.ADDRESS_CUS}">
                        <c:if test="${not empty requestScope.MESS_ADDRESS_CUS}">
                            <p style="color: red; font-size: 18px; margin-left: 13px; margin-top: -19px; margin-bottom: -17px">${requestScope.MESS_ADDRESS_CUS}</p>
                        </c:if>
                        <br><a style="margin-left: 13px; text-decoration: none" href="MainController?btnAction=use">USE MY PROFILE</a>
                        <input type="submit" name="btnAction" value="BUYING NOW" style="margin-left: 13.5px; margin-top: 20px; color: hotpink">
                    </form>
                </div>
                <!-- ALL PRODUCT -->
                <div class="col-md-9" style="display: flex;">   
                    <div class="album py-5 bg-light">  
                        <div class="container">
                            <div class="row"> 
                                <!-- GET PRODUCT -->
                                <p>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                                <c:if test="${not empty requestScope.MESS_BUYING}">
                                    <div><p style="color: red; font-size: 25px; font-family: 'Patua One', cursive; margin-top: 1px; margin-left: 5px">${requestScope.MESS_BUYING}</p></div>
                                    </c:if>
                                    <c:if test="${not empty sessionScope.CART.cart}">
                                        <c:forEach var="product" items="${sessionScope.CART.cart}">                                       
                                        <div class="col-md-3">
                                            <form action="MainController" method="POST">
                                                <input type="hidden" name="txtProductID" value="${product.productID}">
                                                <div class="card mb-3 box-shadow" style="border: 2px solid #CCCCCC">
                                                    <img class="card-img-top" src="${product.image}" data-holder-rendered="true" style="height: 225px; width: 100%; display: block;">
                                                    <hr>
                                                    <div class="card-body" style="font-family: 'Patua One', cursive;">
                                                        <p class="card-text" style="margin-top: -22px; font-size: 18px">${product.productName} &nbsp;(${product.price} $)</p>
                                                        <div style="display: flex;"><p class="card-text" style="margin-top: -10px">Quantity: </p>
                                                            <a style="text-decoration: none; font-size: 25px; margin-top: -19px; margin-left: 10px" href="MainController?btnAction=giam&txtProductID=${product.productID}&txtQuantity=${product.quantity}">-</a>&nbsp;&nbsp;
                                                            <input style="height: 20px; width: 25px; margin-top: -9px" disabled="true" type="text" value="${product.quantity}">&nbsp;&nbsp;
                                                            <a style="text-decoration: none; font-size: 25px; margin-top: -19px" href="MainController?btnAction=them&txtProductID=${product.productID}&txtQuantity=${product.quantity}">+</a>
                                                        </div>                                                          
                                                        <c:set var="amount" value="${product.price*product.quantity}"></c:set>
                                                        <p class="card-text" style="margin-top: -10px">Amount: ${amount} $</p>
                                                        <div class="d-flex justify-content-between align-items-center" style="margin-top: -2px">
                                                            <a style="text-decoration: none" href="MainController?btnAction=DELETE&txtProductID=${product.productID}" onclick="return confirm('Do you want to delete ?')">DELETE</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <p style="margin-top: ">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
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

