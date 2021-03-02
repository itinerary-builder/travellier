const initScrollNav = () => {
  const navBar = document.querySelector('.navbar-lewagon');
  if (navBar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY > 80) {
        navBar.classList.add('navbar-navy')
      } else {
        navBar.classList.remove('navbar-navy')
      }
    });
  }
}

export default initScrollNav;
