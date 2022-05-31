<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.LoginDAO"%>
<%@page import="com.DTO.LoginDTO"%>
<%@page import="javax.swing.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%	
            try {
                //Armazena dados de cadastro passados pelo usuario
                String name = request.getParameter("usuario");
                String email = request.getParameter("e-mail");
                String pw1 = request.getParameter("Senha1");
                String pw2 = request.getParameter("Senha2");
                boolean error = false;
                
                //Verifica se as senhas passadas sao correspondentes
                //Aborta a execucao se forem diferentes
                if (!pw1.equals(pw2)) {
                    response.sendRedirect("form.jsp?error=diffPasswords");
                    error = true;
                }
                
                //Recebe lista de logins cadastrados
                LoginDAO loginDAO = new LoginDAO();
                ArrayList<LoginDTO> loginList = loginDAO.select();
                
                //Verifica a existencia do email passado no banco de dados
                for (LoginDTO login : loginList) {
                    boolean condition = login.getEmail().equals(email);
                    
                    //Aborta a execucao se o cadastro já existir
                    if (condition) {
                        response.sendRedirect("form.jsp?error=alreadyExists");
                        error = true;
                    }
                }
                
                //Se não houver ocorrido nenhum erro, realiza o armazenamento do cadastro
                if (!error) {
                    //Instancia objeto login 
                    LoginDTO objLoginDTO = new LoginDTO();
                    objLoginDTO.setName(name);
                    objLoginDTO.setEmail(email);
                    objLoginDTO.setPassword(pw1);

                    //Armazena o login no banco
                    boolean result = loginDAO.insert(objLoginDTO);

                    //Redireciona para o formulario indicando sucesso ou falha no cadastro
                    if(result) {
                        response.sendRedirect("form.jsp?success=true");
                    } else {
                        response.sendRedirect("form.jsp?success=false");
                    }
                }
            } catch(Exception e) {
            }

        %>
        
    </body>
</html>
