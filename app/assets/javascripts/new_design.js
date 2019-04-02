// TODO this can be changed to interpolate the string instead of using 3 different cases

function check_color(value) {
  const photo = document.getElementById("imagedest")
  console.log(imageTag('White.jpg'))
  switch (value) {
  case "White":
    photo.src = 'https://res.cloudinary.com/dju9xcsec/image/upload/v1553144623/White.jpg'
  break;
  case "Grey":
    photo.src = 'https://res.cloudinary.com/dju9xcsec/image/upload/v1553144614/Gray.jpg'
  break;
  case "Black":
    photo.src = 'https://res.cloudinary.com/dju9xcsec/image/upload/v1553144618/Black.jpg'
  break;
  }
}
