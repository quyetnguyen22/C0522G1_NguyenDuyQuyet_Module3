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
    <link  href="bootstrap-5.2.0-dist/css/bootstrap-grid.min.css">
  </head>
  <body>
  <form action="/discount">
    <h5>Product Description:</h5>
    <input type="text" name="description">
    <h5>List Price:</h5>
    <input type="number" name="price">
    <h5>Discount Percent:</h5>
    <input type="number" name="discount">
    <br>
    <button type="submit">Discount</button>
  </form>
  </body>
</html>
