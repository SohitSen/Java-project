/* global cart */

function add_to_cart(pid,pName,price){
    let cart = localStorage.getItem("cart");
    if(cart == null){
        let products =[];
        let product ={productId:pid, productName: pName, productQuantity:1, productPrice: price};
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
        //console.log("Product is added for first time");
        showToast("Item is added to cart");
    }else{
        let pcart = JSON.parse(cart);
        
            let oldProduct = pcart.find((item) => item.productId == pid);
            if(oldProduct) {
                oldProduct.productQuantity=oldProduct.productQuantity+1;
                pcart.map((item)=> {
                    if(item.productId == oldProduct.productId){
                        item.productQuantity = oldProduct.productQuantity;
                    }
                }); 
                localStorage.setItem("cart",JSON.stringify(pcart));
                 //console.log("Product qyuantity is increased");
                 showToast(oldProduct.productName +"Product qyuantity is increased, Quantity = "+oldProduct.productQuantity);
           }else{
                let product ={productId:pid, productName: pName, productQuantity:1, productPrice: price};
                pcart.push(product);
                localStorage.setItem("cart",JSON.stringify(pcart));
                // console.log("Product is added");
                 showToast("Product is added to cart");
            }
        
    }
       updateCart();
}


//update cart

function updateCart(){
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if(cart==null || cart.length==0){
        console.log("Cart is empty!!");
        $(".cart-item").html("( 0 )");
        $(".cart-body").html("Please Add your product!!");
        $(".chackout-btn").attr('disable',true);
    }else{
        console.log(cart);
        $(".cart-item").html(`(${cart.length})`);
        let table=`
        <table class='table'>
            <thead class='thread-light'>
                <tr>
                <th>Item Name</th>
                <th>Price</th>
                <th>Qantity</th>
                <th>Total Price</th>
                <th>Action</th>
                
                </tr>
            </thead>
        
        `;
        let totalPrice =0;
        cart.map((item) =>{
            table +=`
                    <tr>
                        <td>${item.productName}</td>
                        <td>${item.productPrice}</td>
                        <td>${item.productQuantity}</td>
                        <td>${item.productQuantity * item.productPrice}</td>
                         <td><button onclick="deleteItemFromCart(${item.productId})" class="btn btn-danger btn-sm">Remove</button></td>
                    </tr>
                `;
            totalPrice += item.productPrice * item.productQuantity;
                    
        });
        
        
        table = table+
                `<tr><td colspan='5' class="text-right font-weight-bold m-5">Total price ${totalPrice}</td></tr>
                </table>`;
        $(".cart-body").html(table);
        $(".chackout-btn").attr('disable',false);
        
    }
   
}
$(document).ready(function (){
    updateCart();
});

//delete item
function deleteItemFromCart(pid){
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item) => item.productId !=pid);
    
    localStorage.setItem('cart',JSON.stringify(newcart));
    updateCart();
    showToast("Item is removed from cart");
}

function showToast(contant) {
    $("#toast").attr("display",true);
    $("#toast").attr(contant);
    setTimeout(() => {
        $("toast").attr("display",false);
    }, 2000);
}

function goToChackOut(){
    window.location="chackOut.jsp"; 
}


