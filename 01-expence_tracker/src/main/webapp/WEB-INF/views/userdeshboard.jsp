<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert_title_here</title>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;800&display=swap" rel="stylesheet">
<style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(to right, #f8f9fa, #eef1f5);
            color: #333;
        }
        header {
            background: #4b6cb7;
            background: linear-gradient(to right, #182848, #4b6cb7);
            color: #fff;
            padding: 4rem 2rem;
            text-align: center;
        }
        header h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
        }
        header p {
            font-size: 1.25rem;
        }
        .section {
            padding: 3rem 2rem;
            max-width: 1200px;
            margin: auto;
        }
        .section-title {
            font-size: 2rem;
            text-align: center;
            margin-bottom: 2rem;
            color: #2c3e50;
        }
        .cards {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 2rem;
        }
        .card {
            background: white;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 10px;
            padding: 2rem;
            width: 300px;
            text-align: center;
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: translateY(-10px);
        }
        .card h3 {
            margin-bottom: 1rem;
            color: #4b6cb7;
        }
        .card p {
            color: #555;
            font-size: 0.95rem;
        }
        .btn {
            display: inline-block;
            margin-top: 1rem;
            padding: 0.6rem 1.2rem;
            background: #4b6cb7;
            color: #fff;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
        }
        .footer {
            background: #2c3e50;
            color: #fff;
            padding: 2rem;
            text-align: center;
        }
    </style>	

</head>
<body>
<c:if test="${empty user1}">
	<c:redirect url="login"></c:redirect>
</c:if>

<%@ include file="./navbar1.jsp" %>
 <header>
        <h1>Welcome to Your Expense Tracker</h1>
        <p>Track your spending, stay in control, and achieve your financial goals</p>
    </header>

    <section class="section">
        <h2 class="section-title">Manage Your Finances</h2>
      <div class="cards">
    <div class="card">
        <h3>Add Tracker</h3>
        <p>Quickly add your daily, weekly, or monthly expenses into the tracker.</p>
        <a href="/add-tracker" class="btn">Add Expense</a>
    </div>
    <div class="card">
        <h3>List Tracker</h3>
        <p>View a detailed list of all your past transactions in one place.</p>
        <a href="/list-tracker" class="btn">View List</a>
    </div>
    <div class="card">
        <h3>Search by Category</h3>
        <p>Filter your expenses by category to understand your spending habits.</p>
        <a href="/list-category" class="btn">Search</a>
    </div>
    <div class="card">
        <h3>View Graph</h3>
        <p>Visualize your expenses using a bar or pie chart based on category.</p>
        <a href="/chart" class="btn">View Chart</a>
    </div>
    <div class="card">
        <h3>Category by Amount</h3>
        <p>Check how much you’ve spent in each category directly.</p>
        <a href="/category-summary" class="btn">View Summary</a>
    </div>
</div>

    </section>

    <footer class="footer">
        <p>&copy; 2025 Expense Tracker | Designed with dedication</p>
    </footer>
    </body>
</html>