package com.DAO;

import com.DTO.LoginDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LoginDAO {
    //Envia queries para serem executadas no banco de dados
    PreparedStatement pstm;

    //Armazena dados cadastrados pelo usuario no banco de dados
    public boolean insert(LoginDTO objLogin) throws ClassNotFoundException {
        //Armazena a query que será executada
        String query = "INSERT INTO USER_LOGIN(NAME, EMAIL, PASSWORD) VALUES (?, ?, ?)";

        try {
            //Realiza conexao com o banco de dados
            Connection con = new ConnectionDAO().getConnection();

            //Transporta dados inseridos pelo usuario para a query
            pstm = con.prepareStatement(query);
            pstm.setString(1, objLogin.getName());
            pstm.setString(2, objLogin.getEmail());
            pstm.setString(3, objLogin.getPassword());

            //Executa a query e encerra a conexao
            pstm.execute();
            pstm.close();
            con.close();

            return true; //Indica insercao realizada com sucesso

        } catch(SQLException e) {

            return false; //Indica insercao nao realizada com sucesso
        }
    }
		
    //Retorna uma lista dos dados cadastrados no banco de dados 
    public ArrayList<LoginDTO> select() throws ClassNotFoundException {
        //Armazena logins cadastrados
        ArrayList<LoginDTO> loginList = new ArrayList<>();
        
        //Armazena a query que será executada; Retorna todos os campos da tabela
        String query = "SELECT * FROM USER_LOGIN";
        
        try {
            //Realiza conexao com o banco de dados
            Connection con = new ConnectionDAO().getConnection();
            
            //Executa a query e armazena o resultado
            pstm = con.prepareStatement(query);
            ResultSet rs = pstm.executeQuery();
            
            while (rs.next()) {
                //Trasnfere os dados das colunas de uma linha da tabela para um objeto
                LoginDTO login = new LoginDTO();
                login.setName(rs.getString("NAME"));
                login.setEmail(rs.getString("EMAIL"));
                login.setPassword(rs.getString("PASSWORD"));
                
                //Armazena o objeto na lista
                loginList.add(login);
            }
            
            //Encerra conexao com o banco de dados
            pstm.close();
            con.close();
  
        } catch(SQLException e) {
        }
        
        return loginList;
    }
}
