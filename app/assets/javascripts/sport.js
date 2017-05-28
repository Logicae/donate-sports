$(document).on('turbolinks:load', function() {
  attachListeners()
})

function attachListeners() {
  $("#products").on('click', function(e) {
    var path = window.location.pathname.split( '/' );
    var sportId = path[2];
    getNext(sportId);
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

    $("#new_product").on("submit", function(e) {
        e.preventDefault()
        var values = $(this).serialize()
        var posting = $.post('/products', values)
        posting.done(function(data) {
          let newPost = new Post(data)
          let string = newPost.describeProduct()
          $("#created-name").html(string)
        });
    });
}


// ajax 


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
      url: "/sports/" + id +"/products",
      dataType: "json",
      success: function(data){
          getProducts(data)
      }        
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

function getProducts(data) {
  var postString = " "
  $(data).each(function(index, value) {
      let nextProduct = new Product(index, value)
      postString += `<br>Product Name: ${nextProduct.product_name} <br> Product Description: ${nextProduct.product_description}<br>`
      $("#product").html(postString)
  });
}


// constructor functions


function Post(data) {
  this.product_name = data["product_name"]
  this.product_description = data["product_description"]
}

Post.prototype.describeProduct = function() {
  let postString = `Product Name: ${this.product_name} <br> Product Description: ${this.product_description}`
  return postString
}

function Product(index, value) {
  this.product_name = value["product_name"]
  this.product_description = value["product_description"]
}

Product.prototype.describeProduct = function() {

}



//    $.ajax({
//         type: "GET",
//         url: "/sports/" + id + "/products",
//         dataType: "json",
//         success: function(data) {
//           getProducts(data)
//     }
// });

// function productInfo(data) {
//   var productsArray = " "
//   $(data).each(function (index, value) {
//     productsArray += `<br> ${index + 1}. ` + value.product_name + " - " + value.product_description + `<br>`
//   $("#product").html(productsArray)
//   })
// }