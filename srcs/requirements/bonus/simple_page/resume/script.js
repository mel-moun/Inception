document.addEventListener('DOMContentLoaded', function () {
    const items = document.querySelectorAll('.timeline-item');
    items.forEach((item, index) => {
        item.style.animationDelay = `${index * 0.3}s`;
    });
});
