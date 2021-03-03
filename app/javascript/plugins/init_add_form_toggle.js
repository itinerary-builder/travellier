const initAddFormToggle = () => {
  const button = document.querySelector('.button');
  const dropdown = document.querySelector('.dropdown-form');
  const exit = document.querySelector('.dropdown-form-exit');
  if (button) {
    button.addEventListener('click', () => {
      setTimeout(function(){
        dropdown.classList.remove('dropdown-form-hidden');
        button.classList.add('home-button-hidden');
      }, 2000); 
    });
  }
  
  if (exit) {
    exit.addEventListener('click', () => {
      dropdown.classList.add('dropdown-form-hidden');
      button.classList.remove('home-button-hidden');
    });
  }
}

export default initAddFormToggle;
