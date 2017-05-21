$(function() {
  attachListeners();
})

function attachListeners() {
  $("#products").on('click', function(e) {
    var path = window.location.pathname.split( '/' );
    var sportId = path[2];
    getSport(sportId);
  })
}

function getSport(sportId) {
  $.ajax({
    type: "GET",
    url: "/sports/" + sportId,
    dataType: "json",
    success: function(data){
        alert(data);
    }        
  });
}

