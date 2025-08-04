<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
  <tr>
    <th>Category</th>
    <th>Total Amount</th>
  </tr>
  <c:forEach var="item" items="${list}">
    <tr>
      <td>${item.category}</td>
      <td>₹${item.amount}</td>
    </tr>
  </c:forEach>
</table>
	
</body>
</html>