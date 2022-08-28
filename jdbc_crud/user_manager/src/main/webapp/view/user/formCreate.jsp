<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/8/2022
  Time: 9:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/UserList">Back Home</a>

<form action="/UserList?action=create" method="post" class="font-family-monospace">
    <fieldset>
        <legend>Create New User</legend>
<%--        <pre>ID:            <input type="text" name="id"/></pre>--%>
        <pre>Name:          <input type="text" name="name"> </pre>
        <pre>Email :        <input type="number" name="email"></pre>
        <pre>Country:   <input type="text" name="country"> </pre>
        <pre>               <button type="submit">Save</button></pre>
    </fieldset>
</form>
<c:if test="mess == null">
    <p>${mess}</p>
</c:if>
</body>
</html>
