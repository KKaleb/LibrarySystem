<!DOCTYPE html>
<html>
<head>
		<?php include('includes/header.php') ?>
        <?php 
        // session_start();
        // if(isset($_SESSION['login_id'])){
        //     header('Location:home.php');
        // }
        ?>
		<title>Register |Library Management System</title>
	</head>

    <style>
        body {
        background-color: white;
        height: 96vh;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
    }
    </style>


    <body id='login-body' class="bg-light">
    		<div class="card col-md-4 offset-md-4 mt-4">
                <div class="card-header-edge text-white">
                    <strong>Register</strong>
                </div>
            <div class="card-body">
                     <form action="register.php" method="post">
                        <div class="form-group">
                            <label>Username:</label>
                            <input type="text"  class="form-control" name="username" size="15" maxlength="20" value="<?php if
 (isset($_POST['username'])) echo $_POST['username']; ?>" />
                        </div>
                        <div class="form-group">
                            <label>Full Name:</label>
                            <input type="text"  class="form-control" name="name" size="15" maxlength="40" value="<?php if
 (isset($_POST['name'])) echo $_POST['name']; ?>" />
                        </div> 

                        <div class="form-group">
                            <label>Email Address:</label>
                            <input type="text" class="form-control" name="email" size="20" maxlength="60" value="<?php if
 (isset($_POST['email'])) echo $_POST['email']; ?>"		/>
                        </div> 

                        <div class="form-group">
                            <label>Password:</label>
                            <input type="password" class="form-control" name="password" size="10" maxlength="20" value="<?php if
 (isset($_POST['password'])) echo $_POST['password']; ?>"		/>
                        </div> 

                        <div class="form-group">
                            <label>Confirm Password:</label>
                            <input type="password" class="form-control" name="pass2" size="10" maxlength="20"
 value="<?php if (isset($_POST['pass2'])) echo $_POST['pass2']; ?>"		/>
                        </div> 


                        <div class="form-group text-right">
                            <button class="btn btn-primary btn-block" type="submit" name="signup-btn">Register</button>
                        </div>

                        <a href="login.php" class="list-group-item list-group-item-action nav-books waves-effect">
          <i class="fas fa-users mr-3"></i>Login
        </a>

                        
                    </form>
            </div>
        </div>

		</body>
      </html>

      <?php
session_start();
$username = "";
$email = "";
$name = "";
$password = "";
$errors = [];

$conn = new mysqli('localhost', 'root', '', 'lms_db');

// SIGN UP USER
if (isset($_POST['signup-btn'])) {
    if (empty($_POST['username'])) {
        $errors['username'] = 'Username is required';
    }
    if (empty($_POST['name'])) {
        $errors['name'] = 'Full is required';
    }
    if (empty($_POST['email'])) {
        $errors['email'] = 'Email required';
    }
    if (empty($_POST['password'])) {
        $errors['password'] = 'Password required';
    }
    if (isset($_POST['password']) && $_POST['password'] !== $_POST['pass2']) {
        $errors['pass2'] = 'The two passwords do not match';
    }

    $username = $_POST['username'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    // $token = bin2hex(random_bytes(50)); // generate unique token
    $password = ($_POST['password']); //encrypt password

    // Check if email already exists
    $sql = "SELECT * FROM users WHERE email='$email' LIMIT 1";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) > 0) {
        $errors['email'] = "Email already exists";
    }

    if (count($errors) === 0) {
        $query = "INSERT INTO users SET username=?, email=?, name=?, password=?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('ssss', $username, $email, $name, $password);
        $result = $stmt->execute();

        if ($result) {
            $user_id = $stmt->insert_id;
            $stmt->close();


            $_SESSION['username'] = $username;
            $_SESSION['email'] = $email;
            $_SESSION['message'] = 'You are logged in!';
            $_SESSION['type'] = 'alert-success';
            header('location: index.php?page=home&title=home');
        } else {
            $_SESSION['error_msg'] = "Database error: Could not register user";
        }
    }
}

