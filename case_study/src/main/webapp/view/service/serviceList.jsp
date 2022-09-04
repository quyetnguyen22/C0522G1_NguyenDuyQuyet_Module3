<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/9/2022
  Time: 11:20 AM
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
    <h3 class="text-center"><a href="/Service?action=showAll" class="text-black text-decoration-none">Service List</a>
    </h3>
</div>

<div class="container">
    <div class="col-12 text-center mb-4">
        <a href="index.jsp" class="text-white text-decoration-none">
            <button class="btn btn-primary btn-sm w-25">Home</button>
        </a>
    </div>
    <form>
        <div class="row" style="--bs-gutter-x: 0">
            <div class="col-2">
                <input type="text" name="service" class="form-control form-control-sm" placeholder="Input service">
            </div>
            <div class="col-2 px-0">
                <input type="text" name="price" class="form-control form-control-sm"
                       placeholder="Input price">
            </div>
            <div class="col-2">
                <input type="text" name="capacity" class="form-control form-control-sm" placeholder="Input capacity">
            </div>
            <div class="px-0 col-1 text-center">
                <button type="submit" name="action" value="search" class="btn btn-secondary btn-sm">Search</button>
            </div>
        </div>
    </form>

    <table class="table table-striped table-bordered" id="serviceTable" style="width: 100%">
        <thead>
        <tr>
            <th>Series</th>
            <th>Name</th>
            <th>Area</th>
            <th>Price</th>
            <th>Capacity</th>
            <th>Standard</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="serises" var="service" items="${serviceList}">
            <tr>
                <td>${serises.count}</td>
                <td><a href="/Service?action=showById&id=${service.getId()}"
                       class="text-decoration-none text-black">${service.getServiceName()}</a>
                </td>
                <td>${service.getArea()}</td>
                <td>${service.getPrice()}</td>
                <td>${service.getCapacity()}</td>
                <td>${service.getStandard()}</td>
                <td>
                    <a class="text-decoration-none text-white btn btn-primary btn-sm"
                       href="/Service?action=edit&id=${service.getId()}">
                        Edit
                    </a>

                </td>
                <td>
                    <button onclick="idDelete('${service.getId()}', '${service.getServiceName()}')"
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
                    <button data-bs-toggle="modal" data-bs-target="#informDeleted" name="action" value="delete"
                            type="submit" class="btn btn-danger">Yes
                    </button>
                </div>
            </div>
        </div>
    </div>
    <%--inform--%>
    <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModal">Deleted</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>${mess} <span style="color: green">${employeeDel.getEmployeeName()}</span>!</p>
                </div>
                <div class="modal-footer">
                    <button type="submit" name="action" value="showAll" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</form>

<%--<div class="modal-body" id="info">--%>
<%--    <div class="container-fluid">--%>
<%--        <table>--%>
<%--            <tr>--%>
<%--                <th>Name</th>--%>
<%--                <td>${employee.getEmployeeName()}</td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>Birthday</th>--%>
<%--                <td>${employee.getEmployeeBirthday()}</td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </div>--%>
<%--    <div class="modal-footer">--%>
<%--        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
<%--        <button type="button" class="btn btn-primary">Save changes</button>--%>
<%--    </div>--%>
<%--</div>--%>
<script>
    function idDelete(idDel, name) {
        document.getElementById("idDelete").value = idDel;
        document.getElementById("nameDelete").innerHTML = name;
    }
</script>

<%--<script>--%>
<%--    const myModal = document.getElementById('informDeleted')--%>
<%--    myModal.addEventListener('hidden.bs.modal', event => {--%>
<%--        myModal.hide();// do something...--%>
<%--    });--%>
<%--</script>--%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

<script>
    $(document).ready(function () {
        $('#serviceTable').dataTable({
            dom: 'ltip', // an thanh tim kiem
            lengthChange: false,
            pageLength: 10
        });
    });
</script>

</body>
</html>
