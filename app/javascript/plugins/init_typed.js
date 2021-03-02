import Typed from 'typed.js';

const initTyped = () => {
  if (document.getElementById('banner-typed-text')) {
    new Typed('#banner-typed-text', {
      strings: ["Plan the trip of a life time.", "Travel with ease."],
      typeSpeed: 90,
      loop: true
    });
  }
}

export default initTyped;
