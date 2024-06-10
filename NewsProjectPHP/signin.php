<?php
session_start(); 
include './conn/db.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email']; 
    $password = $_POST['password']; 

    if (!empty($email) && !empty($password)) { // შემოწმება, რომ ორივე ველი არ არის ცარიელი
        $email = mysqli_real_escape_string($conn, $email); 

        $sql = "SELECT * FROM users WHERE email = '$email'"; 
        $result = mysqli_query($conn, $sql); 

        if ($result) {
            if (mysqli_num_rows($result) === 1) { 
                $user = mysqli_fetch_assoc($result); 

                if (password_verify($password, $user['password'])) { 
                    // სესიის მონაცემების შენახვა
                    $_SESSION['user_id'] = $user['user_id'];
                    $_SESSION['email'] = $user['email'];
                    $_SESSION['role'] = $user['user_type'];
                    $_SESSION['name'] = $user['username'];

                    $redirect_url = $user['user_type'] === 'admin' ? 'admin.php' : 'index.php';
                    // JSON ფორმატში წარმატების პასუხის დაბრუნება
                    echo json_encode(['status' => 'success', 'role' => $user['user_type'], 'name' => $user['username'], 'redirect' => $redirect_url]);
                } else {
                    // არასწორი პაროლის შემთხვევაში
                    echo json_encode(['status' => 'error', 'message' => 'Invalid credentials']);
                }
            }
        }
    }
    mysqli_close($conn); // მონაცემთა ბაზის კავშირის დახურვა
}
?>
