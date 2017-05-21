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
    url: "/sports/" + sportId +"/products",
    dataType: "json",
    success: function(data){
        productInfo(data)
    }        
  });
}

function productInfo(data) {
  var productsArray = " "
  $(data).each(function (index, value) {
    productsArray += `<br><strong> ${index + 1}. </strong>` + value.product_name + " - " + value.product_description + `<br>`
  $("#product").html(productsArray)
  })
}

