<?php
session_start();
include 'db.php';

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    die("Invalid article ID.");
}

$article_id = intval($_GET['id']);

// Fetching the article
$sql_article = "SELECT articles.*, users.username AS author, categories.name AS category FROM articles
                JOIN users ON articles.author_id = users.user_id
                JOIN categories ON articles.category_id = categories.category_id
                WHERE article_id = $article_id";
$result_article = mysqli_query($conn, $sql_article);

if (!$result_article || mysqli_num_rows($result_article) == 0) {
    die("Article not found.");
}

$article = mysqli_fetch_assoc($result_article);

// Fetching comments
$sql_comments = "SELECT comments.*, users.username FROM comments
                 JOIN users ON comments.user_id = users.user_id
                 WHERE article_id = $article_id
                 ORDER BY comments.created_at DESC";
$result_comments = mysqli_query($conn, $sql_comments);

// Fetching likes count
$sql_likes = "SELECT COUNT(*) AS likes_count FROM likes WHERE article_id = $article_id";
$result_likes = mysqli_query($conn, $sql_likes);
$likes = mysqli_fetch_assoc($result_likes);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $article['title']; ?></title>
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/article.css">
    <script src="./js/script.js" defer></script>
</head>
<body>
    <nav>
        <div class="main-nav container flex">
            <a href="index.php" class="company-logo">
                <h1>NEWS</h1>
            </a>
            <div class="search-bar flex">
                <?php if (isset($_SESSION['user_id'])): ?>
                    <span class="username-display">Hello, <?php echo $_SESSION['name']; ?></span>
                    <button class="signout-button" id="signout-button">Sign Out</button>
                <?php else: ?>
                    <button class="signin-button" id="signin-button">Sign In</button>
                    <button class="signup-button" id="signup-button">Join Now</button>
                <?php endif; ?>
            </div>
        </div>
    </nav>

    <div class="article-container">
        <h1 class="article-title"><?php echo $article['title']; ?></h1>
        <p class="article-author">by <?php echo $article['author']; ?></p>
        <img src="<?php echo $article['image_url']; ?>" alt="Article Image" class="article-image">
        <div class="article-content">
            <p><?php echo nl2br($article['content']); ?></p>
        </div>
        <p class="article-category">Category: <?php echo $article['category']; ?></p>
        <div class="likes-container">
            <p>Likes: <?php echo $likes['likes_count']; ?></p>
            <form id="likeForm">
                <input type="hidden" name="article_id" value="<?php echo $article_id; ?>">
                <button type="button" onclick="likeArticle()">Like</button>
            </form>
        </div>
        <div class="comments-container">
            <h2>Comments</h2>
            <?php
            if ($result_comments && mysqli_num_rows($result_comments) > 0) {
                while ($comment = mysqli_fetch_assoc($result_comments)) {
                    echo "<div class='comment'><strong>{$comment['username']}:</strong> {$comment['content']} <small>{$comment['created_at']}</small></div>";
                }
            } else {
                echo "No comments yet.";
            }
            ?>
        </div>
        <div class="comment-form">
            <form id="commentForm">
                <input type="hidden" name="article_id" value="<?php echo $article_id; ?>">
                <textarea name="content" placeholder="Add a comment..."></textarea>
                <button type="button" onclick="addComment()">Comment</button>
            </form>
        </div>
    </div>
    <script src="./js/article.js"></script>
</body>
</html>
<?php
mysqli_close($conn);
?>
