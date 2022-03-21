

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FreshPlant - Login</title>
         <%@include file="/include/head.jsp"%> 
    </head>
    <body>
       <%@include file="/include/navbar.jsp"%>
       <div class="container">
           <div class="row mt-3">
               <div class="col-md-4 offset-md-4">
                   <div class="card mt-3 ">
                       <div class="card-header custom-bg">
                           <h3>Login Here</h3>  
                       </div>
                       <div class="cad-body">
                           <%@include file="/include/message.jsp"%>
                           <form action="loginservlet" method="POST">
  <div class="form-group">
    <label for="exampleInputEmail1">Email </label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
                               <a href="register.jsp" class="text-center d-block mb-2">If Not reistered Click Here?</a>
 
                               
                               <div class="container text-center">
                                   <button type="submit" class="btn btn-primary custom-bg mb-4">Submit</button>
                                   <button type="reset" class="btn btn-primary custom-bg border-8 mb-4">Reset</button>
                               </div>
 
                       </div>
                       
                       
   
                   </div>
                   
                   
               </div>
           </div>
       </div>             
       
         <%@include file="/include/footter.jsp"%>
    </body>
</html>
