<%@page import="com.emergentes.modelo.Inscritos"%>
<%@page import="java.util.ArrayList"%>
<%
    if (session.getAttribute("listains") == null) {
        ArrayList<Inscritos> lista = new ArrayList<Inscritos>();
        session.setAttribute("listains", lista);
    }
    ArrayList<Inscritos> lista = (ArrayList<Inscritos>) session.getAttribute("listains");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
        <link rel="stylesheet" href="estilos.css"/>
    </head>
    <body>
        <h1>Listado de inscritos</h1>
        <div class="container">
            <a href="MainServlet?op=nuevo" class="blue">Nuevo</a>
            <table>
                <tr>
                    <th>Id</th>
                    <th>Fecha</th>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>Turno</th>
                    <th>Seminarios</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    if (lista != null) {
                        for (Inscritos item : lista) {
                %>
                <tr>
                    <td><%= item.getId()%></td>
                    <td><%= item.getFecha()%></td>
                    <td><%= item.getNombre()%></td>
                    <td><%= item.getApellido()%></td>
                    <td><%= item.getTurno()%></td>
                    <%
                        String semi="";
                        if(item.getSeminarios()!=null){
                            semi=String.join(", ", item.getSeminarios());                      
                        }else{
                            semi="";
                        }
                        
                    %>
                    <td><%= semi%></td>
                    <td>
                        <a href="MainServlet?op=editar&id=<%= item.getId()%>" class="green">Editar</a>
                    </td>
                    <td>
                        <a class="red" href="MainServlet?op=eliminar&id=<%= item.getId()%>" onclick="return(confirm('Esta seguro de eliminar ??'))">Eliminar</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </div>

    </body>
</html>
