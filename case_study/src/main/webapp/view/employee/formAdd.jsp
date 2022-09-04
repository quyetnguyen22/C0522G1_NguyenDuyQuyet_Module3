<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/8/2022
  Time: 4:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<div class="container col-12">
    <h3 class="text-center">Add new employee</h3>
</div>

<div class="container border border-primary w-50">
    <form class="g-3" action="/Employee?action=add" method="post">
        <div class="col-12">
            <label for="inputName" class="form-label">Name:</label>
            <input type="text" name="employeeName" class="form-control" id="inputName">
        </div>

        <div class="col-12">
            <label for="inputBirthday" class="form-label">Date of birth:</label>
            <input type="date" name="employeeBirthday" class="form-control" id="inputBirthday">
        </div>

        <div class="col-12">
            <label for="inputIdNum" class="form-label">ID number:</label>
            <input type="text" name="employeeIdNum" class="form-control" id="inputIdNum">
        </div>

        <div class="col-12">
            <label for="inputPhoneNum" class="form-label">Phone number:</label>
            <input type="text" name="employeePhone" class="form-control" id="inputPhoneNum">
        </div>

        <div class="col-12">
            <label for="inputEmail" class="form-label">Email:</label>
            <input type="text" name="employeeEmail" class="form-control" id="inputEmail" placeholder="acb@gmail.com">
        </div>

        <div class="col-12">
            <label for="inputSalary" class="form-label">Salary:</label>
            <input type="text" name="employeeSalary" class="form-control" id="inputSalary">
        </div>

        <div class="col-12">
            <label for="inputAddress" class="form-label">Address</label>
            <input type="text" name="employeeAddress" class="form-control" id="inputAddress" placeholder="1234 Main St">
        </div>

        <div class="col-12">
            <label for="inputPosition" class="form-label">Position</label>
            <select name="employeePosition" id="inputPosition" class="form-select">
                <option selected>Choose...</option>
                <c:forEach var="position" items="${positionName}">
                    <option value="${position.getId()}">
                            ${position.getPositionName()}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="col-12">
            <label for="inputEduLevel" class="form-label">Education Level</label>
            <select name="employeeEduLevel" id="inputEduLevel" class="form-select">
                <option selected>Choose...</option>
                <c:forEach var="eduLevel" items="${eduLevelName}">
                    <option value="${eduLevel.getId()}">
                            ${eduLevel.getEduLevelName()}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="col-12">
            <label for="inputDepartment" class="form-label">Department</label>
            <select name="employeeDepartment" id="inputDepartment" class="form-select">
                <option selected>Choose...</option>
                <c:forEach var="department" items="${departmentName}">
                    <option value="${department.getId()}">
                            ${department.getDepartmentName()}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="col-12 mt-3 text-center">
            <button type="submit" class="btn btn-primary">Save
            </button>
            <a href="/Employee?action=showAll" class="btn btn-secondary mx-3 text-white text-decoration-none">Employee
                list</a>
        </div>
<%--        <input type="text" hidden data-bs-toggle="modal" data-bs-target="#informAdded">--%>
    </form>

</div>
<%--inform--%>
<form>
    <div class="modal fade" id="informAdded" tabindex="-1" aria-labelledby="exampleModal" aria-hidden="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModal">Added</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <span>${mess}!</span>
                </div>
                <div class="modal-footer">
                    <button type="submit" name="action" value="add" class="btn btn-primary" data-bs-dismiss="modal">
                        Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
