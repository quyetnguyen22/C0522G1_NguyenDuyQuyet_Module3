<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/9/2022
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>

<div class="container col-12">
    <h3 class="text-center">Edit service</h3>
</div>
<div class="container border border-primary w-50">
    <form class="g-3" action="/Service?action=edit&id=${service.getId()}" method="post">
        <div class="col-12">
            <label for="inputName" class="form-label">Name:</label>
            <input type="text" name="serviceName" value="${service.getServiceName()}" class="form-control"
                   id="inputName">
        </div>

        <div class="col-12">
            <label for="inputArea" class="form-label">Area:</label>
            <input type="text" name="area" value="${service.getArea()}" class="form-control"
                   id="inputArea">
        </div>

        <div class="col-12">
            <label for="inputPrice" class="form-label">Price:</label>
            <input type="text" name="price" value="${service.getPrice()}" class="form-control"
                   id="inputPrice">
        </div>

        <div class="col-12">
            <label for="inputCapacity" class="form-label">Capacity:</label>
            <input type="text" name="capacity" value="${service.getCapacity()}" class="form-control"
                   id="inputCapacity">
        </div>

        <div class="col-12">
            <label for="inputStandard" class="form-label">Standard:</label>
            <input type="text" name="standard" value="${service.getStandard()}" class="form-control"
                   id="inputStandard">
        </div>

        <div class="col-12">
            <label for="inputUtility" class="form-label">Utility:</label>
            <input type="text" name="utility" value="${service.getUtil()}" class="form-control"
                   id="inputUtility">
        </div>

        <c:if test="${service.getPoolArea() != null}">
            <div class="col-12">
                <label for="inputPoolArea" class="form-label">Pool area:</label>
                <input type="text" name="poolArea" value="${service.getPoolArea()}" class="form-control"
                       id="inputPoolArea">
            </div>
        </c:if>

        <c:if test="${service.getFloor() != null}">
            <div class="col-12">
                <label for="inputFloor" class="form-label">Number of floor:</label>
                <input type="text" name="floor" value="${service.getFloor()}" class="form-control"
                       id="inputFloor">
            </div>
        </c:if>

        <c:if test="${service.getFreeService() != null}">
            <div class="col-12">
                <label for="inputFreeService" class="form-label">Free service:</label>
                <input type="text" name="freeService" value="${service.getFreeService()}" class="form-control"
                       id="inputFreeService">
            </div>
        </c:if>

        <div class="col-12">
            <label for="inputIdRenting" class="form-label">Type of renting:</label>
            <select name="idRenting" id="inputIdRenting" class="form-select">
                <option selected>Choose...</option>
                <c:forEach var="renting" items="${rentingList}">
                    <option value="${renting.getId()}">
                            ${renting.getRentingName()}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="col-12">
            <label for="inputServiceType" class="form-label">Type of service:</label>
            <select name="serviceType" id="inputServiceType" class="form-select">
                <option selected>Choose...</option>
                <c:forEach var="type" items="${serviceType}">
                    <option value="${type.getId()}">
                            ${type.getTypeName()}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="col-12 mt-3 text-center">
            <button type="submit" class="btn btn-primary">Save</button>
            <a href="/Service?action=showAll" class="btn btn-secondary mx-3 text-white text-decoration-none">Service
                list</a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>

