<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/9/2022
  Time: 4:39 PM
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
    <h3 class="text-center">Add new customer</h3>
</div>

<div class="container border border-primary w-50">
    <form class="g-3" action="/Customer?action=add" method="post">
        <div class="col-12">
            <label for="inputName" class="form-label">Name:</label>
            <input type="text" name="customerName" class="form-control" id="inputName">
        </div>
        <%--id,name,birthday,gender,idNum,phone,email,address,rankId--%>
        <div class="col-12">
            <label for="inputBirthday" class="form-label">Date of birth:</label>
            <input type="date" name="customerBirthday" class="form-control" id="inputBirthday">
        </div>

        <div>
            <label>Gender:</label> <br>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gender" id="maleId" value="1">
                <label class="form-check-label" for="maleId">
                    Male
                </label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gender" value="0" id="femaleId" checked>
                <label class="form-check-label" for="femaleId">
                    Female
                </label>
            </div>
        </div>

        <div class="col-12">
            <label for="inputIdNum" class="form-label">ID number:</label>
            <input type="text" name="customerIdNum" class="form-control" id="inputIdNum">
        </div>

        <div class="col-12">
            <label for="inputPhoneNum" class="form-label">Phone number:</label>
            <input type="text" name="customerPhone" class="form-control" id="inputPhoneNum">
        </div>

        <div class="col-12">
            <label for="inputEmail" class="form-label">Email:</label>
            <input type="text" name="customerEmail" class="form-control" id="inputEmail" placeholder="acb@gmail.com">
        </div>

        <div class="col-12">
            <label for="inputAddress" class="form-label">Address:</label>
            <input type="text" name="customerAddress" class="form-control" id="inputAddress" placeholder="1234 Main St">
        </div>

        <div class="col-12">
            <label for="inputRank" class="form-label">Rank:</label>
            <select name="customerRank" id="inputRank" class="form-select">
                <option selected>Choose...</option>
                <c:forEach var="rank" items="${rankName}">
                    <option value="${rank.getRankId()}">
                            ${rank.getRankName()}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="col-12 mt-3 text-center">
            <button type="submit" class="btn btn-primary">Save</button>
            <a href="/Customer?action=showAll" class="btn btn-secondary mx-3 text-white text-decoration-none">Customer list</a>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
