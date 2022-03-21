<%-- 
    Document   : sampletoast
    Created on : 29 Dec, 2021, 6:08:50 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #toast{
                min-width: 300px;
                position: fixed;
                bottom: 30px;
                left: 50%;
                margin-left: -125px;
                background: #333;
                padding: 15px;
                color: white;
                text-align: center;
                z-index: 1;
                font-size: 18px;
                visibility: hidden;
                box-shadow:0px 0px 100px #000 
                
            }
            #toast.display{
                visibility: visible;
                 -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;

            }
            
            @-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}
        </style><!-- comment -->
    </head>
    <body>
        <h1>Hello World!</h1>
        <button onclick="showToast()">Click me</button>
        <div id="toast"> This is our Costom toast text</div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script>
       function showToast()
       {
           $("#toast").addClass("display");
           $("#toast").html(content);
           setTimeout(()=>{
               $("#toast").removeClass("display");
           },2000);
       }
        </script>
    
    </body>
</html>
