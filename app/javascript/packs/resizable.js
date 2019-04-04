const animateResize = (event) => {
  const target = event.target;
  console.log(target);
  target.style.width = event.rect.width + 'px';
  target.style.height = event.rect.height + 'px';
}


interact('.resizable')
  .resizable({
    edges: { right: true, bottom: true },
    invert: 'reposition'
  })
  .on('resizemove', animateResize);
