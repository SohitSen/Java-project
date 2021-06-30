<%@page import="java.util.Map"%>
<%@page import="com.mycompany.yourmart.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.yourmart.helper.FactoryProvider"%>
<%@page import="com.mycompany.yourmart.entities.*"%>
<%@page import="com.mycompany.yourmart.dao.CategoryDao"%>
<%
    User user = (User)session.getAttribute("cuurent_user");
    if(user==null){
        session.setAttribute("message","You are not logged in!! Login first");
        response.sendRedirect("login.jsp");
        return;
        
    }else{
        if(user.getUserType().equals("user")){
            session.setAttribute("message","You are not admin !! do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

 <% CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
           List<Category> list = cDao.getCategory();
//           getting count

Map<String,Long> m = Helper.getCount(FactoryProvider.getFactory());

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="components/link.jsp" %>
       
        
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        
        <div class="container admin">
			
			<div class="container-fluid">
				<%@include file="components/msg.jsp" %>
			</div>
			
			
            <div class="row mt-5">
                <div class="col-md-4 text-center">
                    <div class="card">
                         <div class="card-body">
                                <div class="container">
                                    <img class="img-fluid rounded-circle" style="max-width: 75px" src="img/user.png" >
                                </div> 
                                <!--<h3>123</h3>-->
                                <h3 style="font-family: 'Sawarabi Mincho', sans-serif;" class="text-uppercase text-muted"><%=m.get("userCount")%></h3>
                                 
                        </div>
                    </div>
                </div> 
                    <div class="col-md-4 text-center">
                        <div class="card">
                            <div class="card-body">
                                <div class="container">
                                    <img class="img-fluid rounded-circle" alt="user_icon" style="max-width: 75px" src="img/list.png" >
                                </div>
                                <!--<h3>123</h3>-->
                                <h3 style="font-family: 'Sawarabi Mincho', sans-serif;" class="text-uppercase text-muted"><%=list.size()%></h3>
                                 
                            </div>  
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="card">
                            <div class="card-body">
                               <div class="container">
                                    <img class="img-fluid rounded-circle" style="max-width: 75px" src="img/shoping.png" >
                                </div>
                                <!--<h3 style="font-family: 'Sawarabi Mincho', sans-serif;">123</h3>-->
                                <h3 class="text-uppercase text-muted" style="font-family: 'Sawarabi Mincho', sans-serif;"><%=m.get("productCount")%></h3>
                                 
                            </div>  
                        </div>
                    </div>
                </div>
            <!-- secon row -->
            
            <div class="row mt-5">
                <div class="col-md-6 text-center">
                    <div class="card" data-toggle="modal" data-target="#add_product">
                         <div class="card-body">
                                <div class="container">
                                    <img class="img-fluid rounded-circle" style="max-width: 75px" src="img/add.png" >
                                </div> 
                                <p style="font-family: 'Sawarabi Mincho', sans-serif;">click here to add product</p>
                                <h3 class="text-uppercase text-muted" style="font-family: 'Sawarabi Mincho', sans-serif;">Add Product</h3>
                                 
                        </div>
                    </div>
                </div> 
                <div class="col-md-6 text-center">
                    <div class="card" data-toggle="modal" data-target="#add_category">
                        <div class="card-body">
                            <div class="container">
                                <img class="img-fluid rounded-circle" style="max-width: 75px" src="img/addCategory.jpg" >
                            </div>
                            <p style="font-family: 'Sawarabi Mincho', sans-serif;">click here to add category</p>
                            <h3 class="text-uppercase text-muted" style="font-family: 'Sawarabi Mincho', sans-serif;">Add Category </h3>
                                 
                        </div>  
                    </div>    
                </div>
            </div>
        </div>
        
        
 <!-- add Modal for category -->

        <!-- Modal -->
        <div class="modal fade" id="add_category" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header custom-bg text-dark">
                <h5 class="modal-title" id="exampleModalLabel" style="font-family: 'Sawarabi Mincho', sans-serif;">Fill Category Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                
                    <form action="PtoductOperationServlet" method="post">
                        <input type="hidden" name="operation" style="font-family: 'Sawarabi Mincho', sans-serif;" value="addCategory">
                        <div class="form-group">
                            <input type="text" class="form-control" style="font-family: 'Sawarabi Mincho', sans-serif;" name="catTitle" placeholder="Entry category title" required="" />
                        </div>
                        <div class="form-group">
                            <textarea style="height: 300px; font-family: 'Sawarabi Mincho', sans-serif;" class="form-control" name="cat_desc" placeholder="Entry category Description" required="" ></textarea>
                        </div>
                        <div class="container text-center">
                            <button class="btn btn-outline-success" style="font-family: 'Sawarabi Mincho', sans-serif;">Add category</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" style="font-family: 'Sawarabi Mincho', sans-serif;">Close</button>
                        </div>               
                    </form>    
                </div>
            </div>
        </div>
     </div>   
        <!--end modal-->

        
        <!-- add Modal for product -->
        
           <!-- Modal -->
        <div class="modal fade" id="add_product" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header custom-bg text-dark">
                <h5 class="modal-title" id="exampleModalLabel" style="font-family: 'Sawarabi Mincho', sans-serif;">Fill Category Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                
                    <form action="PtoductOperationServlet" method="post" enctype="multipart/form-data">
			<input type="hidden" name="operation" style="font-family: 'Sawarabi Mincho', sans-serif;" value="addProduct"/>
					
                        <div class="form-group">
                            <input type="text" class="form-control" style="font-family: 'Sawarabi Mincho', sans-serif;" name="pName" placeholder="Entry Product Title" required />
                        </div>                         
                         <div class="form-group">
                            <textarea style="height: 100px; font-family: 'Sawarabi Mincho', sans-serif;"  class="form-control" name="pDesc" placeholder="Entry Product Description" required ></textarea>
                        </div>
                        
                        <!--product category-->
						
                       
			
                        <div class="form-group">
                            <select name="cId" class="form-control">
                                <% for(Category c : list) { %>
                                <option style="font-family: 'Sawarabi Mincho', sans-serif;" value="<%= c.getCategoryId()%>"> <%= c.getCategoryTitle()%> </option>
                                <% } %>
                            </select>
                            
                        </div>
                        
                        <!-- product price -->
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input type="number" style="font-family: 'Sawarabi Mincho', sans-serif;" class="form-control" name="pPrice" placeholder="Entry Product price" required />
                                </div>
                            </div>
                            <div class="col-md-4 ">
                                <div class="form-group">
                                    <input type="text" style="font-family: 'Sawarabi Mincho', sans-serif;" class="form-control" name="pDiscount" placeholder="Entry Product discount" required />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input type="text" class="form-control" style="font-family: 'Sawarabi Mincho', sans-serif;" name="pQuantity" placeholder="Product quantity" required />
                                </div>
                            </div>
                        </div>
                        <!-- profile pic -->
                        <p style="font-family: 'Sawarabi Mincho', sans-serif;">Select Product Pic</p>
                          <div class="form-group">
                            <input type="file" name="pPic"  />
                          </div>
                        <div class="container text-center">
                            <button class="btn btn-outline-success" style="font-family: 'Sawarabi Mincho', sans-serif;">Add category</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" style="font-family: 'Sawarabi Mincho', sans-serif;">Close</button>
                        </div>  
                    </form>    
                </div>
            </div>
        </div>
     </div> 
       
        <!--end modal-->
          <%@include file="components/common_modal.jsp" %>
          <%@include file="components/footer.jsp" %>
    </body>
</html>
