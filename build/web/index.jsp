<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	
<html lang="pt">
	
    <head>
        <meta charset="utf-8">
        <title>Login</title>
        <link rel="shortcut icon" href="img/icon2.jpg">
        <link href="CSS/style.css" rel="stylesheet">
    </head>

    <body>
        <!--- Class Referente ao Background do site!!-->
        <video autoplay loop poster="img/bg3.webm" class="bg_video_index">
                <source src="img/bg3.webm" type="video/webm">
                <source src="img/bg3.mp4" type="video/mp4">

        </video>


        <!---Class referente ao tamanho da caixa do Fundo-->
        <div class="main-login">

            <!--- Class refente ao Lado Esquerdo aonde teve o input da Imagem! -->
            <div class="left-login">
                <h1><div style="font-size:40px;">Faça Login!</div><br>E saiba tudo sobre o Mundo do Hacking!</h1><br>
                <img src="HTML/imgbody.svg" class="left-login-image" alt="imgbody.svg">

            </div>

        <!---Class referente ao tamanho da caixa do card-->
        <div class="right-login">
            
            <!---Class referente a todo o Lado esquerdo onde está o card do Login! -->
            <div class="card-login">
                <h1>Login</h1>
                     
        <form action="JSP/confirmLogin.jsp" method="GET">

            <!---Class referente ao Texto de input "e-mail"-->
            <div class="textfield">
                <label for="usuario">E-mail</label>
                <input type="text" name="e-mail" placeholder="Digite seu e-mail" required>

            </div>

            <!---Class referente ao Texto de input "Senha"-->
            <div class="textfield">
                <label for="password">Senha</label>
                <input type="password" name="Senha" placeholder="Digite sua Senha" required>
            </div>
            
            <!-- Mensagem de erro de login -->
            <%
                try {
                    //Recebe parametro de erro passado em caso de falha em encontrar cadastro
                    Object error = request.getParameter("error");
                    String color = "";
                    
                    //Atribui cor à mensagem que será impressa se houver erro
                    if (error.equals("notFound")) {
                        color = "white";
                    }
                    
                    //Armazena mensagem de erro
                    String message = "<span style=\"color:"+color+";\">Login inválido";
                    
                    //Imprime a mensagem
                    out.println(message);
                } catch (NullPointerException e) {
                }
            %>
            
            <!--- Class referente ao Botão de "Entrar"-->	
            <button type="submit" class="btn-login">Entrar</button>
            
        </form>

        <!---Class referente a não possui cadastro!!-->
        <footer class="cadastro"> Não Possui Cadastro? <a href= "JSP/form.jsp" style="text-decoration:none"> Clique aqui.</a></footer>
    </body>

</html>

