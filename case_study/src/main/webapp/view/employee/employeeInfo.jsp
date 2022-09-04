<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/9/2022
  Time: 4:03 PM
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
<table class="table table-striped table-bordered container w-25">
    <tr>
        <th colspan="2" style="text-align: center">${employee.getEmployeeName()}</th>
    </tr>
    <tr>
        <th>Birthday</th>
        <td>${employee.getEmployeeBirthday()}</td>
    </tr>
    <tr>
        <th>ID number</th>
        <td>${employee.getEmployeeIdNumber()}</td>
    </tr>
    <tr>
        <th>Phone number</th>
        <td>${employee.getEmployeePhone()}</td>
    </tr>
    <tr>
        <th>Email</th>
        <td>${employee.getEmployeeEmail()}</td>
    </tr>
    <tr>
        <th>Salary</th>
        <td>${employee.getEmployeeSalary()}</td>
    </tr>
    <tr>
        <th>Address</th>
        <td>${employee.getEmployeeAddress()}</td>
    </tr>
    <tr>
        <th>Position</th>
        <c:if test="${employee.getEmployeePositionCode() == 1}">
            <td>Quản lý</td>
        </c:if>
        <c:if test="${employee.getEmployeePositionCode() == 2}">
            <td>Nhân viên</td>
        </c:if>
    </tr>
    <tr>
        <th>Education level</th>
        <c:if test="${employee.getEmployeeEduLevelCode() == 1}">
            <td>Trung Cấp</td>
        </c:if>
        <c:if test="${employee.getEmployeeEduLevelCode() == 2}">
            <td>Cao Đẳng</td>
        </c:if>
        <c:if test="${employee.getEmployeeEduLevelCode() == 3}">
            <td>Đại Học</td>
        </c:if>
        <c:if test="${employee.getEmployeeEduLevelCode() == 4}">
            <td>Sau Đại Học</td>
        </c:if>
    </tr>
    <tr>
        <th>Department</th>
        <c:if test="${employee.getEmployeeDepartmentCode() == 1}">
            <td>Sale-Marketing</td>
        </c:if>
        <c:if test="${employee.getEmployeeDepartmentCode() == 2}">
            <td>Hành chính</td>
        </c:if>
        <c:if test="${employee.getEmployeeDepartmentCode() == 3}">
            <td>Phục vụ</td>
        </c:if>
        <c:if test="${employee.getEmployeeDepartmentCode() == 4}">
            <td>Quản lý</td>
        </c:if>
    </tr>
    <th colspan="2" style="text-align: center"><a href="/Employee?action=showAll"
                                                  class="text-decoration-none text-white btn btn-primary btn-sm">Back</a>
    </th>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
