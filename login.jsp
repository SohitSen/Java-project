

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/link.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-5">
                        <div class="card-header custom-bg ">
                            <h3 style="font-family: 'Sawarabi Mincho', sans-serif;">LogIn</h3>
                        </div>
                        <div class="card-body">
                            <%@include file="components/msg.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                  <label for="exampleInputEmail1" style="font-family: 'Sawarabi Mincho', sans-serif;">Email address</label>
                                  <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" style="font-family: 'Sawarabi Mincho', sans-serif;">
                                  </div>
                                <div class="form-group">
                                  <label for="exampleInputPassword1" style="font-family: 'Sawarabi Mincho', sans-serif;">Password</label>
                                  <input name="pass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" style="font-family: 'Sawarabi Mincho', sans-serif;">
                                </div>
                                <a href="signup.jsp" class="text-center d-block mb-2" style="font-family: 'Sawarabi Mincho', sans-serif;" >if not registered click here </a>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary border-0 custom-bg text-dark" style="font-family: 'Sawarabi Mincho', sans-serif;">Submit</button>
                                    <button type="reset" class="btn btn-primary border-0 custom-bg text-dark" style="font-family: 'Sawarabi Mincho', sans-serif;">Reset</button>
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
