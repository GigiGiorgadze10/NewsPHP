document.addEventListener('DOMContentLoaded', () => {
    const articleForm = document.getElementById('article-form');

    document.getElementById('add-article-button').addEventListener('click', () => {
        openModal('add');
    });

    document.getElementById('close-article-modal').addEventListener('click', () => {
        closeModal();
    });

    window.addEventListener('click', (event) => {
        if (event.target == document.getElementById('article-modal')) {
            closeModal();
        }
    });

    articleForm.addEventListener('submit', (event) => {
        const id = document.getElementById('article-id').value;
        const action = document.getElementById('article-action').value;
        if (action === 'edit' && id === '') {
            event.preventDefault();
            alert('ID is missing for edit action');
        }
    });

    // Attach event listeners to edit buttons after the DOM is fully loaded
    document.querySelectorAll('.edit').forEach(button => {
        button.addEventListener('click', function () {
            const articleId = this.dataset.id;
            const articleTitle = this.dataset.title;
            const articleContent = this.dataset.content;
            const articleImage = this.dataset.image;
            const articleAuthorId = this.dataset.authorId;
            const articleCategoryId = this.dataset.categoryId;

            openModal('edit', articleId, articleTitle, articleContent, articleImage, articleAuthorId, articleCategoryId);
        });
    });
});

function openModal(action, id = '', title = '', content = '', image = '', author_id = '', category_id = '') {
    console.log('Opening modal with action:', action);
    document.getElementById('article-form').reset();
    document.getElementById('article-id').value = id;
    document.getElementById('article-action').value = action;
    document.getElementById('article-title').value = title;
    document.getElementById('article-content').value = content;
    // Set image value if necessary, handle image separately if required
    // document.getElementById('article-image').value = image;
    document.getElementById('article-author').value = author_id;
    document.getElementById('article-category').value = category_id;
    document.getElementById('modal-title').textContent = action === 'add' ? 'Add Article' : 'Edit Article';
    document.getElementById('article-modal').style.display = 'block';
}

function closeModal() {
    document.getElementById('article-modal').style.display = 'none';
}
document.querySelectorAll('.edit').forEach(button => {
    button.addEventListener('click', function () {
        console.log('Edit button clicked');
        const articleId = this.dataset.id;
        const articleTitle = this.dataset.title;
        const articleContent = this.dataset.content;
        const articleImage = this.dataset.image;
        const articleAuthorId = this.dataset.authorId;
        const articleCategoryId = this.dataset.categoryId;

        openModal('edit', articleId, articleTitle, articleContent, articleImage, articleAuthorId, articleCategoryId);
    });
});
