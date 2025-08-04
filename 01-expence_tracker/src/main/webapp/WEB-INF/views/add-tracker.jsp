<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(to right, #dfe9f3, #ffffff);
            color: #2c3e50;
        }
        header {
            background: linear-gradient(to right, #141e30, #243b55);
            padding: 3rem 2rem;
            text-align: center;
            color: #fff;
        }
        header h1 {
            font-size: 3rem;
        }
        .form-section {
            max-width: 600px;
            margin: 3rem auto;
            background: #fff;
            padding: 2.5rem 3rem;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }
        .form-section h2 {
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2rem;
            color: #34495e;
        }
        form label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
        }
        form input, form select {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1.5rem;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1rem;
        }
        .hidden {
            display: none;
        }
        .btn-submit {
            display: block;
            width: 100%;
            padding: 0.75rem;
            background-color: #4b6cb7;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-submit:hover {
            background-color: #3a58a4;
        }
        footer {
            margin-top: 3rem;
            text-align: center;
            padding: 1.5rem;
            background-color: #2c3e50;
            color: #fff;
        }
    </style>
    <script>
        function handleCategoryChange() {
            const categorySelect = document.getElementById("category");
            const otherInput = document.getElementById("other-category-input");
            if (categorySelect.value === "Other") {
                otherInput.classList.remove("hidden");
            } else {
                otherInput.classList.add("hidden");
            }
        }
    </script>

</head>
<body>  
	<c:if test="${empty user1}">
	<c:redirect url="login"></c:redirect>
</c:if>

 <header>
        <h1>Add New Expense</h1>
    </header>

    <section class="form-section">
        <h2>Expense Details</h2>
        <form action="save-expense" method="POST">
            <label for="title">Title</label>
            <input type="text" id="title" name="title" placeholder="e.g., Grocery shopping" required>

            <label for="date">Date</label>
            <input type="date" id="date" name="date" required>

            <label for="category">Category</label>
            <select id="category" name="category" onchange="handleCategoryChange()" required>
                <option value="">--Select Category--</option>
                <option value="Food">Food</option>
                <option value="Travel">Travel</option>
                <option value="Bills">Bills</option>
                <option value="Shopping">Shopping</option>
                <option value="Other">Other</option>
            </select>

            <div id="other-category-input" class="hidden">
                <label for="customCategory">Enter Custom Category</label>
                <input type="text" id="customCategory" name="category" placeholder="e.g., Donation">
            </div>

            <label for="amount">Amount</label>
            <input type="number" id="amount" name="amount" placeholder="e.g., 1000" required>
            
            <input type="hidden" name="userid" value="${user1.id}">

            <button type="submit" class="btn-submit">Add Expense</button>
        </form>
    </section>

    <footer>
        <p>&copy; 2025 Expense Tracker | Built with precision and care</p>
    </footer>
</body>
</html>