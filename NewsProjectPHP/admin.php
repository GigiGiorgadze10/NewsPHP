<?php
session_start();
if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'admin') {
    header("Location: index.php");
    exit();
}

include 'db.php';

$action = isset($_POST['action']) ? $_POST['action'] : '';

if ($action == 'add' || $action == 'edit') {
    $title = mysqli_real_escape_string($conn, $_POST['title']);
    $content = mysqli_real_escape_string($conn, $_POST['content']);
    $author_id = intval($_POST['author_id']);
    $category_id = intval($_POST['category_id']);

    // Image upload handling
    $image_url = '';
    if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
        $target_dir = "images/";
        $image_name = basename($_FILES["image"]["name"]);
        $target_file = $target_dir . $image_name;

        if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
            $image_url = $target_file;
        } else {
            $message = "Sorry, there was an error uploading your file.";
        }
    }

    if ($action == 'add') {
        $sql = "INSERT INTO articles (title, content, image_url, author_id, category_id) VALUES ('$title', '$content', '$image_url', $author_id, $category_id)";
        if (mysqli_query($conn, $sql)) {
            $message = 'Article added successfully';
        } else {
            $message = 'Error: ' . mysqli_error($conn);
        }
    } elseif ($action == 'edit') {
        $id = intval($_POST['id']);
        $sql = "UPDATE articles SET title='$title', content='$content', image_url='$image_url', author_id=$author_id, category_id=$category_id WHERE article_id=$id";
        if (mysqli_query($conn, $sql)) {
            $message = 'Article updated successfully';
        } else {
            $message = 'Error: ' . mysqli_error($conn);
        }
    }
} elseif ($action == 'delete') {
    $id = intval($_POST['id']);
    $sql = "DELETE FROM articles WHERE article_id=$id";
    if (mysqli_query($conn, $sql)) {
        $message = 'Article deleted successfully';
    } else {
        $message = 'Error: ' . mysqli_error($conn);
    }
}

$sql = "SELECT * FROM articles";
$result = mysqli_query($conn, $sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="./css/admin.css">
</head>
<body>
    <h1>Admin Panel</h1>
    <?php if (isset($message)) echo "<p>$message</p>"; ?>
    <div class="container">
        <button id="add-article-button" onclick="openModal('add')">Add Article</button>
        <div id="articles">
            <?php
            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<div class='article'>
        <h2>{$row['title']}</h2>
        <div>
            <button class='edit' 
                    data-id='{$row['article_id']}' 
                    data-title='{$row['title']}' 
                    data-content='{$row['content']}' 
                    data-image='{$row['image_url']}' 
                    data-author-id='{$row['author_id']}' 
                    data-category-id='{$row['category_id']}' 
                    onclick=\"openModal('edit', {$row['article_id']}, '{$row['title']}', '{$row['content']}', '{$row['image_url']}', {$row['author_id']}, {$row['category_id']})\">Edit</button>
            <form method='POST' style='display:inline-block'>
                <input type='hidden' name='id' value='{$row['article_id']}'>
                <input type='hidden' name='action' value='delete'>
                <button type='submit' class='delete'>Delete</button>
            </form>
        </div>
      </div>";

                }
            } else {
                echo "<p>No articles found</p>";
            }
            mysqli_close($conn);
            ?>
        </div>
    </div>

    <!-- The Modal -->
    <div id="article-modal" class="modal" style="display:none">
        <div class="modal-content">
            <span id="close-article-modal" class="close" onclick="closeModal()">&times;</span>
            <h2 id="modal-title">Add Article</h2>
            <form method="POST" id="article-form" enctype="multipart/form-data">
                <input type="hidden" id="article-id" name="id">
                <input type="hidden" id="article-action" name="action">
                <label for="article-title">Title:</label>
                <input type="text" id="article-title" name="title" required>
                <label for="article-content">Content:</label>
                <textarea id="article-content" name="content" required></textarea>
                <label for="article-image">Image:</label>
                <input type="file" id="article-image" name="image">
                <label for="article-author">Author ID:</label>
                <input type="number" id="article-author" name="author_id" required>
                <label for="article-category">Category ID:</label>
                <input type="number" id="article-category" name="category_id" required>
                <button type="submit">Save</button>
            </form>
        </div>
    </div>

    <script src="./js/admin.js"></script>
</body>
</html>
