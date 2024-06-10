<?php
session_start(); 

// ამოწმებს, არსებობს თუ არა სესია და გადაცემულია თუ არა სტატიის ID
if (!isset($_SESSION['user_id']) || !isset($_POST['article_id'])) {
    http_response_code(400); 
    echo 'Invalid input.'; 
    exit(); 
}

include './conn/db.php';

$user_id = $_SESSION['user_id']; // მომხმარებლის ID-ს შენახვა სესიიდან
$article_id = intval($_POST['article_id']); 

// ამოწმებს, არის თუ არა მომხმარებელს უკვე "ლაიქი" გაკეთებული ამ სტატიაზე
$sql_check = "SELECT * FROM likes WHERE user_id = $user_id AND article_id = $article_id";
$result_check = mysqli_query($conn, $sql_check);

if (mysqli_num_rows($result_check) > 0) {
    echo "Already liked"; 
} else {
    // "ლაიქის" ჩანაწერის დამატება მონაცემთა ბაზაში
    $sql_like = "INSERT INTO likes (user_id, article_id) VALUES ($user_id, $article_id)";
    if (mysqli_query($conn, $sql_like)) {
        // "ლაიქების" რაოდენობის გამოთვლა
        $sql_likes = "SELECT COUNT(*) AS likes_count FROM likes WHERE article_id = $article_id";
        $result_likes = mysqli_query($conn, $sql_likes);
        $likes = mysqli_fetch_assoc($result_likes);
        echo $likes['likes_count']; // დაბრუნება "ლაიქების" რაოდენობა
    } else {
        echo "Error: " . $sql_like . "<br>" . mysqli_error($conn);
    }
}
mysqli_close($conn); 
?>
