
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/link.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                   <div class="card">
                       <%@include file="components/msg.jsp" %>
                       <div class="card-body px-5">
                           <div style="text-align: center;">
                                <img src="img/sign.png" style="height: 90px;">
                           </div>
                           <h3 class="text-center my-3" style="font-family: 'Sawarabi Mincho', sans-serif;">Sign up here!!</h3>
                           <form action="SignUp" method="post">
                               <div class="form-group">
                                   <label for="name" style="font-family: 'Sawarabi Mincho', sans-serif;">User Name</label>
                                   <input name="user_name" style="font-family: 'Sawarabi Mincho', sans-serif;" requireed type="text" class="form-control" id="name" aria-describedby="name" placeholder="Enter name">
                               </div>
                               <div class="form-group">
                                   <label for="email">User Email</label>
                                   <input name="user_email" required type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                               </div>
                               <div class="form-group">
                                   <label for="password" style="font-family: 'Sawarabi Mincho', sans-serif;">User password</label>
                                   <input name="user_pass" required type="password" style="font-family: 'Sawarabi Mincho', sans-serif;" class="form-control" id="password" aria-describedby="password" placeholder="Enter password">
                               </div>
                               <div class="form-group">
                                   <label for="phone" style="font-family: 'Sawarabi Mincho', sans-serif;">User Phone</label>
                                   <input name="user_phone" required type="number" style="font-family: 'Sawarabi Mincho', sans-serif;" class="form-control" id="phone" aria-describedby="phone" placeholder="Enter phone">
                               </div>
                               <label for="password" style="font-family: 'Sawarabi Mincho', sans-serif;">Choose Profile</label>
                               <select class="form-select" name="user_type" aria-label="Default select example">
                                    <option selected>Choose Profile</option>
                                    <option value="1" style="font-family: 'Sawarabi Mincho', sans-serif;" selected value="user">User Profile</option>
                                    <option value="2" style="font-family: 'Sawarabi Mincho', sans-serif;" selected value="admin">Seller Profile</option>                                    
                                </select>
                               <div class="form-group">
                                   <label for="add" style="font-family: 'Sawarabi Mincho', sans-serif;">User Address</label>
                                   <textarea name="user_add" style="font-family: 'Sawarabi Mincho', sans-serif;" required class="form-control" style="height: 200px;" placeholder="Enter your address" id="add"></textarea>
                               </div>
                               <div class="container">                        
                                   <button type="submit" class="btn btn-outline-success" style="font-family: 'Sawarabi Mincho', sans-serif;">Sign up</button>
                                   <button type="reset" class="btn btn-outline-warning" style="font-family: 'Sawarabi Mincho', sans-serif;">Reset</button>
                               </div>
                           </form>
                       </div>
                   </div>
               </div>
           </div>
        </div>
                       <%@include file="components/common_modal.jsp" %>
                       <%@include file="components/footer.jsp" %>
    </body>
</html>
