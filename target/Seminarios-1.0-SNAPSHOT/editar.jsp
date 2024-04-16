<%@page import="com.emergentes.modelo.Inscritos"%>
<%
    Inscritos cal = (Inscritos) request.getAttribute("miObjetoInscripcion");
    String boton = (String) request.getAttribute("boton");
    String texto = (String) request.getAttribute("textBoton");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" href="estilos.css"/>
    </head>
    <body>
        <h1>Registro en Seminarios</h1>
        <div class="container">
            <form action="MainServlet" method="POST">
                <div class="form">
                    <div class="form-1">
                        <h2>Datos</h2>
                        <input type="hidden" name="txtId" value="<%= cal.getId() %>"  />
                        <div>
                            <label class="dato">Fecha: </label><input type="date" name="txtFecha" value="<%= cal.getFecha()%>">
                        </div>
                        <div>
                            <label class="dato">Nombre: </label><input type="text" name="txtNombre" value="<%= cal.getNombre()%>">
                        </div>
                        <div>
                            <label class="dato">Apellidos: </label><input type="text" name="txtApellido" value="<%= cal.getApellido()%>">
                        </div>
                        <div>
                            <label class="dato">Turno:</label>
                            <%
                            
                            String tu=cal.getTurno();
                            String ma="checked",ta="",no="";
                            
                            switch (tu) {
                                case "Manana":
                                    ma="checked";
                                    break;
                                case "Tarde":
                                    ta="checked";
                                    break;
                                case "Noche":
                                    no="checked";
                                    break;
                                default:
                                    break;
                            }
                            
                            %>

                            <label class="radio"><input type="radio" name="rdTurno" value="Manana" <%= ma %>> Mañana</label>
                            <label class="radio"><input type="radio" name="rdTurno" value="Tarde" <%= ta %>> Tarde</label>
                            <label class="radio"><input type="radio" name="rdTurno" value="Noche" <%= no %>> Noche</label>
                        </div>


                    </div>
                    <div class="form-2">
                        <h2>Seminarios disponibles</h2>
                        <%
                        
                        String ia="",ml="",sa="",re="";
                        
                        if(cal.getSeminarios() != null){
                            for(String item: cal.getSeminarios()){
                                if(item.equals("Inteligencia Artificial")){
                                    ia="checked";
                                }
                                if(item.equals("Machine Learning")){
                                    ml="checked";
                                }
                                if(item.equals("Simulacion con Arena")){
                                    sa="checked";
                                }
                                if(item.equals("Robotica Educativa")){
                                    re="checked";
                                }
                            }
                        }
                        
                        
                        %>
                        <label><input type="checkbox" name="ckSeminarios" value="Inteligencia Artificial" <%= ia %>> Inteligencia Artificial</label>
                        <label><input type="checkbox" name="ckSeminarios" value="Machine Learning" <%= ml %>> Machine Learning</label>
                        <label><input type="checkbox" name="ckSeminarios" value="Simulacion con Arena" <%= sa %>> Simulación con Arena</label>
                        <label><input type="checkbox" name="ckSeminarios" value="Robotica Educativa" <%= re %>> Robotica Educativa</label>
                    </div>
                </div>
                <input type="submit" value="<%= texto%>" class="<%= boton%>">

            </form>
        </div>
    </body>
</html>
