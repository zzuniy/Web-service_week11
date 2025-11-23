import java.sql.Connection;

public class TestDB {
    public static void main(String[] args) {
        Connection con = JDBCUtil.getConnection();

        if (con != null) {
            System.out.println("DB 연결 성공!");
        } else {
            System.out.println("DB 연결 실패...");
        }
    }
}
