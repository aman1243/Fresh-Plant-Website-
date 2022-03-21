

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
         <%@include file="/include/head.jsp"%> 
    </head>
    <body>
         <%@include file="/include/navbar.jsp"%>
         <div class="container-fluid">
             <div class="row mt-3">
             <div class="col-md-4 offset-md-4">
                 <div class="card">
                     <%@include file="/include/message.jsp"%>
                     <div class="cad-body px-5">
                         <h3 class="text-center my-3">Sign Up Here</h3>
                         <form action="RegisterServlet" method="POST">
                     <div class="form-group">
    <label for="name">User Name</label>
    <input name="user_name"  type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Your Name">
    </div>
                <div class="form-group">
    <label for="email">User Email</label>
    <input  name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email">
                </div><!-- comment -->    
                <div class="form-group">
    <label for="password">User Password</label>
    <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Password">
    </div>
                <div class="form-group">
    <label for="phone">User phone</label>
    <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter PhoneNumber">
    </div>
                <div class="form-group">
    <label for="phone">User Address</label>
    <textarea name="user_address" class="form-control" placeholder="Enter Your Address"></textarea>
    </div>   
                <div class="container text-center">
                    <button  type="submit" class="btn btn-outline-success">Register</button>
                    <button type="reset" class="btn btn-outline-warning">Reset</button>
                </div>
                 </form>
                         
                     </div>
                     
                 </div>
                 
             </div>
             
         </div>
             
         </div>
         <%@include file="/include/footter.jsp"%>
    </body>
</html>
