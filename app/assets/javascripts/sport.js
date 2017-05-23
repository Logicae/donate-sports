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
    // var description = " "
    $.ajax({
      type: "GET",
      url: "/products/" + id,
      dataType: "json",
      success: function(data) {
        $("#product-" + id).html(data.product_description)
    }        
  });

    // })
    // $.get("/products/" + id, function(product) {
    //   debugger
    //   description += product
    //   $("#product-" + id).html(description)
    // })
}

/*
<h1>Products</h1>
<% @products.each do |product| %>
  <h3><%= product.name %></h3>
  <div id="product-<%= product.id %>"><%= truncate(product.product_description) %></div>
  <button class="js-more" data-id="<%= product.id %>">More Info</button>
<% end %>

<script type="text/javascript" charset="utf-8">
$(function() {

  $(".js-more").on("click", function() {
  
  var id = $(this).data("id")

    $.get("/products/" + id + ".json", function(product) {
     
      var inventory = "Available"
    
      if (product["inventory"] < 1){
        inventory = "Sold Out"
      }
      var description = " " + product["description"] + " " + inventory + " "
      
      $("#product-" + id).html(description)

    })
  })
})
</script>*/
