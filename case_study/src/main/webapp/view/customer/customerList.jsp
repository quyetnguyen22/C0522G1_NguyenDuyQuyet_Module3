<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/9/2022
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css"/>

</head>
<body>

<div class="container col-12">
    <h3 class="text-center"><a href="/Customer?action=showAll" class="text-black text-decoration-none">Customer List</a>
    </h3>
</div>

<div class="container">
    <div class="col-12 text-center">
        <a href="index.jsp" class="text-white text-decoration-none">
            <button class="btn btn-primary btn-sm w-25">Home</button>
        </a>
    </div>

    <table id="customerTable" class="table table-striped table-bordered" style="width: 100%">
        <thead>
        <tr>
            <th>Series</th>
            <th>Name</th>
            <th>Gender</th>
            <th>Date of birth</th>
            <th>Phone number</th>
            <th>Email</th>
            <th>Address</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="serises" var="customer" items="${customerList}">
            <tr>
                <td>${serises.count}</td>
                <td><a href="/Customer?action=showById&id=${customer.getId()}"
                       class="text-decoration-none text-black">${customer.getCustomerName()}</a></td>
                <c:if test="${customer.getCustomerGender() == 0}">
                    <td>Female</td>
                </c:if>
                <c:if test="${customer.getCustomerGender() == 1}">
                    <td>Male</td>
                </c:if>
                <td>${customer.getCustomerBirthday()}</td>
                <td>${customer.getCustomerPhone()}</td>
                <td>${customer.getCustomerEmail()}</td>
                <td>${customer.getCustomerAddress()}</td>
                <td>
                    <a class="text-decoration-none text-white btn btn-primary btn-sm"
                       href="/Customer?action=edit&id=${customer.getId()}">
                        Edit
                    </a>

                </td>
                <td>
                    <button onclick="idDelete('${customer.getId()}', '${customer.getCustomerName()}')"
                            class="text-white btn btn-danger btn-sm" data-bs-toggle="modal"
                            data-bs-target="#deleteModal">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

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

<script>
    function idDelete(idDel, name) {
        document.getElementById("idDelete").value = idDel;
        document.getElementById("nameDelete").innerHTML = name;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#customerTable').dataTable({
            // "dom": 'ltip', // an thanh tim kiem
            "lengthChange": true,
            // "pageLength": 10
        });
    });
</script>
</body>
</html>
