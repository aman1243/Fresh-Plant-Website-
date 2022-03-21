
<% 
    User user =(User) session.getAttribute("current-user");
   if(user==null)
   {
       session.setAttribute("message", "You are not Logged in!! Login first to access checkout page");
       response.sendRedirect("login.jsp");
       return;
   }
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chechout</title>
        <%@include file="/include/head.jsp"%> 
    </head>
    <body>
        <%@include file="/include/navbar.jsp"%> 
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="cart-body">
                            
                            
                            <div class="cart-body">
                            
                            </div>
                        </div> 
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                    <div class="card-body">
                        <h2>Your details for Order</h2>
                        <form action="CheckoutServlet" method="POST">
                            <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input value="<%=user.getUserEmail()   %>" name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                            <div class="form-group">
                            <label for="exampleInputEmail1">Your Name</label>
                            <input name="name"  value="<%=user.getUserName()   %>"type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Your Name">
                            
                        </div>
                            <div class="form-group">
                            <label for="exampleInputEmail1">Your Phone Number</label>
                            <input name="phone"  value="<%=user.getUserPhone()  %>"type="number" class="form-control" id="phonenumber" aria-describedby="emailHelp" placeholder="Enter Your Phone Number ">
                            
                        </div>
                         <div class="form-group">
                        <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                        <textarea name="address"  value="<%=user.getUserAddress()%>"class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter Your Address"></textarea>
                    </div> 
                     <div class="form-group">
                     <label for="exampleFormControlSelect2">Select Your City </label>
                     <select name="city" class="form-control" id="exampleFormControlSelect2">
                     <option>Nagpur</option>
                       
                      
                     </select>
                   </div>
                            <div class="container text-center"><!--  -->
                                <button class="submit">Order Now</button>
                                <button class="btn btn-outline-primary" onclick="window.location='products.jsp'">Continue Shopping</button>
                            </div>
                        </form>
                        
                        
                    </div>
                    </div>
                    
                    
                </div>
                
            </div>
            
        </div>
        
        
        
         <%@include file="/include/allmodal.jsp"%>
    </body>
</html>
