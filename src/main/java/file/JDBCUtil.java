package file;
import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {

    public static Connection getConnection() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            return DriverManager.getConnection(
                    "jdbc:mariadb://walab.handong.edu:3306/W25_22400790",
                    "W25_22400790",
                    "tai7Io"
            );
        } catch (Exception e) {
            System.out.println("DB 연결 오류: " + e.getMessage());
            return null;
        }
    }
}
