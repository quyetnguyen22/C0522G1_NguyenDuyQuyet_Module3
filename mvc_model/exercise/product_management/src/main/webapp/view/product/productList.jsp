<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 8/25/2022
  Time: 2:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<%--<a href="/product?action=showById">Search Product</a>--%>
<form >
    <input type="text" name="productName">
    <input name="action" type="submit" value="search">
</form>

<h1>Danh Sách Sản Phẩm</h1>
<%--id, tên sản phẩm, giá sản phẩm, mô tả của sản phẩm, nhà sản xuất--%>
<table class="table table-striped">
    <tr>
        <th>Series</th>
<%--        <th>ID</th>--%>
        <th>Product Name</th>
        <th>Product Price</th>
        <th>Description</th>
        <th>Producer</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    <c:forEach varStatus="series" var="product" items="${showAll}">
        <tr>
            <td>${series.count}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getProducer()}</td>
            <td><button class="btn btn-primary btn-sm"><a class="text-white text-decoration-none" href="">Update</a></button></td>
            <td><button class="btn btn-danger btn-sm"><a class="text-white text-decoration-none" href="/product?action=delete&id=${product.getId()}">Delete</a></button></td>
        </tr>
    </c:forEach>
</table>
<br>
<a href="/product?action=add">Add New Product</a>

</body>
</html>
