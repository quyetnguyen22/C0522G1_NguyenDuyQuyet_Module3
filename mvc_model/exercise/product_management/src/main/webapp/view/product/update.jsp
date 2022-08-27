<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 8/26/2022
  Time: 9:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product">Back Home</a>

<form action="/product?action=update&id=${product.id}" method="post">
    <pre>ID:            <input type="text" name="id"/></pre>
    <pre>Name:          <input type="text" name="name"> </pre>
    <pre>Price :        <input type="number" name="price" value="true"></pre>
    <pre>Description:   <input type="text" name="desc"> </pre>
    <pre>Producer:      <input type="text" name="producer"></pre>
    <pre>               <button>Save</button></pre>
</form>

<c:if test="${mess != null}">
    <span class="text-success">${mess}</span>
</c:if>
</body>
</html>
