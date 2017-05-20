$(function() {
  attachListeners();
})

function attachListeners() {
  $("#products").on('click', function(e) {
    var path = window.location.pathname.split( '/' );
    var userId = path[2];
    // getUser();
  })
}


