$(document).on('turbolinks:load', function() {
  attachListeners()
})

function attachListeners() {
  $("#products").on('click', function(e) {
    var path = window.location.pathname.split( '/' );
    var sportId = path[2];
    getSport(sportId);
    e.preventDefault()
  })

  $(".js-more").on("click", function(e) {
      getDetails(e.target.id)
      e.preventDefault()
    })

    $(".js-next").on("click", function(e) {
        var id = parseInt(e.target.id, 10) + 1
        getNext(id)
        e.preventDefault()
    });
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

function getDetails(id) {
    $.ajax({
      type: "GET",
      url: "/products/" + id,
      dataType: "json",
      success: function(data) {
        $("#product-" + id).html(data.product_description)
    }        
  })
}

function getNext(id) {
        $.ajax({
         type: "GET",
            url: "/sports/" + id,
            dataType: "json",
            success: function(data) {
                $(".sportName").text(data.name);
                $(".js-next").attr(data.id);
                getProducts(data.id);
          }
    });

       $.ajax({
            type: "GET",
            url: "/sports/" + id + "/products",
            dataType: "json",
            success: function(data) {
              getProducts(data);
        }
    });
}

function getProducts(data) {
  var productArray = " "
  $(data).each(function(index, product) {
    debugger
    productArray += `<br><strong> ${index + 1}. </strong>` + product.product_name + " - " + product.product_description + `<br>`
    $(".productName").html(productArray);
  });
}
