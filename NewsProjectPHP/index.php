<?php
session_start();
include 'db.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>News App</title>
    <link rel="stylesheet" href="./css/styles.css">
    <script src="./js/script.js" defer></script>
</head>

<body>
    <nav>
        <div class="main-nav container flex">
            <a href="index.php" class="company-logo">
                <h1>NEWS</h1>
            </a>
            <div class="nav-links">
                <ul class="flex">
                    <li class="hover-link nav-item" id="Georgia" onClick="onNavItemClick('Georgia')">News about Georgia</li>
                </ul>
            </div>
            <div class="search-bar flex">
                <input type="text" class="news-input" id="search-text" placeholder="e.g. Science">
                <button class="search-button" id="search-button">Search</button>
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

    <main>
        <div class="cards-container container flex" id="cardscontainer">
        <?php
// Check if a category filter is applied
$category = isset($_GET['category']) ? $_GET['category'] : null;
// Check if a search query is applied
$query = isset($_GET['query']) ? $_GET['query'] : null;

$sql = "SELECT articles.*, categories.name AS category_name 
        FROM articles 
        LEFT JOIN categories ON articles.category_id = categories.category_id 
        WHERE 1=1 ";

if ($category) {
    $sql .= "AND categories.name = ?";
}

if ($query) {
    $sql .= "AND (articles.title LIKE ? OR articles.content LIKE ?)";
}

$stmt = $conn->prepare($sql);

if ($category && $query) {
    $queryParam = "%" . $query . "%";
    $stmt->bind_param("sss", $category, $queryParam, $queryParam);
} elseif ($category) {
    $stmt->bind_param("s", $category);
} elseif ($query) {
    $queryParam = "%" . $query . "%";
    $stmt->bind_param("ss", $queryParam, $queryParam);
}

$stmt->execute();
$result = $stmt->get_result();

// Check if there are articles
if ($result->num_rows > 0) {
    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        ?>
        <a href="article.php?id=<?php echo $row['article_id']; ?>">
            <div class="card">
                <div class="card-header">
                    <img src="<?php echo $row['image_url']; ?>" alt="News Image">
                </div>
                <div class="card-content">
                    <h3><?php echo $row['title']; ?></h3>
                    <h6 class="news-source"><?php echo $row['category_name']; ?> · <?php echo $row['published_at']; ?></h6>
                    <p class="news-desc"><?php echo $row['content']; ?></p>
                </div>
            </div>
        </a>
        <?php
    }
} else {
    echo "0 results";
}

// Close the database connection
$stmt->close();
mysqli_close($conn);
?>
        </div>
    </main>

    <!-- Sign In Modal -->
    <div class="modal" id="signin-modal">
        <div class="modal-content">
            <span class="close" id="close-signin">&times;</span>
            <h2>Sign In</h2>
            <form>
                <label for="signin-email">Email:</label>
                <input type="email" id="signin-email" required>
                <label for="signin-password">Password:</label>
                <input type="password" id="signin-password" required>
                <button type="submit">Sign In</button>
            </form>
        </div>
    </div>

    <!-- Sign Up Modal -->
    <div class="modal" id="signup-modal">
        <div class="modal-content">
            <span class="close" id="close-signup">&times;</span>
            <h2>Join Now</h2>
            <form>
                <label for="signup-name">Name:</label>
                <input type="text" id="signup-name" required>
                <label for="signup-email">Email:</label>
                <input type="email" id="signup-email" required>
                <label for="signup-password">Password:</label>
                <input type="password" id="signup-password" required>
                <button type="submit">Sign Up</button>
            </form>
        </div>
    </div>
</body>
</html>
