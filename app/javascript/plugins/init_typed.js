import Typed from 'typed.js';

const initTyped = () => {
  new Typed('#banner-typed-text', {
    strings: ["Plan the trip of a lifetime.", "Travel with ease."],
    typeSpeed: 90,
    loop: true
  });
}

export default initTyped;
