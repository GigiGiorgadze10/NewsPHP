function likeArticle() {
    const form = document.getElementById('likeForm');
    const formData = new FormData(form);

    fetch('like.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        alert('Liked!');
        location.reload();
    })
    .catch(error => console.error('Error:', error));
}

function addComment() {
    const form = document.getElementById('commentForm');
    const formData = new FormData(form);

    fetch('comment.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        alert('Comment added!');
        location.reload();
    })
    .catch(error => console.error('Error:', error));
}

document.getElementById('signout-button').addEventListener('click', () => {
    fetch('signout.php')
        .then(() => {
            window.location.href = 'index.php';
        });
});