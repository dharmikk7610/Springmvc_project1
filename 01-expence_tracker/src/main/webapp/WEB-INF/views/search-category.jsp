<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Search by Category</title>
    <style>
    /* Base Reset and Font */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
        background: linear-gradient(to right, #f4f7f8, #dde9f2);
        padding: 40px;
        color: #333;
    }

    h2, h3 {
        text-align: center;
        margin-bottom: 25px;
        color: #2c3e50;
    }

    /* Form Styling */
    form {
        background-color: #ffffff;
        padding: 25px 30px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        margin: 0 auto;
    }

    label {
        display: block;
        margin-top: 15px;
        margin-bottom: 8px;
        font-weight: 600;
    }

    select, input[type="text"] {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 8px;
        background-color: #f9f9f9;
        font-size: 16px;
        transition: border 0.3s ease;
    }

    select:focus, input:focus {
        border-color: #007bff;
        outline: none;
    }

    .hidden {
        display: none;
    }

    button[type="submit"] {
        margin-top: 20px;
        background-color: #007bff;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        width: 100%;
    }

    button[type="submit"]:hover {
        background-color: #0056b3;
    }

    /* Table Styling */
    table {
        margin: 30px auto;
        border-collapse: collapse;
        width: 90%;
        background-color: #fff;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 16px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #007bff;
        color: white;
        font-weight: 600;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    p {
        text-align: center;
        margin-top: 30px;
        font-size: 18px;
        color: #555;
    }
    
    .top-bar {
    display: flex;
    justify-content: flex-start;
    margin-bottom: 30px;
}

.back-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #28a745;
    color: #fff;
    text-decoration: none;
    border-radius: 8px;
    font-weight: 600;
    transition: background-color 0.3s ease;
}

.back-button:hover {
    background-color: #218838;
}
    

    /* Responsive */
    @media (max-width: 600px) {
        form, table {
            width: 95%;
        }

        th, td {
            font-size: 14px;
        }
    }
</style>

    <script>
        function handleCategoryChange() {
            var select = document.getElementById("category");
            var otherInputDiv = document.getElementById("other-category-input");
            if (select.value === "Other") {
                otherInputDiv.style.display = "block";
            } else {
                otherInputDiv.style.display = "none";
            }
        }
    </script>
</head>
<body>
<h2>Search Expenses by Category</h2>

<form action="listcategory" method="post">
    <label for="category">Category:</label>
    <select id="category" name="category" onchange="handleCategoryChange()" required>
        <option value="">--Select Category--</option>
        <option value="Food">Food</option>
        <option value="Travel">Travel</option>
        <option value="Bills">Bills</option>
        <option value="Shopping">Shopping</option>
        <option value="Other">Other</option>
    </select>

    <div id="other-category-input" class="hidden">
        <label for="customCategory">Enter Custom Category:</label>
        <input type="text" id="customCategory" name="category" placeholder="e.g., Donation">
    </div>

    <button type="submit">Search</button>
</form>

<div class="top-bar">
    <a href="/userdashboard" class="back-button">← Back to Home</a>

</div>

<c:if test="${not empty expenses}">
    <h3>Results:</h3>
    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
               <th>Category</th>
            <th>Amount</th>
            <th>Date</th>
        </tr>
        <c:forEach var="expense" items="${expenses}">
            <tr>
                <td>${expense.id}</td>
                <td>${expense.title}</td>
                <td>${expense.category}</td>
                <td>${expense.amount}</td>
                <td>${expense.date}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<c:if test="${empty expenses}">
    <p>No expenses found for the selected category.</p>
</c:if>

</body>
</html>
