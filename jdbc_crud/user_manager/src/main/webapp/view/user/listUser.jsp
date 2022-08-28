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
<h3>List User</h3>

<table>
    <tr>
        <th>Series</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
    </tr>
    <c:forEach varStatus="serises" var="user" items="${user}">
        <tr>
            <td>${serises.count}</td>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td>
                <button><a href="/users?action=edit&id=${user.getId()}">Edit</a></button>
            </td>
            <td>
                <button class="text-white btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">
                    Delete
                </button>
            </td>
        </tr>
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure that you want to delete ?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-danger"><a class="text-decoration-none text-white"
                                                                        href="/user?action=delete&id=${user.getId()}">Yes</a>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</table>

<button type="button" class="btn btn-primary"><a class="text-white text-decoration-none" href="/product?action=add">Add
    New Product</a></button>

</body>
</html>
