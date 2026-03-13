package util;

import java.sql.*;

public class DBConnection {

    private static final String URL = "jdbc:derby://localhost:1527/prosportarena;create=true";
    private static final String USER = "app";    // default for Derby
    private static final String PASSWORD = "app"; // default password

    public static Connection getConnection() throws Exception {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}