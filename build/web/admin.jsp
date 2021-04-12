<%-- 
    Document   : admin
    Created on : Jan 12, 2021, 8:25:25 PM
    Author     : Le Duy Tuan Vu
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> ALL PRODUCT </title>
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
                        <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="MainController?btnAction=NEW PRODUCT" style=""> NEW PRODUCT </a></li>
                        <li>
                            <form action="MainController">
                                <input id="temp" type="hidden" name="txtList" value="">
                                <input style="background-color: #212529; border: 0px solid #212529; color: #CCCCCC; margin-top: 7px" type="submit" onclick="return confirm('Do you want to delete ?')" name="btnAction" value="DELETE MARK">
                            </form>
                        </li>
                        <c:if test="${not empty sessionScope.USER}">
                            <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="#contact" style="color: hotpink">${sessionScope.USER.fullName}</a></li>
                            <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="MainController?btnAction=logout" style="color: blue"> LOGOUT </a></li>
                            </c:if>
                            <c:if test="${empty sessionScope.USER}">
                            <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="MainController?btnAction=LOGIN PAGE" style="color: blue"> SIGN IN </a></li>
                            </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid" style="margin-top: 85px">
            <div class="row" style=""> 
                <!-- GET PRODUCT -->
                <c:if test="${not empty sessionScope.LIST_ALL_PRO}">
                    <c:forEach var="product" items="${sessionScope.LIST_ALL_PRO}" varStatus="index"> 
                        <div class="col-md-2" style="margin-bottom: 15px">
                            <form action="MainController" method="POST">
                                <input id="productID[${index.count}]" type="hidden" name="txtProductID" value="${product.productID}">
                                <div class="card mb-2 box-shadow" style="border: 2px solid #CCCCCC">
                                    <img class="card-img-top" src="${product.image}" data-holder-rendered="true" style="height: 225px; width: 100%; display: block;">
                                    <hr>
                                    <div class="card-body" style="font-family: 'Patua One', cursive;">
                                        <p class="card-text" style="margin-top: -22px">${product.productName} &nbsp;(${product.price} $)</p>
                                        <p class="card-text" style="margin-top: -10px">Quantity: ${product.quantity}</p>
                                        <p class="card-text" style="margin-top: -10px">Expiry date: ${product.expiryDate}</p>  
                                        <c:if test="${product.status == true}">
                                            <p class="card-text" style="margin-top: -10px">Status: Active</p>
                                            <c:set var="statusTemp" value=""></c:set>
                                        </c:if>
                                        <c:if test="${product.status == false}">
                                            <p class="card-text" style="margin-top: -10px">Status: Inactive</p>
                                            <c:set var="statusTemp" value="disabled='disabled'"></c:set>
                                        </c:if>  
                                        <div class="d-flex justify-content-between align-items-center" style="margin-top: -2px">
                                            <div class="btn-group" style="margin-bottom: -1px">
                                                <input type="submit" name="btnAction" value="UPDATE" style="margin-right: 10px">
                                                <button style="border-radius: 2px; border: 1px; margin-right: 3px"><label style="margin-top: -6px">DELETE</label></button>  
                                                <input type="checkbox" ${statusTemp} onclick="getListCheck(${index.count})" name="checkBox" style="height: 25px; width: 25px; margin-top: 2.7px">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:forEach>
                </c:if>               
            </div>
            <!-- PAGING -->
            <nav aria-label="Page navigation example" style="margin-top: 5px; margin-bottom: 20px;">
                <ul class="pagination">
                    <!-- SHOW NUMBER OF PAGE, PAGING -->
                    <c:if test="${sessionScope.NUMBER_PAGE > 1}">
                        <li class="page-item" style="margin-left: auto">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <c:forEach var="num" begin="1" end="${sessionScope.NUMBER_PAGE}">
                            <li class="page-item"><a class="page-link" href="MainController?btnAction=PAGE&txtNumber=${num}">${num}</a></li>
                            </c:forEach>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </c:if>
                    <!-- IF DO NOT HAVE ANY PRODUCT -->
                    <c:if test="${sessionScope.NUMBER_PAGE == 0}">
                        <p style="font-family: 'Patua One', cursive; color: red; font-size: 26px; margin-top: -15px; margin-bottom: 5px"> Sorry ! We do not have any product have this name ! Please search another name. Thank you ! </p>
                    </c:if>
                </ul>
            </nav>
        </div>
        <input type="hidden" id="mess" name="txtMess" value="${requestScope.MESS_DELETE_AD}">
        <script>
            function getListCheck(index) {
                var productID = document.getElementById("productID[" + index + "]").value;
                if (document.getElementById("productID[" + index + "]").value != "") {
                    document.getElementById("temp").value = productID + "-" + document.getElementById("temp").value;
                }
                console.log(document.getElementById("temp").value);
            }
            var mess = document.getElementById("mess").value;
            if (mess != "") {
                alert(mess); 
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
