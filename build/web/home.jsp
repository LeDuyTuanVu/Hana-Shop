<%-- 
    Document   : home
    Created on : Jan 11, 2021, 12:22:16 PM
    Author     : Le Duy Tuan Vu
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> HOME </title>
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
                            <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="MainController?btnAction=login page" style="color: blue"> SIGN IN </a></li>
                            </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3" style="background-color: white; margin-top: 83px">
                    <div><p style="font-size: 25px; font-family: 'Patua One', cursive; margin-left: 5px; margin-bottom: 17px">SEARCH BY FILTER</p></div>       
                    <form action="MainController" method="POST">
                        <!--SEARCH PRODUCT BY NAME -->
                        <div>
                            <strong style="margin-left: 5px; font-size: 17.1px;"> Search by name </strong>
                            <input style="margin-left: 5px; margin-top: 10px; margin-right: 23px;" class="form-control" type="text" placeholder="Search product by name"aria-label="Search" name="txtSearch" value="${sessionScope.TXT_SEARCH}"></input>
                        </div>                     
                        <!-- SEARCH PRODUCT BY DEPARTMENT -->
                        <div class="dropdown" style="margin-left: 5px; margin-top: 20px;">
                            <strong style="font-size: 17px"> Search by department </strong>
                            <div style="width: 101.3%">
                                <select class="form-control" name="txtCategory" style="border-radius: 1.5px; border-color: lightslategrey; margin-top: 10px; height: 40px; margin-bottom: 20px">                              
                                    <c:if test="${not empty sessionScope.LIST_CATEGORY_NAME}">
                                        <option value="All" style="font-weight: 400;">All Categories</option>
                                        <c:forEach var="categoryName" items="${sessionScope.LIST_CATEGORY_NAME}">
                                            <c:if test="${sessionScope.TXT_CATEGORY.equals(categoryName)}">
                                                <option selected="selected" value="${categoryName}" style="font-weight: 400;">${categoryName}</option>
                                            </c:if>
                                            <c:if test="${!sessionScope.TXT_CATEGORY.equals(categoryName)}">
                                                <option value="${categoryName}" style="font-weight: 400;">${categoryName}</option>
                                            </c:if> 
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty sessionScope.LIST_CATEGORY_NAME}">
                                        <option value="Empty" style="font-weight: 400;"> Don't have any categories ! </option>    
                                    </c:if>
                                </select>
                            </div>
                        </div>
                        <!-- SEASRCH PRODUCT BY PRICE -->
                        <div>
                            <strong style="margin-left: 5px; font-size: 17px;"> Search by price </strong>
                            <div style="margin-top: 6px; margin-left: 5px;">
                                <input type="number" step="0.1" name="txtPrice1" placeholder=" From . . ." value="${sessionScope.PRICE1}" style="margin-bottom: 15px; margin-top: 5px; height: 40px; width: 90px; text-align: center"> -
                                <input type="number" step="0.1" name="txtPrice2" placeholder=" To . . ." value="${sessionScope.PRICE2}" style="margin-bottom: 20px; height: 40px; width: 90px; text-align: center">&nbsp; $<br>
                                <c:if test="${not empty requestScope.MESSAGE_PRICE}">
                                    <p style="color: red; font-family: 'Patua One', cursive;">${requestScope.MESSAGE_PRICE}</p>
                                </c:if>
                                <input type="submit" name="btnAction" value="SEARCH" style="margin-bottom: 30px; font-family: 'Patua One', cursive; height: 39px; margin-top: 6px">
                            </div> 
                        </div>
                    </form>
                </div>
                <!-- ALL PRODUCT -->
                <div class="col-md-9" style="display: flex; margin-top: 45px">   
                    <div class="album py-5 bg-light">  
                        <p style="font-size: 30px; font-family: 'Patua One', cursive; color: hotpink; text-align: center; margin-top: -10px; margin-bottom: 5px">${requestScope.MESSAGE_SHOPPING}</p>
                        <c:if test="${not empty requestScope.MESSAGE_ADD_FAIL}">
                            <p style="font-size: 30px; font-family: 'Patua One', cursive; color: hotpink; text-align: center; margin-top: -10px; margin-bottom: 5px">${requestScope.MESSAGE_ADD_FAIL}</p>
                        </c:if>
                        <div class="container">
                            <div class="row"> 
                                <!-- GET PRODUCT -->
                                <c:if test="${not empty sessionScope.LIST_PRODUCT}">
                                    <div><p style="margin-bottom: -11px">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p></div>
                                    <c:forEach var="product" items="${sessionScope.LIST_PRODUCT}">                                       
                                        <div class="col-md-3" style="margin-top: -5px; margin-bottom: 12px">
                                            <form action="MainController" method="POST">
                                                <input type="hidden" name="txtProductID" value="${product.productID}">
                                                <input type="hidden" name="txtQuantity" value="${product.quantity}">
                                                <div class="card mb-3 box-shadow" style="border: 2px solid #CCCCCC">
                                                    <img class="card-img-top" src="${product.image}" data-holder-rendered="true" style="height: 225px; width: 100%; display: block;">
                                                    <hr>
                                                    <div class="card-body" style="font-family: 'Patua One', cursive;">
                                                        <p class="card-text" style="margin-top: -22px">${product.productName}</p>
                                                        <p class="card-text" style="margin-top: -10px">Price: ${product.price} $</p>
                                                        <div class="d-flex justify-content-between align-items-center" style="margin-top: -2px">
                                                            <div class="btn-group" style="margin-bottom: -1px">
                                                                <input type="button" name="btnAction" value="VIEW">
                                                                <input type="submit" name="btnAction" value="ADD">
                                                            </div>
                                                            <small class="text-muted" style="margin-top: 10px; margin-bottom: -11px; margin-right: 2px">${product.createDate}</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <!-- PAGING -->
                                <nav aria-label="Page navigation example" style="margin-top: 3px; margin-bottom: -35px;">
                                    <ul class="pagination">
                                        <!-- SHOW NUMBER OF PAGE, PAGING -->
                                        <c:if test="${sessionScope.NUMBER_OF_PAGE > 1}">
                                            <li class="page-item" style="margin-left: auto">
                                                <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                            <c:forEach var="num" begin="1" end="${sessionScope.NUMBER_OF_PAGE}">
                                                <li class="page-item"><a class="page-link" href="MainController?btnAction=SEARCH&txtPrice1=${sessionScope.PRICE1}&txtPrice2=${sessionScope.PRICE2}&txtCategory=${sessionScope.TXT_CATEGORY}&txtSearch=${sessionScope.TXT_SEARCH}&txtNum=${num}">${num}</a></li>
                                                </c:forEach>
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <!-- IF DO NOT HAVE ANY PRODUCT -->
                                        <c:if test="${sessionScope.NUMBER_OF_PAGE == 0}">
                                            <p style="font-family: 'Patua One', cursive; color: red; font-size: 26px; margin-top: -13px"> Sorry ! We do not have any product have this name ! Please search another name. Thank you ! </p>
                                        </c:if>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${not empty sessionScope.WELLCOME}">
            <c:set var="temp" value="${sessionScope.WELLCOME}"></c:set>
            <p id="mess">${temp}</p>
        </c:if>
        <script>
            var mess = document.getElementById("mess").innerHTML;
            if (mess != "") {
                alert("Wellcome " + mess + " to Hana shop !");
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
