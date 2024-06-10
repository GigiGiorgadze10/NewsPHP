<?php
session_start(); 
if (!isset($_SESSION['user_id']) || !isset($_POST['article_id']) || !isset($_POST['content'])) { // ამოწმებს, არის თუ არა სესიის მომხმარებლის ID, სტატიის ID და კომენტარის შინაარსი გადაცემული
    http_response_code(400);
    echo 'Invalid input.'; 
    exit(); 
}

include './conn/db.php'; 

$user_id = $_SESSION['user_id']; 
$article_id = intval($_POST['article_id']); 
$content = mysqli_real_escape_string($conn, $_POST['content']); // კომენტარის შინაარსის დამუშავება უსაფრთხოების მიზნით

$sql_comment = "INSERT INTO comments (content, user_id, article_id) VALUES ('$content', $user_id, $article_id)";
if (mysqli_query($conn, $sql_comment)) { 
    $sql_user = "SELECT username FROM users WHERE user_id = $user_id"; 
    $result_user = mysqli_query($conn, $sql_user); 
    $user = mysqli_fetch_assoc($result_user); 
    echo "<div class='comment'><strong>{$user['username']}:</strong> $content <small>Just now</small></div>"; 
} else { 
    echo "Error: " . $sql_comment . "<br>" . mysqli_error($conn); 
}

mysqli_close($conn); 
?>
