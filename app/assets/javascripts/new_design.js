function check_color(value) {
  const photo = document.getElementById("imagedest")
  switch (value) {
  case 1:
    photo.src = "https://res.cloudinary.com/dju9xcsec/image/upload/v1553144623/White.jpg"
  break;
  case 2:
    photo.src = "https://res.cloudinary.com/dju9xcsec/image/upload/v1553144614/Gray.jpg"
  break;
  case 3:
    photo.src = "https://res.cloudinary.com/dju9xcsec/image/upload/v1553144618/Black.jpg"
  break;
  }
}
