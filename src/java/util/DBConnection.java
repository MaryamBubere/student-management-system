package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            String host = System.getenv("MYSQLHOST");

            if (host != null) {
                // Railway environment
                String port = System.getenv("MYSQLPORT");
                String db = System.getenv("MYSQLDATABASE");
                String user = System.getenv("MYSQLUSER");
                String password = System.getenv("MYSQLPASSWORD");

                String url = "jdbc:mysql://" + host + ":" + port + "/" + db +
                        "?useSSL=false&allowPublicKeyRetrieval=true";

                con = DriverManager.getConnection(url, user, password);

            } else {
                // Local environment
                String url = "jdbc:mysql://localhost:3306/studentdb";
                con = DriverManager.getConnection(url, "root", "root");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}
