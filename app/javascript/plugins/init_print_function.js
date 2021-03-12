const initPrintFunc = () => {
  const printIcon = document.querySelector('.print-icon');
  printIcon.addEventListener('click', () => {
    window.print();
  });
}

export default initPrintFunc;
