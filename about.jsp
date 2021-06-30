
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Page</title>
         <%@include file="components/link.jsp" %>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
         <div class="container">
             <div class="row">
                 <div class="col-md-6" style="margin-top: 130px;">
                     <h5 id="about" style=" font-size: 44px; text-shadow: 0.1em 0.1em 0.15em #646b5b; font-family: 'Sawarabi Mincho', sans-serif;">ABOUT Us</h5><br>
                      <p style="font-size: 25px; font-family: 'Sawarabi Mincho', sans-serif;">
                         Welcome to Tech Bazaar, where you can find a wide variety of high-end new, Laptop, computers, Mobile, Television, EarPhone's and other gadgets with amazing discount. You can also create your Seller account and sell your product.</p>
                      <p style="font-size: 25px; font-family: 'Sawarabi Mincho', sans-serif; "><a href="signup.jsp" class="btn btn-outline-success" style="color: black;">Seller account</a></p>
                      
                 </div>
                 <div class="col-md-6 mt-8" style="margin-top: 130px;">
                     <div class="container">
                         <!--<div class="u-image u-image-circle u-image-1" data-image-width="1055" data-image-height="704">dfjhdjkshfjh-->
                         <div class="rounded-circle" style="height: 494px;
                            background-position: 50% 50%;
                            width: 494px;
                            margin: 0 auto 0 0;">
                             <img id="img" src="img/sohit.jpg" style="border-radius: 50%; max-height: 500px;
                                max-width: 100%;
                                width: auto;
                                box-shadow: 1px 6px 15px 5px #646b5b;
                              ">
                         </div>
                     </div>
                 </div>
             </div>
         </div>
         <%@include file="components/common_modal.jsp" %>
         <%@include file="components/footer.jsp" %>
    </body>
</html>
