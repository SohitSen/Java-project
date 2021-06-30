<%@page import="java.util.List"%>
<%@page import="com.mycompany.yourmart.entities.Category"%>
<%@page import="com.mycompany.yourmart.entities.User"%>
<%@page import="com.mycompany.yourmart.dao.CategoryDao"%>
<%@page import="com.mycompany.yourmart.helper.FactoryProvider"%>
<%
    User user1 = (User)session.getAttribute("cuurent_user");
    
%>

<nav class="navbar navbar-expand-lg navbar-light custom-bg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp"><img src="img/logo.png" style="max-height: 50px; max-width: 100%; width: auto;"/></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="index.jsp" style="font-family: 'Sawarabi Mincho', sans-serif;">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Sawarabi Mincho', sans-serif;">
                  Category
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a href="index.jsp?category=all" class="dropdown-item" href="#" style="font-family: 'Sawarabi Mincho', sans-serif;">All Product</a>
<!--                  <a class="dropdown-item" href="#">Another action</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>-->

<!--                <div class="list-group mt-5">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active text-dark">
                          All Products Category
                        </a>-->



                    <%
                        CategoryDao caDao = new CategoryDao(FactoryProvider.getFactory());
                        List<Category> calist=caDao.getCategory();
                        for(Category c: calist){

                            %>
                            
                            <a href="index.jsp?category=<%=c.getCategoryId()%>" class="dropdown-item " style="font-family: 'Sawarabi Mincho', sans-serif;"><%= c.getCategoryTitle()%></a>
                            <%    }   %>               
                    </div>


              </li>
              <li class="nav-item active">
                <a class="nav-link" href="about.jsp" style="font-family: 'Sawarabi Mincho', sans-serif;">About <span class="sr-only">(current)</span></a>
              </li>
            </ul>
            
              <ul class="navbar-nav ml-auto">
                  
                  <li class="nav-item active">
                      <a class="nav-link" href="#" data-toggle="modal" data-target="#cart" style="font-family: 'Sawarabi Mincho', sans-serif;"><i class="fa fa-cart-plus" style="font-size:27px;"></i><span class="ml-1 cart-item" style="font-size: 17px;">( 0 )</span> </a>
                    </li>
                  
                  <%
                      if(user1==null){
                      
                  %>
                    <li class="nav-item active">
                      <a class="nav-link" href="login.jsp" style="font-family: 'Sawarabi Mincho', sans-serif;">LogIn </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="signup.jsp" style="font-family: 'Sawarabi Mincho', sans-serif;">Sign Up </a>
                    </li>
                  <%
                      }else{
                      
                  %>
                       <li class="nav-item active">
                            <a href="<%=user1.getUserType().equals("admin")?"admin.jsp":"user.jsp"%>" class="nav-link" style="font-family: 'Sawarabi Mincho', sans-serif;"><%=user1.getUserName()%></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="LogoutServlet" style="font-family: 'Sawarabi Mincho', sans-serif;">Logout </a>
                        </li>
                        
<!--                          <li class="nav-item active">
                            
                            <a class="nav-link" href="<%=user1.getUserType().equals("admin")?"admin.jsp":"user.jsp"%>"><span style="font-size: 25px;"> <i class="fa fa-user-circle-o" aria-hidden="true"></span></i></a>
                        </li>-->
                       
                        
                  <%
                      }
                  %>
                  
              </ul>
        </div>
    </div>
    
</nav>