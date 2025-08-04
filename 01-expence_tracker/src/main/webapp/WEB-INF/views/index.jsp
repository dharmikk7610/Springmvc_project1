<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: Arial, sans-serif;
      background-color: #f3f3f3;
    }

    .navbar {
      background-color: #ffffff;
      padding: 15px 30px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .navbar-brand {
      font-size: 24px;
      color: #2b6cb0;
      font-weight: bold;
    }

    .navbar-links {
      display: flex;
      gap: 25px;
    }

    .navbar-links a {
      text-decoration: none;
      color: #333;
      font-size: 16px;
      transition: color 0.3s ease;
    }

    .navbar-links a:hover {
      color: #2b6cb0;
    }

    .navbar-actions {
      display: flex;
      align-items: center;
      gap: 15px;
    }

    .add-btn {
      background-color: #2b6cb0;
      color: white;
      padding: 8px 16px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .add-btn:hover {
      background-color: #225c9e;
    }

    .avatar {
      width: 35px;
      height: 35px;
      border-radius: 50%;
      border: 2px solid #2b6cb0;
    }
     .banner {
      background: linear-gradient(to right, #2563eb, #1d4ed8);
      color: white;
      padding: 50px 30px;
      border-radius: 15px;
      text-align: center;
      margin-bottom: 40px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }
    .banner h1 {
      font-size: 42px;
      margin-bottom: 15px;
    }
    .banner p {
      font-size: 18px;
    }
    .cta-btn {
      margin-top: 20px;
      padding: 12px 30px;
      background-color: #facc15;
      border: none;
      font-size: 16px;
      font-weight: bold;
      color: #000;
      border-radius: 8px;
      cursor: pointer;
    }
    .features {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 25px;
      margin-bottom: 40px;
    }
    .tile {
      background: white;
      padding: 25px;
      border-left: 6px solid #3b82f6;
      border-radius: 10px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }
    .tile h3 {
      font-size: 20px;
      margin-bottom: 10px;
    }
    .tile p {
      font-size: 14px;
      color: #666;
    }
    .dashboard-section {
      margin-bottom: 50px;
    }
    .dashboard-section h2 {
      font-size: 24px;
      margin-bottom: 20px;
    }
    .dashboard-cards {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
    }
    .card {
      flex: 1;
      min-width: 200px;
      background: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 1px 5px rgba(0,0,0,0.08);
      text-align: center;
    }
    .card h4 {
      font-size: 16px;
      margin-bottom: 8px;
      color: #2563eb;
    }
    .card p {
      font-size: 18px;
      font-weight: bold;
    }
    .tips {
      background: #e0f2fe;
      padding: 30px;
      border-radius: 12px;
      margin-bottom: 40px;
    }
    .tips h2 {
      font-size: 22px;
      margin-bottom: 15px;
    }
    .tips ul {
      padding-left: 20px;
    }
    .tips li {
      font-size: 15px;
      margin-bottom: 10px;
    }
    .recent {
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      margin-bottom: 40px;
      box-shadow: 0 1px 4px rgba(0,0,0,0.1);
    }
    .recent h2 {
      margin-bottom: 20px;
    }
    .transaction-list {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }
    .txn {
      display: flex;
      justify-content: space-between;
      padding: 10px 20px;
      background: #f9fafb;
      border-left: 5px solid #60a5fa;
      border-radius: 6px;
      font-size: 16px;
    }
    .goals {
      background: #fef3c7;
      padding: 30px;
      border-radius: 10px;
      margin-bottom: 40px;
    }
    .goals h2 {
      margin-bottom: 20px;
    }
    .goal {
      margin-bottom: 20px;
    }
    .goal span {
      font-weight: bold;
    }
    .bar-container {
      background: #e5e7eb;
      border-radius: 5px;
      overflow: hidden;
      height: 12px;
      margin: 8px 0;
    }
    .bar {
      height: 12px;
    }
    .goal p {
      font-size: 14px;
    }
    .quote {
      background: #ecfdf5;
      border-left: 6px solid #10b981;
      padding: 20px 30px;
      font-style: italic;
      border-radius: 10px;
      box-shadow: 0 1px 3px rgba(0,0,0,0.05);
    }
    .quote cite {
      display: block;
      margin-top: 10px;
      text-align: right;
      font-style: normal;
      font-weight: bold;
    }
   

    @media (max-width: 768px) {
      .navbar-links {
        display: none;
      }
    }
  </style>
<body>
  <nav class="navbar">
    <div class="navbar-brand">ExpenseTracker</div>
    <div class="navbar-links">
      <a href="#">Dashboard</a>
      <a href="#">Transactions</a>
      <a href="login">Login</a>
      <a href="signup">Signup</a>
    </div>
    <div class="navbar-actions">
      <button class="add-btn">Add Expense</button>
      <img src="https://i.pravatar.cc/35" alt="User Avatar" class="avatar" />
    </div>
  </nav>
  <div class="banner">
    <h1>Welcome to Your Expense Tracker 🧾</h1>
    <p>Manage your budget, control spending, and plan smartly — all in one place.</p>
    <button class="cta-btn">+ Add New Expense</button>
  </div>

  <section class="features">
    <div class="tile">
      <h3>📥 Add Expense</h3>
      <p>Log your daily spending in seconds and keep things organized.</p>
    </div>
    <div class="tile">
      <h3>📈 View Reports</h3>
      <p>Visual charts and graphs for monthly insights and progress.</p>
    </div>
    <div class="tile">
      <h3>💰 Monthly Budget</h3>
      <p>Plan your limits and get alerts when you're close to overbudgeting.</p>
    </div>
    <div class="tile">
      <h3>🔍 Expense Categories</h3>
      <p>Group and monitor spending — Food, Travel, Bills, and more.</p>
    </div>
  </section>

  <section class="dashboard-section">
    <h2>Your Dashboard Summary</h2>
    <div class="dashboard-cards">
      <div class="card">
        <h4>Total Spent</h4>
        <p>₹24,800</p>
      </div>
      <div class="card">
        <h4>Top Category</h4>
        <p>Food & Dining</p>
      </div>
      <div class="card">
        <h4>Remaining Budget</h4>
        <p>₹5,200</p>
      </div>
    </div>
  </section>

  <section class="recent">
    <h2>🕒 Recent Transactions</h2>
    <div class="transaction-list">
      <div class="txn">
        <span>🍔 Food</span>
        <span>₹350</span>
      </div>
      <div class="txn">
        <span>🚌 Travel</span>
        <span>₹120</span>
      </div>
      <div class="txn">
        <span>📱 Recharge</span>
        <span>₹199</span>
      </div>
    </div>
  </section>

  <section class="goals">
    <h2>🎯 Monthly Spending Goals</h2>
    <div class="goal">
      <span>🏠 Rent</span>
      <div class="bar-container">
        <div class="bar" style="width: 90%; background: #16a34a;"></div>
      </div>
      <p>₹9,000 / ₹10,000</p>
    </div>
    <div class="goal">
      <span>🍽️ Food</span>
      <div class="bar-container">
        <div class="bar" style="width: 60%; background: #f59e0b;"></div>
      </div>
      <p>₹3,000 / ₹5,000</p>
    </div>
  </section>

  <section class="tips">
    <h2>💡 Smart Saving Tips</h2>
    <ul>
      <li>✔ Log every transaction, no matter how small.</li>
      <li>✔ Track subscriptions and cut unnecessary ones.</li>
      <li>✔ Create mini-budgets for weekly targets.</li>
      <li>✔ Review monthly summary to identify leaks.</li>
    </ul>
  </section>

  <section class="quote">
    <blockquote>“Do not save what is left after spending, but spend what is left after saving.”</blockquote>
    <cite>– Warren Buffett</cite>
  </section>
  
</body>
</html>