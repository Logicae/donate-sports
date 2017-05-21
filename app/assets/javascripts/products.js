$(function() {
  attachListeners();
})

function attachListeners() {
  $("#products").on('click', function(e) {
    var path = window.location.pathname.split( '/' );
    var userId = path[2];
    getUser(userId);
  })
}

function getUser(userId) {
  $.ajax({
    type: "GET",
    url: "/users/" + userId,
    dataType: "json",
    success: function(data){
        alert(data.email)
    }        
  });
}

