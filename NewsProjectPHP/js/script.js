document.addEventListener('DOMContentLoaded', () => {
    const signinButton = document.getElementById('signin-button'); 
    const signupButton = document.getElementById('signup-button'); 
    const signoutButton = document.getElementById('signout-button');
    const signinModal = document.getElementById('signin-modal'); 
    const signupModal = document.getElementById('signup-modal');
    const closeSignin = document.getElementById('close-signin');
    const closeSignup = document.getElementById('close-signup'); 
    const searchButton = document.getElementById('search-button'); 
    const searchInput = document.getElementById('search-text');

    if (signinButton) {
        signinButton.addEventListener('click', () => {
            signinModal.style.display = 'block'; 
        });
    }

    if (signupButton) {
        signupButton.addEventListener('click', () => {
            signupModal.style.display = 'block'; 
        });
    }

    if (closeSignin) {
        closeSignin.addEventListener('click', () => {
            signinModal.style.display = 'none'; 
        });
    }

    if (closeSignup) {
        closeSignup.addEventListener('click', () => {
            signupModal.style.display = 'none';
        });
    }

    if (signoutButton) {
        signoutButton.addEventListener('click', () => {
            fetch('signout.php')
                .then(() => {
                    location.reload(); 
                })
                .catch(error => console.error('Error:', error)); 
        });
    }

    window.addEventListener('click', (event) => {
        if (event.target == signinModal) {
            signinModal.style.display = 'none'; 
        }
        if (event.target == signupModal) {
            signupModal.style.display = 'none'; 
        }
    });

    document.querySelector('#signin-modal form').addEventListener('submit', function(event) {
        event.preventDefault(); // ხელს უშლის ფორმის სტანდარტულ გაგზავნას
        const email = document.getElementById('signin-email').value; 
        const password = document.getElementById('signin-password').value; 

        fetch('signin.php', {
            method: 'POST', // აგზავნის მოთხოვნას POST მეთოდით
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: `email=${email}&password=${password}` // აგზავნის ელ-ფოსტასა და პაროლს
        })
        .then(response => response.json()) // პასუხის JSON ფორმატში გადაყვანა
        .then(data => {
            if (data.status === 'success') {
                alert('Sign in successful'); 
                window.location.href = data.redirect; 
            } else {
                alert(data.message); 
            }
        })
        .catch(error => console.error('Error:', error)); 
    });

    document.querySelector('#signup-modal form').addEventListener('submit', function(event) {
        event.preventDefault(); // ხელს უშლის ფორმის სტანდარტულ გაგზავნას
        const name = document.getElementById('signup-name').value; 
        const email = document.getElementById('signup-email').value; 
        const password = document.getElementById('signup-password').value; 

        fetch('signup.php', {
            method: 'POST', // აგზავნის მოთხოვნას POST მეთოდით
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: `name=${name}&email=${email}&password=${password}` // აგზავნის სახელს, ელ-ფოსტას და პაროლს
        })
        .then(response => response.text()) 
        .then(data => {
            alert(data); 
            signupModal.style.display = 'none'; 
        })
        .catch(error => console.error('Error:', error)); 
    });

    if (searchButton) {
        searchButton.addEventListener('click', () => {
            const query = searchInput.value.trim(); // იღებს საძიებო ველის მნიშვნელობას და აშორებს ცარიელ სივრცეებს
            if (query) {
                fetch(`index.php?query=${encodeURIComponent(query)}`) // აგზავნის მოთხოვნას საძიებო შეკითხვით
                    .then(response => response.text()) 
                    .then(data => {
                        document.getElementById('cardscontainer').innerHTML = data; 
                    })
                    .catch(error => console.error('Error:', error)); 
            }
        });
    }
});

function onNavItemClick(category) {
    window.location.href = `index.php?category=${encodeURIComponent(category)}`; // გადადის შესაბამის კატეგორიაზე
}
