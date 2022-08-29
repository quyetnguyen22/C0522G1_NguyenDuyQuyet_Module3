<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/8/2022
  Time: 9:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/users">Back Home</a>

<form action="/users?action=edit&id=${id}" method="post" class="font-family-monospace">
    <fieldset>
        <legend>Create New User</legend>
        <pre>Name:          <input type="text" name="name"> </pre>
        <pre>Email :        <input type="text" name="email"></pre>
        <pre>Country:       <input type="text" name="country"> </pre>
        <pre>               <button type="submit">Save</button></pre>
    </fieldset>
</form>
<c:if test="mess == null">
    <p>${mess}</p>
</c:if>
</body>
</html>
