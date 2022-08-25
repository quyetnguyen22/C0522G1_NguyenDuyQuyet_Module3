<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 8/25/2022
  Time: 2:23 PM
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
<a href="/product">Back</a>
<form action="/product?action=add" method="post">
    <pre>ID:            <input type="text" name="id"/></pre>
    <pre>Name:          <input type="text" name="name"> </pre>
    <pre>Price :        <input type="number" name="price" value="true"></pre>
    <pre>Description:   <input type="text" name="desc"> </pre>
    <pre>Producer:      <input type="text" name="producer"></pre>
    <pre>               <button>Add</button></pre>
</form>
<c:if test="${mess != null}">
    <span class="text-success">${mess}</span>
</c:if>
</body>
</html>
