package Database;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.Scanner;

public class Flights { //singleton class for single database
    
    private static Flights theDatabase;
    private Connection jdbc_connection;
    private Statement statement;
    private String url = "jdbc:mysql://localhost:3306/AirplaneDatabase";
    private String user = "BigMac";
    private String password = "1234";
    
    private Flights(String url, String user, String password){
        this.url = url;
        this.user = user;
        this.password = password;        
        connect();
    }

    public Flights getDatabase() { //returns database created
        if(theDatabase == null){
            Flights Data = new Flights(url, user, password);
            theDatabase = Data;
        }
        return theDatabase; 
    }

    public void connect(){

    }

    public void query(){

    }
}
