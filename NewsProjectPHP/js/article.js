function likeArticle() {
    const form = document.getElementById('likeForm'); // ეძებს ფორმას "likeForm"
    const formData = new FormData(form); // აგენერირებს ფორმის მონაცემებს

    fetch('like.php', {
        method: 'POST', // აგზავნის მოთხოვნას POST მეთოდით
        body: formData // შეიცავს ფორმის მონაცემებს
    })
    .then(response => response.text())
    .then(data => {
        alert('Liked!');
        location.reload(); // გადატვირთავს გვერდს
    })
    .catch(error => console.error('Error:', error)); 
}

function addComment() {
    const form = document.getElementById('commentForm'); // ეძებს ფორმას "commentForm"
    const formData = new FormData(form); // აგენერირებს ფორმის მონაცემებს

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
