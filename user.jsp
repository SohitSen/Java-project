<%@page import="com.mycompany.yourmart.entities.User"%>
<%
    User user = (User)session.getAttribute("cuurent_user");
    if(user==null){
        session.setAttribute("message","You are not logged in!! Login first");
        response.sendRedirect("login.jsp");
        return;
        
    }else{
        if(user.getUserType().equals("admin")){
            session.setAttribute("message","You are not a user !! do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Details</title>
         <%@include file="components/link.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <!--user details-->
        <div class="container">
            <div class="row mt-5">
               
                <div class='col-md-6'>
                     <div class="card-header">
                        <h3 class="text-center" style="font-family: 'Sawarabi Mincho', sans-serif;">User Details</h3>
                     </div>
                    <div class='card-body'>
                         <form action="" method="post">
                                  <div class="form-group">
                                    <label style="font-family: 'Sawarabi Mincho', sans-serif;" for="email">Email address</label>
                                    <input style="font-family: 'Sawarabi Mincho', sans-serif;" value="<%=user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small style="font-family: 'Sawarabi Mincho', sans-serif;" id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                  </div>
                                 <div class="form-group">
                                    <label style="font-family: 'Sawarabi Mincho', sans-serif;" for="name">Your Name</label>
                                    <input style="font-family: 'Sawarabi Mincho', sans-serif;" value="<%=user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                                </div>
                                 <div class="form-group">
                                    <label for="number" style="font-family: 'Sawarabi Mincho', sans-serif;">Phone Number</label>
                                    <input style="font-family: 'Sawarabi Mincho', sans-serif;" value="<%=user.getUserPhone()%>" type="number" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Phone Number">
                                </div>
                                 <div class="form-group">
                                    <label for="address" style="font-family: 'Sawarabi Mincho', sans-serif;">Your Shipping Address</label>
                                    <textarea style="font-family: 'Sawarabi Mincho', sans-serif;" value="<%=user.getUserAdd()%>" class="form-control" id="address" placeholder="Enter your address" rows="3"></textarea>
                                 </div>
                                 
                                 <div class="container text-center">
                                     <button class="btn btn-outline custom-bg" style="font-family: 'Sawarabi Mincho', sans-serif;">Change Details</button>

                                 </div>
                             </form>
                        
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
                                    <input name="cus_name" style="font-family: 'Sawarabi Mincho', sans-serif;" type="text" class="form-control"  aria-describedby="emailHelp" placeholder="Enter Name">
                                    <small id="emailHelp" style="font-family: 'Sawarabi Mincho', sans-serif;" class="form-text text-muted">We'll never share your Details with anyone else.</small>
                                  </div>
                                 <div class="form-group">
                                    <label for="number" style="font-family: 'Sawarabi Mincho', sans-serif;">Card Number</label>
                                    <input  name="card_detail" style="font-family: 'Sawarabi Mincho', sans-serif;" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
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
                                     <select name="year" class="custom-select" style="font-family: 'Sawarabi Mincho', sans-serif; width: 200px; margin-left: 30px;">
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
                                    <input name="cvv" type="number" style="width: 200px;" style="font-family: 'Sawarabi Mincho', sans-serif;"  class="form-control" id="address" placeholder="Enter your CVV">
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
