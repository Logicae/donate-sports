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

    $("form.product-form").on("submit", function(e) {
        var values = $(this).serialize()
        var posting = $.post('/products', values)
        posting.done(function(data) {
          let newPost = new Post(data)
          let string = newPost.describeProduct()
          $("#created-name").html(string)
      });
      e.preventDefault()
    });
}

// get calls

function getNext(id) {
        $.ajax({
         type: "GET",
            url: "/sports/" + id,
            dataType: "json",
            success: function(data) {
                $(".sportName").text(data.name);
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

// additional functions

function productInfo(data) {
  var productsArray = " "
  $(data).each(function (index, value) {
    productsArray += `<br> ${index + 1}. ` + value.product_name + " - " + value.product_description + `<br>`
  $("#product").html(productsArray)
  })
}

function getProducts(data) {
  var productArray = " "
  $(data).each(function(index, product) {
    productArray += `<br>${index + 1}. ` + product.product_name + " - " + product.product_description + `<br>`
    $(".productName").html(productArray);
  });
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

// model objects

function Post(data) {
  this.product_name = data["product_name"]
  this.product_description = data["product_description"]
}

Post.prototype.describeProduct = function() {
  let postString = `The item name is: ${this.product_name}. <br> Its description is: ${this.product_description}.`
  return postString
}


 