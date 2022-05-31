<%@page import="com.DAO.LoginDAO"%>
<%@page import="com.DTO.LoginDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                //Recebe lista de logins cadastrados
                LoginDAO loginDAO = new LoginDAO();
                ArrayList<LoginDTO> loginList = loginDAO.select();

                //Armazena dados de login passados pelo usuario
                String email = request.getParameter("e-mail");
                String password = request.getParameter("Senha");

                //Armazena resultado da busca pelos dados de login
                boolean match = false;

                for (LoginDTO login : loginList) {
                    //Compara os dados passados com dados cadastrados
                    boolean condition = login.getEmail().equals(email) & login.getPassword().equals(password);
                    
                    if (condition) {
                        //Recebe true se os dados passados corresponderem aos dados cadastrados
                        match = true;
                    }
                }
                
                //Faz login se os dados passados estiverem corretos, 
                //caso contrario permanece na pagina de login
                if (match) {
                    response.sendRedirect("/AplicacaoWebSeminario/HTML/home.html");
                } else {
                    response.sendRedirect("/AplicacaoWebSeminario?error=notFound");
                }
            } catch (Exception e) {
            }
        %>

    </body>
</html>
