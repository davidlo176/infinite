<%-- 
    Document   : pagina_producto
    Created on : 21/05/2018, 05:15:07 PM
    Author     : David
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%models.product producto = models.product.get_active_product();%>
        <div class="container"><br><br><br>
            <center><h1><%out.println(producto.get_name().toUpperCase());%></h1></center>
            <div class="i-am-centered">
                <div class="row">                
                    <div class="col-md-6">                            
                        <div class="jumbotron">
                            <h2>Categoria:</h2><h3> <%out.println(producto.get_category());%></h3><br><br>
                            <h2>Precio: <%out.println(producto.get_price());%></h2><br>
                            <h2>Descripcion: </h2><h4><%out.println(producto.get_description());%></h4><br>
                            <h2>Vendedor: </h2><h3><%out.println(producto.get_seller().get_name());%></h3>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="jumbotron">
                            <h2>Comentarios</h2>
                        </div>
                        <%java.util.LinkedList comentarios = producto.get_comment_list();%>
                        <%int L = comentarios.size();
                            if (L > 0) {%>
                        <%for (int i = 0; i < L; i++) {
                                models.comment comentario = (models.comment) comentarios.get(i);%>
                        <div class="jumbotron">
                            <h4>Comentario # <%out.print(i+1);%></h4><br>
                            <h3>"<%out.println(comentario.get_description());%>"</h3>
                            <h4>Fecha: <%out.println(comentario.get_date());%></h4>
                            <h4>Autor: <%out.println(comentario.get_author().get_name());%></h4>
                            <%
                                if (models.user.get_active_user() instanceof models.admin) {%>
                            <br>
                            <form action='remove_comment' method="post" >
                                <label class="btn btn-lin">
                                    <button class="btn btn-info" name="producto" type="submit" value="<%out.print(i);%>">Eliminar Comentario</button>
                                </label>
                            </form>

                            <%    }
                            %>
                        </div>
                        <%}
                            }%>
                    </div>
                </div>
                <%

                    if (models.user.get_active_user() != null &&  models.product.search_product() && models.user.users.containsKey(models.user.get_active_user().get_nikname()) ) {
                %>
                <div class="btn-group" >
                    <form action='product_action' method="post" >
                        <label class="btn btn-lin">
                            <button class="btn btn-info" name="accion" type="submit" >Agregar a la lista de deseados</button>
                        </label>
                    </form>
                    <form action='product_action_2' method="post">
                        <label class="btn btn-lin">
                            <button class="btn btn-info" name="accion2" type="submit" >Eliminar de la lista de deseados</button>
                        </label>
                    </form>
                    <form action='product_action_3' method="post">
                        <label class="btn btn-lin">
                            <button class="btn btn-info" name="accion3" type="submit" >Agregar al carrito</button>
                        </label>
                    </form>
                    <form action='product_action_4' method="post">
                        <label class="btn btn-link">
                            <button class="btn btn-info" name="accion4" type="submit" >Eliminar del carrito</button>
                        </label>
                    </form>
                    <form action='new_comment.jsp' method="post">
                        <label class="btn btn-link">
                            <button class="btn btn-info" name="accion5" type="submit" >Agregar comentario</button>
                        </label>
                    </form>
                </div>
                <%}%>
            </div>
        </div>
    </body>
</html>
<%@ include file="footer.jsp" %>
