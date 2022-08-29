<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/8/2022
  Time: 9:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<form >
    <input type="text" name="searchInfo">
    <button type="submit" name="action" value="search">Search</button>
</form>
<h3 class="text-center">List Of Users</h3>
<table class="table table-striped">
    <tr>
        <th>Series</th>
        <th><a class="text-decoration-none" href="/users?action=order">Name</a></th>
        <th>Email</th>
        <th>Country</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach varStatus="serises" var="user" items="${user}">
        <tr>
            <td>${serises.count}</td>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td>
                <button class="text-white btn btn-primary btn-sm"><a class="text-decoration-none text-white" href="/users?action=edit&id=${user.getId()}">Edit</a></button>
            </td>
            <td>
                <button onclick="idDelete('${user.getId()}', '${user.getName()}')" class="text-white btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
</table>

<form>
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input hidden type="text" name="id" id="idDelete">
                <p>Are you sure that you want to delete <span style="color: red" id="nameDelete"></span>?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button name="action" value="delete" type="submit" class="btn btn-danger">Yes
                </button>
            </div>
        </div>
    </div>
</div>
</form>
<button type="button" class="btn btn-primary"><a class="text-white text-decoration-none" href="/users?action=create">Create
    New User</a></button>

<script>
    function idDelete(idDel, name) {
        document.getElementById("idDelete").value = idDel;
        document.getElementById("nameDelete").innerHTML = name;
    }
</script>
</body>
</html>
