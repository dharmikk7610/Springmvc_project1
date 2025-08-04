<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recent Expenses</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

    <style>
        body {
            margin: 0;
            padding: 40px;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #2e004f, #3d1c82);
            color: #fff;
            overflow-x: hidden;
        }

        h2 {
            font-size: 32px;
            margin-bottom: 5px;
            font-weight: 700;
            text-shadow: 2px 2px #00000033;
        }

        .subtitle {
            font-size: 16px;
            color: #cccccc;
            margin-bottom: 30px;
        }

        .filters {
            display: flex;
            gap: 12px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .filters select, .filters input {
            padding: 10px 15px;
            border-radius: 10px;
            border: none;
            outline: none;
            background-color: #1c1c3a;
            color: #fff;
            font-size: 14px;
            transition: 0.3s ease;
            box-shadow: 0 0 5px #00000040;
        }

        .filters select:hover, .filters input:hover {
            background-color: #2e2e57;
        }

        .expense-card {
            background: linear-gradient(135deg, #3c176e, #48256a);
            border: 1px solid #4a2c75;
            border-radius: 16px;
            padding: 20px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: slideIn 0.5s ease forwards;
            opacity: 0;
        }

        .expense-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.4);
        }

        .expense-info {
            display: flex;
            flex-direction: column;
        }

        .expense-title {
            font-size: 20px;
            font-weight: 600;
        }

        .expense-meta {
            font-size: 14px;
            color: #aaa;
            display: flex;
            gap: 12px;
            margin-top: 6px;
            align-items: center;
        }

        .category-badge {
            background-color: #00c896;
            color: white;
            padding: 4px 12px;
            border-radius: 14px;
            font-size: 12px;
        }

        .expense-amount {
            font-size: 22px;
            font-weight: bold;
            color: #00ffb3;
        }

        .delete-icon {
            cursor: pointer;
            transition: transform 0.2s ease;
        }

        .delete-icon i {
            font-size: 24px;
            color: #ff4d4d;
            transition: color 0.3s, transform 0.3s;
        }

        .delete-icon i:hover {
            color: #ff0000;
            transform: scale(1.2);
        }

        @keyframes slideIn {
            from {
                transform: translateY(30px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Animate each card with delay */
        .expense-card:nth-child(1) { animation-delay: 0.1s; }
        .expense-card:nth-child(2) { animation-delay: 0.2s; }
        .expense-card:nth-child(3) { animation-delay: 0.3s; }
        .expense-card:nth-child(4) { animation-delay: 0.4s; }
        .expense-card:nth-child(5) { animation-delay: 0.5s; }
    </style>
</head>
<body>

    <h2>Recent Expenses</h2>
    <div class="subtitle">Your latest transactions</div>

    <div class="filters">
        <input type="text" placeholder="Search by title/category...">
        <select>
            <option disabled selected>Sort by</option>
            <option value="title">Title</option>
            <option value="category">Category</option>
            <option value="date">Date</option>
        </select>
    </div>

    <c:forEach items="${list}" var="l1">
        <div class="expense-card">
            <div class="expense-info">
                <div class="expense-title">${l1.title}</div>
                <div class="expense-meta">
                    <span class="category-badge">${l1.category}</span>
                    <span>📅 ${l1.date}</span>
                </div>
            </div>
            <div style="display: flex; align-items: center; gap: 15px;">
                <div class="expense-amount">₹${l1.amount}</div>
                <div class="delete-icon">
                    <a href="deleteUser?id=${l1.id}" >
                        <i class="bi bi-trash-fill"></i>
                    </a>
                </div>
            </div>
        </div>
    </c:forEach>

</body>
</html>
