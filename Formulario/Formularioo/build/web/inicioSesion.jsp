<%-- 
    Document   : inicioSesion
    Created on : 13/05/2017, 07:02:37 PM
    Author     : Sosa Estrada María Fernanda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%
    
    String btnRegistrar = request.getParameter("btnReg");
    if(btnRegistrar != null){
        String Nombre = request.getParameter("Nombre");
        String ApellidoPaterno = request.getParameter("ApellidoPaterno");
        String ApellidoMaterno = request.getParameter("ApellidoMaterno");
        String Escuela = request.getParameter("Escuela");
        int Genero = Integer.parseInt(request.getParameter("Genero"));
                
        Controlador.claseDelUsuario perX = new Controlador.claseDelUsuario();
        
        perX.RgistraUSR(Nombre, ApellidoPaterno, ApellidoMaterno, Escuela, Genero);
        
        
           Controlador.claseDelUsuario per = new Controlador.claseDelUsuario(Nombre, ApellidoPaterno);

               if (!per.validaUsr()) {
                   response.sendRedirect("index.html");
               } else {
                   HttpSession crearLaSesion = request.getSession(true);
                   crearLaSesion.setAttribute("idUsr", per.IDUSR());
                   response.sendRedirect("Principal.jsp");
               }
        
        
    }
    

%>
        
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

