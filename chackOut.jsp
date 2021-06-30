<%@page import="com.mycompany.yourmart.entities.*"%>
<%
     User user = (User)session.getAttribute("cuurent_user");
    if(user==null){
        session.setAttribute("message","You are not logged in!! Login first to ChackOut Your Product");
        response.sendRedirect("login.jsp");
        return;
        
    } 

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>chack out</title>
         <%@include file="components/link.jsp" %>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
         <div class="container">
             <div class="row mt-5">
                 <div class="col-md-6">
                     <!--card details-->
                     <div class="card-header">
                         <h3 class="text-center mt-2 mb-2" style="font-family: 'Sawarabi Mincho', sans-serif;">Your Selected Item</h3>
                    </div>
                     <div class="card-body">
                         <div class="cart-body" style="font-family: 'Sawarabi Mincho', sans-serif;">
                         
                        </div>
                     </div>
                                          
                     
                 </div>
                 <div class='col-md-6'>
                     <div class="card-header">
                        <h3 class="text-center" style="font-family: 'Sawarabi Mincho', sans-serif;">Payment Details</h3>
                        <%@include file="components/msg.jsp" %>
                     </div>
                    <div class='card-body'>
                         <form action="PaymentServlet" method="post">
                                  <div class="form-group">
                                    <label for="name" style="font-family: 'Sawarabi Mincho', sans-serif;">Card Holder Name</label>
                                    <input name="cus_name" type="text" style="font-family: 'Sawarabi Mincho', sans-serif;" class="form-control"  aria-describedby="emailHelp" placeholder="Enter Name">
                                    <small id="emailHelp" class="form-text text-muted" style="font-family: 'Sawarabi Mincho', sans-serif;">We'll never share your Details with anyone else.</small>
                                  </div>
                                 <div class="form-group">
                                    <label for="number" style="font-family: 'Sawarabi Mincho', sans-serif;">Card Number</label>
                                    <input  name="card_detail" type="text" style="font-family: 'Sawarabi Mincho', sans-serif;" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                                </div>
                                 <div class="form-group">
                                     <label for="number" style="font-family: 'Sawarabi Mincho', sans-serif;">Expiration Date</label><br>
                                    <!--<input  value="<%=user.getUserPhone()%>" type="number" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Phone Number">-->
                                
                                     <select name="month"  class="custom-select" style="width: 200px; font-family: 'Sawarabi Mincho', sans-serif;">
                                    <option selected>Month</option>
                                    <option value="">Jan</option>
                                    <option value="" >Fab</option>
                                    <option value="">Mar</option>
                                    <option value="">Apr</option>
                                    <option value="">May</option>
                                    <option value="">June</option>
                                    <option value="">July</option>
                                    <option value="">Aug</option>
                                    <option value="">Sep</option>
                                    <option value="">Oct</option>
                                    <option value="">Nov</option>
                                    <option value="">Dec</option>
                                  </select>
                                     <select name="year" class="custom-select" style="width: 200px; margin-left: 30px; font-family: 'Sawarabi Mincho', sans-serif;">
                                    <option selected>Year</option>
                                    <option value="">2021</option>
                                    <option value="">2022</option>
                                    <option value="">2023</option>
                                    <option value="">2024</option>
                                    <option value="">2025</option>
                                    <option value="">2026</option>
                                    <option value="">2027</option>
                                    <option value="">2028</option>
                                    <option value="">2029</option>
                                    
                                  </select>
                                 
                                 
                                 </div>
                                 <div class="form-group">
                                    <label for="number" style="font-family: 'Sawarabi Mincho', sans-serif;">CVV</label>
                                    <input name="cvv" type="number" style="width: 200px; font-family: 'Sawarabi Mincho', sans-serif;"  class="form-control" id="address" placeholder="Enter your CVV">
                                 </div>
                                 
                                 <div class="container text-center">
                                     <button class="btn btn-outline custom-bg" style="font-family: 'Sawarabi Mincho', sans-serif;">Submit</button>

                                 </div>
                             </form>
                        
                    </div>

                        
                </div>
             </div>
         </div>
        <%@include file="components/common_modal.jsp" %>
        <%@include file="components/footer.jsp" %>
    </body>
</html>
