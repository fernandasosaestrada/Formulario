<%-- 
    Document   : Principal
    Created on : 13/05/2017, 11:52:11 PM
    Author     : VictoRezbeck
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
   HttpSession SessionAlgo = request.getSession();
   String idUsr = "0";
   
      
    if(SessionAlgo.getAttribute("idUsr") != null){
        idUsr = (String) SessionAlgo.getAttribute("idUsr").toString();
    
}    
    Controlador.claseDelUsuario x = new Controlador.claseDelUsuario(Integer.parseInt(idUsr));

    
if(!x.validaUsr()){
    response.sendRedirect("Index.html");
}
else{
    response.sendRedirect("Index.html");
}


 %>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    </body>
</html>

