package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDAO {

    public Connection getConnection() throws ClassNotFoundException {

        //Inicializa variável de conexao
        Connection con = null;

        try {
            //Retorna um objeto associado a String passada
            Class.forName("com.mysql.jdbc.Driver");

            //Armazena a URL do banco de dados local
            String url = "jdbc:mysql://localhost:3306/web_app_db?user=root&password=";

            //Executa a conexao por meio da URL
            con = DriverManager.getConnection(url);

        } catch(SQLException e) {
        }

        //Retorna a conexão já estabelecida
        return con;
    }
}

