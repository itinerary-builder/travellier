const initAjaxPlaces = () => {
  const museumBtns = document.querySelectorAll('.btn-ghost-top');
  const mapBtns = document.querySelectorAll('.btn-ghost-elements-map');
  const placeDiv = document.querySelector('.places-cards-add');
  museumBtns.forEach(button => {
    button.addEventListener('click', () => {
      button.classList.add('ghost-active');
      placeDiv.innerHTML = "";
      placeDiv.insertAdjacentHTML('beforeend', '<div class="loader">Loading...</div>');
    });
  });

  mapBtns.forEach(button => {
    button.addEventListener('click', () => {
      button.classList.add('ghost-map-active');
    });
  });
}

export default initAjaxPlaces;
