

<%@page import="helper.Heplers"%>
<%@page import="entitie.Category"%>
<%@page import="Dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="entitie.Product"%>
<%@page import="helper.FactoryProvider"%>
<%@page import="Dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FreshPlant - Products</title>
        <%@include file="/include/head.jsp"%> 
    </head>
    <body>
         <%@include file="/include/navbar.jsp"%> 
         <div class="container-fluid">
        <div class="row mt-3 mx-2">
           <% 
               String cat = request.getParameter("category");
               
           ProductDao dao =new ProductDao(FactoryProvider.getFactory());
           List <Product> list =null;
           if(cat==null || cat.trim().equals("all"))
           {
            list = dao.getAllProducts();
           }else{
              int cid = Integer.parseInt(cat.trim());
              list = dao.getAllProductsById(cid);
           }
           CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
          List<Category> clist = cdao.getCategoies();
           %>
            
            <div class="col-md-2">
              <div class="list-group mt-4">
                <a href="products.jsp?category=all" class="list-group-item list-group-item-action active">
                    All Products 
                </a>
               
                
                <%
                    for(Category c:clist)
                    {
                        
                        
                        %>
                         <a href="products.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTittle() %></a>
                        
                        <%
                     }
                    %>
                </div>    
                    
            
            </div>
            
            <div class="col-md-10">
                
                <div class="row mt-4">
                    
                    <div class="col-md-12">
                        <div class="card-columns">
                            <%
                                for(Product p :list)
                                {
                                    %>
                                    <!--product card-->
                                    <div class="card product-card ">
                                        <div class="container text-center">
                                           <img style="max-height: 200px; max-width: 100%; width: auto;" class="card-img-top m-2" src="img/products/<%= p.getpPhoto() %>" alt="Card image cap">   
                                        </div>
                                      
                                        <div class="card-body">
                                            <h5 class="card-title"><%=p.getpName() %></h5>
                                            <p class="card-text">
                                                <%= Heplers.get10Words(p.getpDesc()) %>
                                                
                                            </p>
                                        </div> 
                                                
                                                <div class="footer text-center mb-4" >
                                                    <button class="btn custom-bg text-black" onclick="add_to_cart(<%= p.getpId() %>,'<%=p.getpName() %>',<%=p.getPriceAfterApplyingDiscount() %>)">Add to Card</button>
                                                    <button class="btn btn-outline-primary text-black">&#8377;<%= p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label">&#8377;<%= p.getpPrice() %> <%= p.getpDiscount()%>%off  </span></button>
                                                </div>
                                    </div>
                                    
                                    
                                    
                                    
                                    
                                    <%
                                }
                               if(list.size()== 0) 
                            {
                            out.println("<h3> No item in This category</h3>");
                            }
                                
                                %>
                            
                        </div>    
                        
                        
                    </div>
                    
                </div> 
            
            </div>
        </div>
         </div>
                                <%@include file="/include/allmodal.jsp"%> 
                <%@include file="/include/footter.jsp"%> 
    </body>
</html>
