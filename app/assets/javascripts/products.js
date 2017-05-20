$(function() {
  attachListeners();
})

function attachListeners() {
  $("#products").on('click', function(e) {
   getUser();
  })
}

function getUser() {
    var path = window.location.pathname.split( '/' );
    var id = path[2];
    alert(id)
}
