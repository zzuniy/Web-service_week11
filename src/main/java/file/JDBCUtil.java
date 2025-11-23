import vo.BoardVO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class JDBCUtil {
    private static Connection con = null;

    public static Connection getConnection() {
        try {
            if (con == null) {
                Class.forName("org.mariadb.jdbc.Driver");  // MariaDB 드라이버!
                con = DriverManager.getConnection(
                        "jdbc:mysql://walab.handong.edu:3306/W25_22400790",
                        "W25_22400790",
                        "tai7Io"
                );
            }
        } catch (Exception e) {
            System.out.println("DB 연결 오류: " + e.getMessage());
        }
        return con;
    }

    public static class BoardDAO {
        public static class BoardDao {

            Connection conn = null;
            PreparedStatement sttmt = null;
            ResultSet rs = null;

            // SQL 쿼리
            private static String BOARD_INSERT = "insert into BOARD (title, name, detail) values (?, ?, ?)";
            private static String BOARD_UPDATE = "update BOARD set title = ?, name = ?, detail = ? where id = ?";
            private static String BOARD_DELETE = "delete from BOARD where id = ?";
            private static String BOARD_GET = "select * from BOARD where id = ?";
            private static String BOARD_LIST = "select * from BOARD order by id desc";

            public BoardDao() {
                conn = getConnection();
            }


    }
}
}
