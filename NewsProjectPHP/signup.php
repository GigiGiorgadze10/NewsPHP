<?php
session_start();

include './conn/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') { // შემოწმება, თუ მოთხოვნის მეთოდი POST-ია

    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT); // პაროლის ჰეშირება

    $query = "INSERT INTO users (username, email, password) VALUES ('$name', '$email', '$password')";
    if (mysqli_query($conn, $query)) { 
        echo "Registration successful"; 
    } else {
        echo "Error: " . $query . "<br>" . mysqli_error($conn);
    }

    mysqli_close($conn);
}
?>
