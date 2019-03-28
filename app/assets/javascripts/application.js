//= require rails-ujs
//= require jquery
//= require interact/interact
//= require_tree .
//= require social-share-button
//= require angular
//= require leaflet

// target elements with the "draggable" class

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

// this is used later in the resizing and gesture demos
window.dragMoveListener = dragMoveListener;


interact('.draggable')
  .draggable({
    onmove: dragMoveListener,
});
