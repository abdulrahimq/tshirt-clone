const animateResize = (event) => {
  const target = event.target;
  target.style.width = event.rect.width + 'px';
  target.style.height = event.rect.height + 'px';
}

function dragMoveListener (event) {
    var target = event.target,
        // keep the dragged position in the data-x/data-y attributes
        x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx,
        y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy;

    // translate the element
    target.style.webkitTransform =
    target.style.transform =
      'translate(' + x + 'px, ' + y + 'px)';

    // update the posiion attributes
    target.setAttribute('data-x', x);
    target.setAttribute('data-y', y);
  }

interact('.resize-drag')
  .draggable({
    onmove: dragMoveListener,
    modifiers: [
      interact.modifiers.restrict({
        restriction: 'parent',
        elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
      })
    ]
  })
  .resizable({
    edges: { right: true, bottom: true },
    invert: 'reposition',
    modifiers: [
    interact.modifiers.restrictEdges({
      outer: 'parent',
      endOnly: 'true'
    }),
    interact.modifiers.restrictSize({
      min: { width: 50, height: 50}
    })
    ]
  })
  .on('resizemove', animateResize);
