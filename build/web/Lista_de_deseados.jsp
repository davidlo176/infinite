<%-- 
    Document   : Lista_de_deseados
    Created on : 20/05/2018, 10:12:33 PM
    Author     : pavilion
--%>
<%@ include file="header.jsp" %>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container"><br><br>
            <h1>Lista de deseados</h1><br><br>
            <%
                LinkedList lista = models.user.get_active_user().get_whishlist();
                System.out.println(lista);
                Iterator iter = lista.iterator();
                if (!lista.isEmpty()) {
                    while (iter.hasNext()) {

                        models.product producto = (models.product) iter.next();
            %>
            <div class="jumbotron">
                <h2>Nombre:</h2><h4><%out.println(producto.get_name());%></h4><br><br>
                <h2>Categoria:</h2><h4> <%out.println(producto.get_category());%></h4><br><br>
                <h2>Precio:</h2><h4> <%out.println(producto.get_price());%></h4><br>
                <h2>Descripcion: </h2><h4><p><%out.println(producto.get_description());%></p></h4><br>
                <h2>Vendedor: </h2><h4><%out.println(producto.get_seller().get_name());%></h4>
            </div>
            <% }
                } else {
                    out.println("De momento, usted no tiene productos en su lista de desados.");
                }
            %>
        </div>
    </body>
</html>

<%@ include file="footer.jsp" %>
