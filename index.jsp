
<%@page import="com.mycompany.yourmart.helper.Helper"%>
<%@page import="com.mycompany.yourmart.entities.Category"%>
<%@page import="com.mycompany.yourmart.dao.CategoryDao"%>
<%@page import="java.util.*"%>
<%@page import="com.mycompany.yourmart.dao.ProductDao"%>
<%@page import="com.mycompany.yourmart.helper.FactoryProvider"%>
<%@page import="com.mycompany.yourmart.entities.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/link.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5 mx-3">

                <%
                    String cat=request.getParameter("category");
                    //out.println(cat); 

                    ProductDao dao= new ProductDao(FactoryProvider.getFactory());
                     List<Product> list = null;
                     if(cat ==null || cat.trim().equals("all")){
                        list = dao.getAllProduct();
                    }
                    else{
                       int cId = Integer.parseInt(cat.trim());
                       list = dao.getAllProductById(cId);
                    }             
                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist=cdao.getCategory();
                %>
                <!--show categories-->
                <div class="col-md-2">
                    <div class="list-group mt-5">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action  text-dark" style="font-family: 'Sawarabi Mincho', sans-serif;">
                          All Products Category
                        </a>



                    <%
                        for(Category c: clist){

                            %>
                            
                            <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action" style="font-family: 'Sawarabi Mincho', sans-serif;"><%= c.getCategoryTitle()%></a>
                            <%    }   %>               
                    </div>
                </div>
                <!--show product-->
                <div class="col-md-10">
                    <!--row-->
                    <div class="row mt-5">
                        <!--col 12-->
                        <div class="col-md-12">
                            <div class="card-columns ">
                                <!--travsing product-->

                                <%
                                    for(Product p:list){

                                %>
<!--product card-->
                                <div class="card product-card" >
                                    <div class="container text-center">
                                        <img class="card-img-top m-2" src="img/Products/<%=p.getpPhoto()%>" style="max-height: 200px; max-width: 100%; width: auto;" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title" style="font-family: 'Sawarabi Mincho', sans-serif;"><%=p.getpName()%></h5>
                                        <p class="card-text" style="font-family: 'Sawarabi Mincho', sans-serif;"><%=Helper.get10Words(p.getpDesc())%></p> 

                                    </div>
                                    <div class="card-footer text-center">
                                        <a href="#" class="btn custom-bg text-dark" onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>', <%=p.getPriceAfterDis()%>)" style="font-family: 'Sawarabi Mincho', sans-serif;">Add to Cart</a>
                                       <a href="#" class="btn btn-outline-success text-dark" style="font-family: 'Sawarabi Mincho', sans-serif;">&#x20B9;<%=p.getPriceAfterDis()%>
                                           /- <span style="font-size: 10px!important; font-style: italic!important" class="text-secondary "><span style='text-decoration: underline;'>&#x20B9;<%=p.getpPrice()%></span>,<%=p.getpDiscount()%>%</span></a>
                                    </div>
                                </div>

                                <%
                                    }
                                    if(list.size()==0){
                                    out.print("No item in this category");
                                    }
                                
                                
                                %>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <%@include file="components/common_modal.jsp" %>
        <%@include file="components/footer.jsp" %>
    </body>
</html>
