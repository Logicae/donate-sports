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

    $('form').submit(function(e) {
        e.preventDefault();
 
        var values = $(this).serialize();
 
        var posting = $.post('/products', values);
 
        posting.done(function(data) {
          var post = data;
          $("#created-name").text(post["product_name"]);
          $("#created-description").text(post["product_description"]);
      });
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
    productsArray += `<br> ${index + 1}. ` + value.product_name + " - " + value.product_description + `<br>`
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
                // getProducts(data.id);
                $(".js-next").attr("id", data.id);
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
    productArray += `<br>${index + 1}. ` + product.product_name + " - " + product.product_description + `<br>`
    $(".productName").html(productArray);
  });
}

class User {
  constructor(name, email) {
    this.name = name;
    this.email = email;
  }
 
  sayHello() {
    console.log("Hello! Your Donate Sports name is  " + this.name + " and your email is " + this.email);
  }
}