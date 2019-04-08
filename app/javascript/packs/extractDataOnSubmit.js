const form = document.querySelector('.new_tshirt');
const button = document.querySelector('#test-button');
const captureData = (event) => {
  event.preventDefault();
  const userPhoto = document.querySelector('#user-image');
  const formHeight = document.querySelector('#tshirt_height');
  const formWidth = document.querySelector('#tshirt_width');
  const formX = document.querySelector('#tshirt_x');
  const formY = document.querySelector('#tshirt_y');

  formHeight.value = userPhoto.style.height.replace('px', '').split('.')[0];
  formWidth.value = userPhoto.style.width.replace('px', '').split('.')[0];
  formX.value = userPhoto.dataset.x.replace('px','').split('.')[0];
  formY.value = userPhoto.dataset.y.replace('px','').split('.')[0];

  console.log(document.querySelector('#tshirt_x').value);
  form.submit();
}

button.addEventListener('click', captureData);
form.addEventListener('submit', captureData);

// in the controllers whitelist them
// in the controller authorize them
// in the controller save them to tshirt

// using rails helper for url with cloudinary, calling images overlayed
// at the proper value interpolated from the table
