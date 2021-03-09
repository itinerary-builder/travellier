const initAjaxPlaces = () => {
  const museumBtns = document.querySelectorAll('.btn-ghost-top');
  museumBtns.forEach(button => {
    button.addEventListener('click', () => {
      button.classList.add('ghost-active');
    });
  });
}

export default initAjaxPlaces;
