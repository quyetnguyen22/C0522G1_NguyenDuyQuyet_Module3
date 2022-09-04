<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/8/2022
  Time: 9:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


</head>
<body>
<header class="text-center">
    <div class="row">
        <div class="col-md-3">
            <a href="https://furamavietnam.com/">
                <img class="img-fluid" width="63" height="100"
                     src="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png" alt="not connect"></a>
        </div>
        <div class="col-md-3">
            <p>103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District, Danang City, Vietnam
            <p class="txt-sm">
                <span>7,0 km</span> from Danang Airport</p>
        </div>
        <div class="col-md-3">
            <div class="col-sm-12" style="width: 100%;">
                <a href="https://www.tripadvisor.com/Hotel_Review-g298085-d302750-Reviews-Furama_Resort_Danang-Da_Nang_Quang_Nam_Province.html"
                   target="_blank">
                    <div class="widget-tripadvisor">
                        <div class="inside">
                            <div class="widget-tripadvisor-logo"><img
                                    src="https://smartdata.tonytemplates.com/bestel/wp-content/uploads/2018/05/widget-tripadvisor-logo.png"
                                    alt=""></div>
                            <div class="widget-tripadvisor-rating"><img
                                    src="https://furamavietnam.com/wp-content/uploads/2018/08/widget-tripadvisor-rating.png"
                                    alt=""></div>
                            <div class="widget-tripadvisor-text">2,746 Reviews</div>
                        </div>
                    </div>
                </a>
                <span class="catalog-widget-toggle js-catalog-widget-toggle"></span></div>
        </div>
        <div class="col-md-3">
            <p class="txt-lg">
                84-236-3847 333/888</p>
            <a href="mailto:reservation@furamavietnam.com">
                reservation@furamavietnam.com </a>
        </div>
    </div>
</header>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown">Employee</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/Employee?action=showAll">Employee list</a></li>
                        <li><a class="dropdown-item" href="/Employee?action=add">Add new employee</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown">Customer</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/Customer?action=showAll">Customer list</a></li>
                        <li><a class="dropdown-item" href="/Customer?action=add">Add new customer</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown">Service</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/Service?action=showAll">Service list</a></li>
                        <li><a class="dropdown-item" href="/Service?action=add">Add new service</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown">Contract</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Contract list</a></li>
                        <li><a class="dropdown-item" href="#">Add new contract</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div>
    <section>
        <div style="background-image: url(https://furamavietnam.com/wp-content/uploads/2018/07/Vietnam_Danang_Furama_Resort_Exterior_Courtyard.jpg);">

        </div>
    </section>
    <aside></aside>
</div>
<footer></footer>

<%--<button data-bs-toggle="modal" data-bs-target="#deleteModal">d</button>--%>
<%--<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <input hidden type="text" name="id" id="idDelete">--%>
<%--                <p>Are you sure that you want to delete <span style="color: red" id="nameDelete"></span>?</p>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
<%--                <button data-bs-toggle="modal" data-bs-target="#informDeleted" name="action" value="delete"--%>
<%--                        type="submit" class="btn btn-danger">Yes--%>
<%--                </button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
