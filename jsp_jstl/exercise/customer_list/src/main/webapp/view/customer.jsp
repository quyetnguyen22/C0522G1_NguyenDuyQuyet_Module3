
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 8/24/2022
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<h1 class="text-center">Danh sách khách hàng</h1>
<table class="table table-striped align-middle text-center">
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa Chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${customerList}">
    <tr>
        <td>${customer.getName()}</td>
        <td>${customer.getDateOfBirth()}</td>
        <td>${customer.getAddress()}</td>
        <td><img width="15%" height="15%" src="${customer.getImage()}"></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
