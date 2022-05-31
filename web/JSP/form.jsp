<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	
<html lang="pt">
	
<head>
	<meta charset="utf-8">
	<title>Cadastre-se</title>
	<link rel="shortcut icon" href="../img/icon2.jpg">
	<link href="../CSS/style.css"rel="stylesheet">
</head>
	
<body>
	<!--- Class Referente ao Background do site!!-->
	<video autoplay loop poster="../img/bg3.webm" class="bg_video">
            <source src="../img/bg3.webm" type="video/webm">
            <source src="../img/bg3.mp4" type="video/mp4">
	</video>
	

	<!---Class referente ao tamanho da caixa do Fundo-->
	<div class="main-login">

		<!--- Class refente ao Lado Esquerdo aonde teve o input da Imagem! -->
		<div class="left-login">
			<h1><div style="font-size:40px;">Cadastre-se!</div><br>E saiba tudo sobre o Mundo do Hacking!</h1><br>
			<img src="../HTML/bg_form.svg" class="left-login-image" alt="../HTML/bg_form.svg">
						
		</div>

	<!---Class referente ao tamanho da caixa do card-->
	<div class="right-login">

		<!---Class referente a todo o Lado esquerdo onde está o card do Login! -->
		<div class="card-nome">
			<h1>Cadastre-se</h1><br>

	<form action="insertLogin.jsp" method="post">
		<!---Class referente ao Texto de input "Nome"-->	
		<div class="textfield">
			<label for="usuario">Nome Completo</label>
			<input type="text" name="usuario" placeholder="Digite seu nome" required><br>
		
	
			<!---Class referente ao Texto de input "e-mail"-->
			<label class="digita-email">E-mail</label>
			<input type="email" name="e-mail" placeholder="Digite seu e-mail" required>
		</div>
	
		<!---Class referente ao Texto de input "Senhas"-->
		<div class="textfield">
			<label for="password">Crie uma Senha</label>
			<input type="password" name="Senha1" placeholder="Digite a Senha" required><br>
			<label for="password">Confirme a Senha </label>
			<input type="password" name="Senha2" placeholder="Digite a Senha" required>
		</div>
                
                <!-- Mensagens de erro de entrada de dados -->
                <%
                    try{
                        //Recebe parametro de erro passado em caso de falha na validacao de entrada
                        Object error = request.getParameter("error");
                        String message = "";
                        String color = "";
                        
                        //Armazena condicoes que geraram erro 
                        boolean case1 = error.equals("diffPasswords");
                        boolean case2 = error.equals("alreadyExists");
                        
                        //Testa as condicoes, gerando mensagens correspondentes aos erros
                        if (case1) {
                            color = "white";
                            message = "<span style=\"color:"+color+";\">Senhas não correspondem";
                        } else if (case2) {
                            color = "white";
                            message = "<span style=\"color:"+color+";\">E-mail já cadastrado!";
                        }
                        
                        //Imprime a mensagem
                        out.println(message); 

                    } catch(NullPointerException e) {
                        out.println("");
                    }
                %>
                
                <!-- Mensagem de sucesso ou erro de cadastro -->
                <%
                    try{
                        //Recebe parametro de erro passado em caso de falha na validacao de entrada
                        Object success = request.getParameter("success");
                        String message = "";
                        String color = "";
                        
                        //Armazena condicoes que geraram erro 
                        boolean case1 = success.equals("true");
                        boolean case2 = success.equals("false");
                        
                        //Testa as condicoes, gerando mensagens correspondentes aos erros
                        if (case1) {
                            color = "white";
                            message = "<span style=\"color:"+color+";\">Cadastro realizado!";
                        } else if (case2) {
                            color = "white";
                            message = "<span style=\"color:"+color+";\">Cadastro não realizado";
                        }
                        
                        //Imprime a mensagem
                        out.println(message); 

                    } catch(NullPointerException e) {
                        out.println("");
                    }
                %>
                
		<!--- Class referente ao Botão de "cadastrar"-->	
		<button type="submit" class="btn-login">Cadastrar</button>
	</form>
	
	<!--- Class referente ao Botão de voltar"-->					
	<footer class="back"><a href= "../index.jsp" style="text-decoration:none"> Voltar para Login.</footer><a>

</body>


</html>
    

