<%-- 
    Document   : login
    Created on : Jan 11, 2021, 4:30:26 PM
    Author     : Le Duy Tuan Vu
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> LOGIN </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">
        <style>
            .text-center{
                background-image: url("https://i.pinimg.com/originals/58/72/a8/5872a8f374c5d7d089a729563138109d.jpg");
            }
            .text-center .container .row .col-md-6 .panel{
                background-color: rgba(0, 0, 0, 0.8);
            }
        </style>
    </head>

    <body class="text-center">
       	<div class="container">
            <div class="row">
                <div class="col-md-6" style="margin: auto; margin-top: 180px">
                    <div class="panel panel-default" >
                        <div class="panel-heading">
                            <h3 class="panel-title" style="font-family: 'Patua One', cursive; padding-top: 25px; color: white; font-size: 40px">LOGIN TO YOUR ACCOUNT</h3>
                        </div>
                        <div class="panel-body">
                            <form action="MainController" method="POST" accept-charset="UTF-8" role="form">
                                <fieldset style="padding-top: 30px; padding-left: 50px; padding-right: 50px">
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Enter user name" value="${sessionScope.USER_ID}" name="txtUserID" type="text" style="margin-bottom: 28px; height: 42px">
                                        <c:if test="${not empty sessionScope.MESSAGE_USER_ID}">
                                            <h5 style="margin-top: -22px; margin-bottom: 15px; font-family: 'Patua One', cursive; color: red">${sessionScope.MESSAGE_USER_ID}</h1>
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Enter password" value="${sessionScope.PASSWORD}" name="txtPassword" type="password" value="" style="margin-bottom: 37px; height: 42px">
                                    </div>
                                    <c:if test="${not empty sessionScope.MESSAGE_PASSWORD}">
                                        <h5 style="margin-top: -25px; margin-bottom: 20px; font-family: 'Patua One', cursive; color: red">${sessionScope.MESSAGE_PASSWORD}</h1>
                                    </c:if> 
                                    <c:if test="${not empty sessionScope.MESSAGE_LOGIN}">
                                        <h5 style="margin-top: -25px; margin-bottom: 20px; font-family: 'Patua One', cursive; color: red">${sessionScope.MESSAGE_LOGIN}</h1>
                                    </c:if> 
                                    <input class="btn btn-lg btn-success btn-block" name="btnAction" type="submit" value="SIGN IN" style="margin-bottom: 30px; font-family: 'Patua One', cursive; color: white">
                                    <input class="btn btn-lg btn-success btn-block" name="btnAction" type="button" value="SIGN UP" style="margin-bottom: 30px; font-family: 'Patua One', cursive; color: white">
                                </fieldset>
                            </form>
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
