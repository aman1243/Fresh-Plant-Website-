<%@page import="helper.Heplers"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="entitie.Category"%>
<%@page import="Dao.CategoryDao"%>
<%@page import="helper.FactoryProvider"%>
<%@page import="entitie.User"%>
<%
   User user =(User) session.getAttribute("current-user");
   if(user==null)
   {
       session.setAttribute("message", "You are not Logged in!! Login first");
       response.sendRedirect("login.jsp");
       return;
   }else
   {
       if(user.getUserType().equals("normal"))
       {
           session.setAttribute("message", "You ae not admin ! Do not access this page");
           response.sendRedirect("login.jsp");
           return;
       }
   }

           

%>
<% 
              CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
             List<Category> list = cdao.getCategoies();
             

// getting count 
 Map<String,Long> m = Heplers.getCount(FactoryProvider.getFactory());
              


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel</title>
        <%@include file="/include/head.jsp"%> 
        <style>
            body{
                background: #e2e2e2;
            }
        </style>
    </head>
    <body>
         <%@include file="/include/navbar.jsp"%>
        <div class="container admin">
            <div class="container-fluid mt-3">
            <%@include file="/include/message.jsp"%>    
            </div>
             <div class="row mt-3">
                 <!-- first  -->
                 <div class="col-md-4">
                     <!-- first box -->
                     <div class="card" data-toggle="tooltip" data-placement="left" title="Number oF Users i this website">
                         <div class="card-body text-center">
                            <div class="container">
                                 <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/users.png" alt="user_icon"/>
                             </div>
                             <h1><%= m.get("userCount") %></h1>
                             <h1 class="text-uppercase">Users</h1>
                     </div>   
                     </div>
                 </div>
                 <!-- second -->
                 <div class="col-md-4">
                     <!-- second box -->
                    <div class="card"  data-toggle="tooltip" data-placement="bottom" title="Number oF Category in website">
                        <div class="card-body text-center">
                            
                             <div class="container">
                                 <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/options.png" alt="user_icon"/>
                             </div>
                             <h1><%= list.size() %></h1>
                             <h1 class="text-uppercase">Categories</h1>
                         </div>
                        </div>     
                 </div>
                 <!-- third -->
                 <div class="col-md-4">
                     <!-- third box -->
                      <div class="card" data-toggle="tooltip" data-placement="bottom" title="Number oF Product">
                         
                             <div class="card-body text-center">
                             <div class="container">
                                 <img style="max-width:125px;" class="img-fluid rounded-circle" src="img/package.png" alt="user_icon"/>
                             </div>
                                 <h1><%= m.get("productCount") %></h1>
                             <h1 class="text-uppercase">Product</h1>
                         </div>
                  </div>
             </div>
              </div>
   <!-- second row -->
             <div class="row mt-3">
                 <div class="col-md-4">
                    <!-- first box -->
                      <div class="card" data-toggle="modal" data-target="#add-category-modal" data-toggle="tooltip" data-placement="bottom" title="Add category on Website">
                         
                             <div class="card-body text-center">
                             <div class="container">
                                 <img style="max-width:125px;" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon"/>
                             </div>
                                 <p>Click Here To add  new Category</p>
                             <h1 class="text-uppercase">Add Category</h1>
                     </div>   
                 </div> 
                 </div>
                 <div class="col-md-4">
                     <!-- second box -->
                      <div class="card" data-toggle="modal" data-target="#add-product-modal" data-toggle="tooltip" data-placement="bottom" title="Add to product in website" >
                           <div class="card-body text-center">
                             <div class="container">
                                 <img style="max-width:120px;" class="img-fluid rounded-circle" src="img/add.png" alt="user_icon"/>
                             </div>
                                 <p>Click Here to add new Product</p>
                             <h1 class="text-uppercase">Add Product</h1>
                         </div> 
                 </div>
                 </div>
             </div>
         </div>
                             <!--view Produts -->
                             
                             <div class="container admin">
                                 
                                 
                             <div class="row mt-3">
                                 
                              
                 <div class="col-md-12 mb-4">
                    <!-- first box -->
                      <div class="card">
                         
                             <div class="card-body text-center">
                             <div class="container">
                                 <img style="max-width:125px;" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon"/>
                             </div>
                                 <p>Click Here To Views All Products</p>
                             <h1 class="text-uppercase">view Products </h1>
                     </div>   
                 </div> 
                 </div>
                
               
                           </div>
                             </div>
                             
                             
                             
                             
                             
                             
                             
      <!--start modal-->  
      <!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-black">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="POST">
              <input type="hidden" name="operation" value="addcategory">
             <div class="form-group ">
                  <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required>
              </div>
              <div class="form-group">
                  <textarea  style="height: 200px;" class="form-control" placeholder="Enter categoy description" name="catDescription" ></textarea>
              </div>
              <div class="container text-center">
                  <button class="btn btn-outline-success">Add Category</button>
                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
                 </form>
      </div>
    </div>
  </div>
</div>
<!--end modal-->
<!--Product Modal-->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-black">
        <h5 class="modal-title" id="exampleModalLabel">Product Details </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="POST" enctype="multipart/form-data">
              <input type="hidden" name="operation" value="addproduct">
              <div class="form-group ">
                  <input type="text" class="form-control" name="pName" placeholder="Enter title of Product" required>
              </div> 
              <div class="form-group ">
                  <textarea style="height:200px;" class="form-control"  placeholder="Enter Product Description" name="pDesc"></textarea>
              </div> 
              <div class="form-group ">
                  <input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required>
              </div> 
              <div class="form-group ">
                  <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required>
              </div> 
              <div class="form-group ">
                  <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required>
              </div> 
             
            <div class="form-group ">
                 <select name="catId" class="form-control" id=""> 
                     <%
                        for(Category c:list){
                           %>
                     <option value="<%=c.getCategoryId()  %>"><%= c.getCategoryTittle() %></option>
                     <%} %>
                 </select>
              </div> 
               <div class="form-group ">
                   <label for="pPhoto">Select Picture of Product</label>
                   <br>
                  <input type="file"  name="pPhoto" required>
              </div> 
              <div class=" text-center">
                  <button class="btn btn-outline-success">Add Product</button>
                   <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
              </div>
          </form>
      </div>
    </div>
  </div>
</div>


 <%@include file="/include/allmodal.jsp"%>

<!--End Product Modal-->

<script>
        $(function () {
  $('[data-toggle="tooltip"]').tooltip()
})            
    </script>
    
    
    </body>
</html>
