<%@page import="com.Bean.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String uotp = (String)session.getAttribute("uotp"); %>
<form action="verifyotp" method="post">
	 <input type="text" name="otp" placeholder="Enter OTP" required />
    <button type="submit">Verify</button>
</form>
</body>
</html>