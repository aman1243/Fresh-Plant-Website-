function add_to_cart(pid,pname,price)
{
    
   let cart = localStorage.getItem("cart");
   
   if(cart ==null)
   {
       //no cart yet
       
       let products=[];
       let product= {productId:pid,productName:pname,productQuantity:1 ,productPrice:price}
       products.push(product);
       localStorage.setItem("cart", JSON.stringify(products));
  //console.log("Product is added for the  Firt Time")
   showToast("Item is added to cart")
    }else
   {
               //cart is alrady prasedn 
       let pcart=JSON.parse(cart);
    let oldProduct  = pcart.find((item)=> item.productId == pid)
     if(oldProduct)
     {
       //we hve to increse the quantity 
       
      oldProduct.productQuantity =oldProduct.productQuantity+1
      pcart.map((item) =>{
          
          if(item.productId == oldProduct.productId)
          {
              item.productQuantity = oldProduct.productQuantity;
          }
      })
         localStorage.setItem("cart", JSON.stringify(pcart)); 
    console.log("Porduct increses ")
      showToast(oldProduct.productName+" quantity is Increased , Quantity ="+ oldProduct.productQuantity)
        }else
     {
       let product= {productId:pid,productName:pname,productQuantity:1 ,productPrice:price}
         pcart.push(product);
            //we have to product 
            localStorage.setItem("cart", JSON.stringify(pcart));
          console.log("prodauct is adadd")
        showToast("Product is Added To cart")
        }
   }
   updateCart();
}

//updte cart

function updateCart()
{
   let cartString = localStorage.getItem("cart");
   let cart = JSON.parse(cartString);
   if(cart == null || cart.length == 0)
   {
       console.log("cart is empty!!")
       $(".cart-item").html("( 0 )");
       $(".cart-body").html("<h3>Cart Dose Not Have Any Items  </h3>");
       $(".checkout-btn").attr('disabled',true)
   }
   else{
       console.log(cart)
         $(".cart-item").html(`(${cart.length})`);
         let table=`
         <table class='table'>
        <thead class='thread-ligth'>
        <tr>
        <th>Item Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th> Total Price</th>
        <th>Action</th>
        
        
        </tr>
        </thead>
                `;
        let totalPrice = 0;
        cart.map((item) =>{
          table+=`
                <tr>
            
            <td>${item.productName}</td>
            <td>${item.productPrice}</td>
            <td>${item.productQuantity}</td>
            <td>${item.productQuantity * item.productPrice }</td>
            <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove </button></td>
            
            </tr>

            `
           totalPrice+=item.productPrice* item.productQuantity; 
        })
        table=table+`
            <tr><td colspan='5' class='text-right font-weight-bold m-5' >Total Price:${totalPrice}</td></tr>
            </table>`
        $(".cart-body").html(table);
          $(".checkout-btn").attr('disabled',false)
   }
}

function deleteItemFromCart(pid)
{
   let cart = JSON.parse(localStorage.getItem('cart'));
let newcart =  cart.filter((item) => item.productId != pid)
localStorage.setItem('cart',JSON.stringify(newcart))

updateCart();
showToast("Item is Remove from cart")
}
$(document).ready(function (){
    
    updateCart()
    
})

 function showToast(content)
       {
           $("#toast").addClass("display");
           $("#toast").html(content);
           setTimeout(()=>{
               $("#toast").removeClass("display");
           },2000);
       }
       
       function goToCheckout()
       {
           window.location="checkout.jsp"
       }
       function continue_shop()
       {
           window.location="products.jsp"
       }