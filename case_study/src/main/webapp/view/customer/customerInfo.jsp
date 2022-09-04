<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/9/2022
  Time: 5:40 PM
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
        <th colspan="2" style="text-align: center">${customer.getCustomerName()}</th>
    </tr>
    <tr>
        <th>Birthday</th>
        <td>${customer.getCustomerBirthday()}</td>
    </tr>
    <tr>
        <th>Gender</th>
            <c:if test="${customer.getCustomerGender()==1}">
        <td>Male</td>
            </c:if>
        <c:if test="${customer.getCustomerGender()==0}">
            <td>Female</td>
        </c:if>
    </tr>
    <tr>
        <th>ID number</th>
        <td>${customer.getCustomerIdNum()}</td>
    </tr>
    <tr>
        <th>Phone Number</th>
        <td>${customer.getCustomerPhone()}</td>
    </tr>
    <tr>
        <th>Email</th>
        <td>${customer.getCustomerEmail()}</td>
    </tr>
    <tr>
        <th>Address</th>
        <td>${customer.getCustomerAddress()}</td>
    </tr>
    <tr>
        <th>Education level</th>
        <c:if test="${customer.getCustomerRankId() == 1}">
            <td>Diamond</td>
        </c:if>
        <c:if test="${customer.getCustomerRankId() == 2}">
            <td>Platinum</td>
        </c:if>
        <c:if test="${customer.getCustomerRankId() == 3}">
            <td>Gold</td>
        </c:if>
        <c:if test="${customer.getCustomerRankId() == 4}">
            <td>Silver</td>
        </c:if>
        <c:if test="${customer.getCustomerRankId() == 5}">
            <td>Member</td>
        </c:if>
    </tr>
    <th colspan="2" style="text-align: center"><a href="/Customer?action=showAll"
                                                  class="text-decoration-none text-white btn btn-primary btn-sm">Back</a>
    </th>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
