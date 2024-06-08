<?php
session_start();
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    if (!empty($email) && !empty($password)) {
        $email = mysqli_real_escape_string($conn, $email);

        $sql = "SELECT * FROM users WHERE email = '$email'";
        $result = mysqli_query($conn, $sql);

        if ($result) {
            if (mysqli_num_rows($result) === 1) {
                $user = mysqli_fetch_assoc($result);

                if (password_verify($password, $user['password'])) {
                    $_SESSION['user_id'] = $user['user_id'];
                    $_SESSION['email'] = $user['email'];
                    $_SESSION['role'] = $user['user_type'];
                    $_SESSION['name'] = $user['username'];

                    $redirect_url = $user['user_type'] === 'admin' ? 'admin.php' : 'index.php';
                    echo json_encode(['status' => 'success', 'role' => $user['user_type'], 'name' => $user['username'], 'redirect' => $redirect_url]);
                } else {
                    echo json_encode(['status' => 'error', 'message' => 'Invalid credentials']);
                }
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Invalid credentials']);
            }
        } else {
            error_log("SQL error: " . mysqli_error($conn));
            echo json_encode(['status' => 'error', 'message' => 'Database query failed']);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Email and password are required']);
    }

    mysqli_close($conn);
}
?>
