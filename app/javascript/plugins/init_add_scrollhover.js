import ScrollReveal from 'scrollreveal'

const initAddScrollhover = () => {
  const homeGrid = document.querySelector('.home-grid');
  if (homeGrid) {
    ScrollReveal().reveal('.home-column-1', { delay: 200, duration: 800 });
    ScrollReveal().reveal('.home-column-2', { delay: 200, duration: 800 });
    ScrollReveal().reveal('.home-column-3', { delay: 200, duration: 800 });
    ScrollReveal().reveal('.home-column-4', { delay: 200, duration: 800 });
  }
}

export default initAddScrollhover;
