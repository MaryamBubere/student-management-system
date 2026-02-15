package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    // Railway PUBLIC MySQL connection
    private static final String URL =
        "jdbc:mysql://shortline.proxy.rlwy.net:55061/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

    private static final String USER = "root";

    private static final String PASSWORD = "VStvBnvoecnYbntrbogMvNVZFxkiZANM";

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(URL, USER, PASSWORD);

            if (con != null) {
                System.out.println("Database Connected Successfully");
            }

        } catch (Exception e) {

            System.out.println("Database Connection Failed");
            e.printStackTrace();

        }

        return con;
    }
}
