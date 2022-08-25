<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 8/24/2022
  Time: 1:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Simple Calculator</h1>
<fieldset>
    <legend>Calculator</legend>
    <form action="/calculator" method="post">
        <label for="firstOperand">First Operand:</label>
        <input type="number" name="firstNum" placeholder="input the first number" id="firstOperand">
        <br>
        <label for="Operand">Operand:</label>
        <select name="operand" id="Operand">
            <option value="+">Addition(+)</option>
            <option value="-">Subtraction(-)</option>
            <option value="*">Multiplication(*)</option>
            <option value="/">Division(/)</option>
        </select>
        <br>
        <label for="secondOperand">First Operand:</label>
        <input type="number" name="secondNum" placeholder="input the second number" id="secondOperand">
        <br>
        <button type="submit">Calculator</button>
    </form>
</fieldset>
</body>
</html>
