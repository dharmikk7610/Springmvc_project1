<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Travel Group – Gujarat Trip</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
        }

        body {
            background-image: url('https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Rann_Utsav_2021.jpg/1200px-Rann_Utsav_2021.jpg'); /* Gujarat Tourism Image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            backdrop-filter: blur(5px);
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.6);
            height: 100%;
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
        }

        .form-box {
            position: relative;
            max-width: 600px;
            margin: 80px auto;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 12px;
            z-index: 10;
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #004d40;
        }

        label {
            display: block;
            margin: 12px 0 6px;
            font-weight: 500;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        .add-btn, .submit-btn {
            background-color: #0078d7;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 10px;
            font-size: 16px;
        }

        .remove-btn {
            background-color: #e53935;
            color: white;
            border: none;
            padding: 6px 12px;
            font-size: 14px;
            border-radius: 6px;
            margin-left: 10px;
            cursor: pointer;
        }

        .friend-input {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }

        .friend-input input {
            flex: 1;
        }

        @media screen and (max-width: 600px) {
            .form-box {
                margin: 20px;
            }
        }
    </style>

    <script>
        function addFriendInput() {
            const container = document.getElementById("friendsContainer");
            const div = document.createElement("div");
            div.className = "friend-input";
            div.innerHTML = `
                <input type="text" name="members" placeholder="Friend Name" required />
                <button type="button" class="remove-btn" onclick="this.parentElement.remove()">X</button>
            `;
            container.appendChild(div);
        }
    </script>
</head>
<body>
    <div class="overlay"></div>

    <div class="form-box">
        <h2>Plan Your  Trip</h2>
        <form action="createGroup" method="post">
            <label for="groupName">Group Name</label>
            <input type="text" name="groupName" id="groupName" placeholder="e.g. Trip to Rann of Kutch" required />

            <label>Friend Names</label>
            <div id="friendsContainer">
                <div class="friend-input">
                    <input type="text" name="membername" placeholder="Friend Name" required />
                </div>
            </div>

            <button type="button" class="add-btn" onclick="addFriendInput()">+ Add Another Friend</button>
            <button type="submit" class="submit-btn">Create Group</button>
        </form>
    </div>
</body>
</html>
