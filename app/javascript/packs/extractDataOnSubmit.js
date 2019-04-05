const form = document.querySelector('.new_tshirt');
const button = document.querySelector('#test-button');
const captureData = (event) => {
  event.preventDefault();
  const userPhoto = document.querySelector('#user-image');
  const formHeight = document.querySelector('.tshirt_height');
  const formWidth = document.querySelector('.tshirt_width');
  const formX = document.querySelector('.tshirt_x');
  const formY = document.querySelector('.tshirt_y');
  const x = userPhoto.dataset.x
  const y = userPhoto.dataset.y
  const height = userPhoto.style.height;
  const width = userPhoto.style.width;
  formHeight.value = height;
  formWidth.value = width;
  formX.value = x;
  formY.value = y;

  console.log(formHeight.value, formWidth.value, formX.value, formY.value);
  form.submit();
}

button.addEventListener('click', captureData);
form.addEventListener('submit', captureData);

// in the controllers whitelist them
// in the controller authorize them
// in the controller save them to tshirt

// using rails helper for url with cloudinary, calling images overlayed
// at the proper value interpolated from the table
