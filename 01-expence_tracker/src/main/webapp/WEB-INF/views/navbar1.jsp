<%@page import="com.Bean.user"%>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Tracker</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .navbar-custom {
        background: linear-gradient(135deg, #3a8fd3, #1d3557);
        padding: 12px 20px;
    }

    .navbar-custom .navbar-brand {
        color: #ffffff;
        font-weight: 700;
        font-size: 22px;
    }

    .navbar-custom .nav-link {
        color: #f1f1f1;
        font-weight: 500;
        transition: 0.3s;
    }

    .navbar-custom .nav-link:hover,
    .navbar-custom .nav-link.active {
        color: #ffd166;
    }

    .navbar-custom .dropdown-toggle {
        background-color: transparent;
        border: none;
        color: #ffffff;
        font-weight: bold;
    }

    .navbar-custom .dropdown-menu {
        background-color: #f8f9fa;
    }

    .navbar-custom .dropdown-menu a:hover {
        background-color: #e9ecef;
    }
</style>

</head>
<body>

<%
	user myuser = (user)session.getAttribute("user1"); 
%>
<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <i class="fa-solid fa-wallet"></i> Expense Tracker
        </a>

        <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon text-white"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp"><i class="fa-solid fa-plus-circle"></i> Add Expense</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">All Expenses</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="search-category.jsp">Search by Category</a>
                </li>

            </ul>

            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    ${user1.name}
                </button>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="<c:url value='logout' />">Logout</a></li>
                    <li><a class="dropdown-item" href="<c:url value='changepass?useremail=${user1.email}'/>">Forgot-Password</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>

</body>
</html>
