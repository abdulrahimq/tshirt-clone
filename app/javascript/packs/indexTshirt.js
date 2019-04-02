const addClick = () => {
  const tshirtList = document.querySelectorAll('.card');

  tshirtList.forEach((tshirt) => {
    const link = tshirt.querySelector('a')
    tshirt.addEventListener("click", () => {
      window.location.href = link.href;
    });
  });
}

export { addClick }
