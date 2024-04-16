
package com.emergentes.controlador;

import com.emergentes.modelo.Inscritos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

  
  
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        Inscritos objInscrito = new Inscritos();
        int id, pos;
        
        HttpSession ses = request.getSession();
        ArrayList<Inscritos> lista = (ArrayList<Inscritos>) ses.getAttribute("listains");
        switch(op){
            case "nuevo":
                request.setAttribute("miObjetoInscripcion", objInscrito);
                request.setAttribute("textBoton", "Enviar registro");
                request.setAttribute("boton", "blue");
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarPorIndice(request, id);
                
                objInscrito = lista.get(pos);
                
                request.setAttribute("miObjetoInscripcion", objInscrito);
                request.setAttribute("textBoton", "Modificar registro");
                request.setAttribute("boton", "green");
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarPorIndice(request, id);
                if (pos >= 0) {
                    lista.remove(pos);
                }
                request.setAttribute("miObjetoInscripcion", lista);
                response.sendRedirect(request.getContextPath()+"/index.jsp");
                break;
            default:
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("txtId"));
        HttpSession ses = request.getSession();
        ArrayList<Inscritos> lista = (ArrayList<Inscritos>) ses.getAttribute("listains");
        Inscritos objInscrito = new Inscritos();
        objInscrito.setId(id);
        objInscrito.setNombre(request.getParameter("txtNombre"));
        objInscrito.setFecha(request.getParameter("txtFecha"));
        objInscrito.setApellido(request.getParameter("txtApellido"));
        objInscrito.setTurno(request.getParameter("rdTurno"));
        String[] opciones=request.getParameterValues("ckSeminarios");
        objInscrito.setSeminarios(opciones);
        
        
        if(id == 0){
            int idNuevo = obtenerId(request);
            objInscrito.setId(idNuevo);
            lista.add(objInscrito);
        }else{
            int pos = buscarPorIndice(request, id);
            lista.set(pos, objInscrito);
        }
        request.setAttribute("miObjetoInscripcion", lista);
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
   
        
    public int buscarPorIndice(HttpServletRequest request, int id){
        HttpSession ses = request.getSession();
        ArrayList<Inscritos> lista = (ArrayList<Inscritos>) ses.getAttribute("listains");
        
        int pos = -1;
        if (lista != null) {
            for(Inscritos ele : lista){
                pos++;
                if(ele.getId() == id){
                    break;
                }
            }
        }
        return pos;
    }
    
    public int obtenerId(HttpServletRequest request){
        HttpSession ses = request.getSession();
        ArrayList<Inscritos> lista = (ArrayList<Inscritos>) ses.getAttribute("listains");
        
        int idn = 0;
        for(Inscritos ele : lista){
            idn = ele.getId();
        }
        
        return idn+1;
    }

}
