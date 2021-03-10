const initAjaxPlaces = () => {
  const museumBtns = document.querySelectorAll('.btn-ghost-top');
  const mapBtns = document.querySelectorAll('.btn-ghost-elements-map');
  museumBtns.forEach(button => {
    button.addEventListener('click', () => {
      button.classList.add('ghost-active');
    });
  });

  mapBtns.forEach(button => {
    button.addEventListener('click', () => {
      button.classList.add('ghost-map-active');
    });
  });
}

export default initAjaxPlaces;
