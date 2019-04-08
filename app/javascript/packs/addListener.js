const addListenerToPhoto = () => {
  const photo = document.querySelector('#tshirt_photo')
  photo.addEventListener("change", (event) => {
    const image = event.target.files[0]
    const placeholder = document.getElementById("user-image");
    const reader = new FileReader();
    reader.onload = (event) => {
      placeholder.src = event.target.result;
    };

    reader.readAsDataURL(image);
  });
};

addListenerToPhoto();

// export { addListenerToPhoto }
