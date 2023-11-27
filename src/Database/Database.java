package Database;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.Scanner;

public class Database { //singleton class for single database
    
    private static Database theDatabase;
    private Connection jdbc_connection;
    private String url = "jdbc:mysql://localhost:3306/AirplaneDatabase";
    private String user = "BigMac";
    private String password = "1234";
    
    private Database(String url, String user, String password){
        this.url = url;
        this.user = user;
        this.password = password;        
        connect();
    }

    public Database getDatabase() { //returns database created
        if(theDatabase == null){
            theDatabase = new Database(url, user, password);
        }
        return theDatabase; 
    }

    public void connect(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  //jdbc driver
            jdbc_connection = DriverManager.getConnection(url, user, password); //create connection
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void doQuery(String query){
        try {
            Statement statement = jdbc_connection.createStatement();
            statement.executeUpdate(query);
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
