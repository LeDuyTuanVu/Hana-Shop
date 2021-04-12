<%-- 
    Document   : updateProduct
    Created on : Jan 14, 2021, 9:19:41 PM
    Author     : Le Duy Tuan Vu
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> UPDATE </title>
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
                        <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="MainController?btnAction=ALL PRODUCT" style=""> ALL PRODUCT </a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link js-scroll-trigger" href="MainController?btnAction=NEW PRODUCT" style=""> NEW PRODUCT </a></li>
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

        <div class="container-fluid">
            <div class="row" style="margin-left: 1px; margin-right: 1px">
                <div class="col-md-6" style="">
                    <h4 class="mb-3" style="text-transform: uppercase; font-family: 'Patua One', cursive; font-size: 27px; margin-top: 90px">Input information of room you want to update</h4>
                    <form class="needs-validation" novalidate="" style="margin-top: 27px" action="MainController" method="POST">
                        <div class="mb-3">
                            <div class="input-group" style="margin-bottom: 5px"><input type="text" name="txtProductName" class="form-control" id="productName" placeholder="Enter name of product" required="" value="${sessionScope.TXT_UPDATE_NAME}"></div>
                            <p style="font-family: monospace; font-size: 15px; color: red; margin-bottom: -7px; margin-left: 1px">${requestScope.MESS_NAME_PRO}</p>
                        </div>
                        <div class="mb-3">
                            <input type="url" name="txtImage" class="form-control" id="image" placeholder="Enter image of product"  style="margin-bottom: 5px" value="${sessionScope.TXT_UPDATE_IMAGE}">
                            <p style="font-family: monospace; font-size: 15px; color: red; margin-bottom: -7px; margin-left: 1px">${requestScope.MESS_IMAGE_PRO}</p>
                        </div>
                        <div class="mb-3">
                            <input type="text" name="txtDescription" class="form-control" id="description" placeholder="Enter description of product" required="" style="margin-bottom: 5px" value="${sessionScope.TXT_UPDATE_DESCRIPTION}">
                            <p style="font-family: monospace; font-size: 15px; color: red; margin-bottom: -7px; margin-left: 1px">${requestScope.MESS_DES_PRO}</p>
                        </div>
                        <div class="mb-3">
                            <div style="display: flex"><input type="number" step="0.1" name="txtPrice" class="form-control" id="price" placeholder="Enter price of product" required="" style="margin-bottom: 5px" value="${sessionScope.TXT_UPDATE_PRICE}"><p style="margin-top: 6.5px; margin-left: 5px">$</p></div>
                            <p style="font-family: monospace; font-size: 15px; color: red; margin-bottom: -7px; margin-left: 1px">${requestScope.MESS_PRICE_PRO}</p>
                        </div>
                        <div class="mb-3">
                            <input type="number" name="txtQuantity" class="form-control" id="quantity" placeholder="Enter quantity of product" required="" style="margin-bottom: 5px;" value="${sessionScope.TXT_UPDATE_QUANTITY}">
                            <p style="font-family: monospace; font-size: 15px; color: red; margin-bottom: -7px; margin-left: 1px">${requestScope.MESS_QUANTITY_PRO}</p>
                        </div>
                        <div class="mb-3">
                            <p style="margin-left: 13.5px; margin-bottom: 2px"> Expiry date </p>
                            <input type="date" name="txtExpiryDate" class="form-control" id="quantity" placeholder="Enter expiry date of product" required="" style="margin-bottom: 5px;" value="${sessionScope.TXT_UPDATE_EXPIRY_DATE}">
                            <p style="font-family: monospace; font-size: 15px; color: red; margin-bottom: -7px; margin-left: 1px">${requestScope.MESS_EXPIRY_DATE_PRO}</p>
                        </div>
                        <div class="mb-3" style="margin-top: 20px">
                            <label for="address" style="font-size: 13.3px; margin-right: 15px;">TYPE OF PRODUCT</label>
                            <select style="font-family: monospace; border-radius: 4px; height: 27px; font-size: 15px; margin-left: 15px; width: auto" name="comboxCategory">
                                <c:if test="${not empty sessionScope.LIST_CATEGORY_NAME}">
                                    <c:forEach var="categoryName" items="${sessionScope.LIST_CATEGORY_NAME}">
                                        <c:set var="temp" value="${sessionScope.TXT_UPDATE_CATEGORY}"></c:set>
                                        <c:if test="${temp.equals(categoryName)}">
                                            <option value="${categoryName}" selected="selected">${categoryName}</option>
                                        </c:if>
                                        <c:if test="${!temp.equals(categoryName)}">
                                            <option value="${categoryName}">${categoryName}</option>
                                        </c:if>                            
                                    </c:forEach>
                                </c:if> 
                            </select>
                            <p style="text-transform: uppercase; font-family: 'Cabin Sketch', cursive; font-size: 27px; color: red; margin-top: -5px"></p>
                        </div>
                        <div class="mb-3" style="">                          
                            <label for="address" style="font-size: 13.3px; margin-right: 15px;">STATUS OF PRODUCT</label>
                            <select style="font-family: monospace; border-radius: 4px; height: 27px; font-size: 15px; width: auto;" name="comboxStatus">
                                <c:set var="status" value="${sessionScope.TXT_UPDATE_STATUS}"></c:set>
                                <c:if test="${status == true}">
                                    <option selected="selected" value="true">Active</option>
                                    <option value="false">Inactive</option>
                                </c:if>
                                <c:if test="${status == false}">
                                    <option value="true">Active</option>
                                    <option selected="selected" value="false">Inactive</option>
                                </c:if>
                                <c:if test="${status != true && status != false}">
                                    <option selected="selected" value="true">Active</option>
                                    <option value="false">Inactive</option>
                                </c:if>
                            </select>
                            <p style="text-transform: uppercase; font-family: 'Cabin Sketch', cursive; font-size: 27px; color: red; margin-top: -5px"></p>
                        </div>
                        <p style="color: red; font-family: 'Patua One', cursive; font-size: 25px; margin-top: 25px">${requestScope.MESSAGE_UPDATE_PRODUCT}</p>
                        <div class="mb-3" style="display: flex; margin-top: 27px">
                            <input type="submit" name="btnAction" class="form-control" id="address" required="" style="margin-bottom: 4vh; background-color: #343A40; border-color: hotpink; font-family: 'Patua One', cursive; font-size: 19px; color: hotpink; width: 125px;" value="PREVIEW">
                            <input type="submit" name="btnAction" class="form-control" id="address" required="" style="margin-bottom: 4vh; background-color: #343A40; border-color: hotpink; font-family: 'Patua One', cursive; font-size: 19px; color: hotpink; width: 178px; margin-left: 10px" value="UPDATE PRODUCT"> 
                        </div>
                    </form>
                </div>
                <div class="col-md-6" style="margin-top: 97.5px">
                    <div class="">
                        <form action="MainController" method="POST">
                            <div class="card mb-3 box-shadow" style="border: 2px solid #CCCCCC">
                                <img class="card-img-top" src="${sessionScope.TXT_UPDATE_IMAGE}" data-holder-rendered="true" style="height: 517px; width: 100%; display: block;">
                                <div class="card-body" style="font-family: 'Patua One', cursive; margin-top: 15px">
                                    <p class="card-text" style="margin-top: -22px">${sessionScope.TXT_UPDATE_NAME}</p>
                                    <p class="card-text" style="margin-top: -10px">Price: ${sessionScope.TXT_UPDATE_PRICE} $</p>
                                    <div class="d-flex justify-content-between align-items-center" style="margin-top: -2px">
                                        <div class="btn-group" style="margin-bottom: -1px">
                                            <input type="button" name="btnAction" value="VIEW">
                                            <input type="button" name="btnAction" value="ADD">
                                        </div>
                                        <small class="text-muted" style="margin-top: 10px; margin-bottom: -11px; margin-right: 2px">${sessionScope.TXT_UPDATE_DAY}</small>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>           
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
