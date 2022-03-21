<%@page import="helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <title class="oi oi-target">FreshPlant - Home</title>
         <%@include file="/include/head.jsp"%> 
    </head>
    <body>
        <%@include file="/include/navbar.jsp"%> 
       
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="img/slider1.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/slider2.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/slider3.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
    </div>
        
        <h1>Hello World!</h1>
        <h1>creating session factory object </h1>
        <%
        out.println(FactoryProvider.getFactory()+"<br>");
        out.println(FactoryProvider.getFactory()+"<br>");
        out.println(FactoryProvider.getFactory());
        %>
        
         <%@include file="/include/allmodal.jsp"%>
         <%@include file="/include/footter.jsp"%> 
    </body>
</html>
