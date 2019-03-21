//= require rails-ujs
//= require interact/interact
//= require_tree .

//= require angular
//= require leaflet

var dragMoveListener;

dragMoveListener = function(event) {
  var target, x, y;
  target = event.target;
  x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx;
  y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy;
  target.style.webkitTransform = target.style.transform = 'translate(' + x + 'px, ' + y + 'px)';
  target.setAttribute('data-x', x);
  return target.setAttribute('data-y', y);
};

window.dragMoveListener = dragMoveListener;

interact('.resize-drag').draggable({
})
.resizable({
  preserveAspectRatio: false,
    edges: {
      left: true,
      right: true,
      top: true,
      bottom: true,
    }
})
.on('dragstart', function (event) {
    event.preventDefault();
  })
.on('dragmove', dragMoveListener)
.on('resizestart', function(event) {
  console.info('resizestart = ', event);
})
.on('resizemove', function(event) {
    console.info('resizemove = ', event);
    var target = event.target,
      x = (parseFloat(target.getAttribute('data-x')) || 0),
      y = (parseFloat(target.getAttribute('data-y')) || 0);

    // update the element's style
    target.style.width = event.rect.width + 'px';
    target.style.height = event.rect.height + 'px';

    // translate when resizing from top or left edges
    x += event.deltaRect.left;
    y += event.deltaRect.top;

    target.style.webkitTransform = target.style.transform =
      'translate(' + x + 'px,' + y + 'px)';

    target.setAttribute('data-x', x);
    target.setAttribute('data-y', y);
  });

