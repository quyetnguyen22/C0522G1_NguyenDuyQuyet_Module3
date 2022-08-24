<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 8/23/2022
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link href="bootstrap-5.2.0-dist/css/bootstrap.css">
  </head>
  <body>
  <form action="/discount" method="get">
    <div class="mb-3">
    <label for="Description" class="form-label">Product Description:</label>
    <input type="text" class="form-control" id="Description" name="description">
    </div>
    <div class="mb-3">
    <label for="Price" class="form-label">List Price:</label>
    <input type="number" name="price" class="form-control" id="Price">
    </div>
    <div class="mb-3">
    <label for="Discount" class="form-label">Discount Percent:</label>
    <input type="number" name="discount" class="form-control" id="Discount">
    </div>
    <br>
    <button type="submit" class="btn btn-primary">Discount</button>
  </form>
  </body>
</html>
