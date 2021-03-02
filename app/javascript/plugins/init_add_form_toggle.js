const initAddFormToggle = () => {
  const button = document.querySelector('.button');
  const dropdown = document.querySelector('.dropdown-form');
  if (button) {
    button.addEventListener('click', () => {
      setTimeout(function(){
        dropdown.classList.remove('dropdown-form-hidden');
        button.classList.add('home-button-hidden');
      }, 2000); 
    });
  }
}

export default initAddFormToggle;
