const boxes = document.querySelectorAll('xd');
const observer = new IntersectionObserver (entries => {
    entries.forEach(entry => {
        entry.target.classList.toggle('shown', entry.isIntersecting);
    })
},{
    rootMargin: '100px',
})
boxes.forEach(box => {
    observer.observe(box);
})