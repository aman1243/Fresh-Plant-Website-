<%-- 
    Document   : aboutus
    Created on : 3 Mar, 2022, 8:18:58 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        <%@include file="/include/head.jsp"%> 
        
    </head>
    <body>
        <%@include file="/include/navbar.jsp"%>
       
        <div class="container m-5 cccc">

    <div class="row">

      <div class="col-lg-8 col-lg-offset-2">

        
        <form id="contact-form" method="post" action="https://formspree.io/f/mjvlrewr" role="form">

        <div class="messages"></div>

        <div class="controls">

          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="form_name">Firstname *</label>
                <input id="form_name" type="text" name="name" class="form-control" placeholder="Please enter your firstname *" required="required" data-error="Firstname is required.">
                <div class="help-block with-errors"></div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="form_lastname">Lastname *</label>
                <input id="form_lastname" type="text" name="surname" class="form-control" placeholder="Please enter your lastname *" required="required" data-error="Lastname is required.">
                <div class="help-block with-errors"></div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="form_email">Email *</label>
                <input id="form_email" type="email" name="email" class="form-control" placeholder="Please enter your email *" required="required" data-error="Valid email is required.">
                <div class="help-block with-errors"></div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="form_message">Message *</label>
                <textarea id="form_message" name="message" class="form-control" placeholder="Message for me *" rows="4" required data-error="Please,leave us a message."></textarea>
                <div class="help-block with-errors"></div>
              </div>
            </div>
            <div class="col-md-12">
              <input type="submit" class="btn btn-success btn-send" value="Send message">
            </div>
          </div>
         
        </div>
      </div>
        </div>
        </div>
        </form>
          <%@include file="/include/footter.jsp"%> 
    </body>
</html>
