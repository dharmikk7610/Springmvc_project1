<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f6f9;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .signup-container {
      background-color: #fff;
      padding: 40px 30px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
      width: 100%;
      max-width: 400px;
    }

    .signup-container h2 {
      text-align: center;
      margin-bottom: 25px;
      color: #2b6cb0;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: bold;
      color: #333;
    }

    .form-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 14px;
    }

    .form-group input:focus {
      border-color: #2b6cb0;
      outline: none;
    }

    .submit-btn {
      width: 100%;
      padding: 12px;
      background-color: #2b6cb0;
      color: white;
      font-size: 16px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }

    .submit-btn:hover {
      background-color: #225c9e;
    }

    .login-link {
      text-align: center;
      margin-top: 15px;
      font-size: 14px;
    }

    .login-link a {
      color: #2b6cb0;
      text-decoration: none;
    }

    .login-link a:hover {
      text-decoration: underline;
    }
  </style>
<body>
	 <div class="signup-container">
    <h2>Create Account</h2>
    <form action="signupdata" method="POST">
      <div class="form-group">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" placeholder="John Doe" required />
      </div>

      <div class="form-group">
        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" placeholder="you@example.com" required />
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter password" required />
      </div>

      <button type="submit" class="submit-btn">Sign Up</button>
    </form>

    <div class="login-link">
      Already have an account? <a href="login">Login</a>
    </div>
  </div>
	
</body>
</html>