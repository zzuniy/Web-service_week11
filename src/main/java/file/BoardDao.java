package file;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDao {

    private static final String BOARD_INSERT = "insert into BOARD (title, name, detail) values (?, ?, ?)";
    private static final String BOARD_UPDATE = "update BOARD set title=?, name=?, detail=? where id=?";
    private static final String BOARD_DELETE = "delete from BOARD where id=?";
    private static final String BOARD_GET = "select * from BOARD where id=?";
    private static final String BOARD_LIST = "select * from BOARD order by id desc";

    // 게시물 추가
    public int insert(BoardVO vo) {
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement sttmt = conn.prepareStatement(BOARD_INSERT)) {

            sttmt.setString(1, vo.getTitle());
            sttmt.setString(2, vo.getName());
            sttmt.setString(3, vo.getDetail());
            return sttmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 전체 목록 조회

    public List<BoardVO> getList() {
        List<BoardVO> list = new ArrayList<>();
        try (Connection conn = JDBCUtil.getConnection();

             PreparedStatement sttmt = conn.prepareStatement(BOARD_LIST);
             ResultSet rs = sttmt.executeQuery()) {

            while (rs.next()) {
                BoardVO vo = new BoardVO();
                vo.setId(rs.getInt("id"));
                vo.setTitle(rs.getString("title"));
                vo.setName(rs.getString("name"));
                vo.setDetail(rs.getString("detail"));
                vo.setCreatedAt(String.valueOf(rs.getTimestamp("createdAt")));
                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 특정 게시물 조회
    public BoardVO getBoard(int id) {
        BoardVO vo = null;
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement sttmt = conn.prepareStatement(BOARD_GET)) {

            sttmt.setInt(1, id);
            try (ResultSet rs = sttmt.executeQuery()) {
                if (rs.next()) {
                    vo = new BoardVO();
                    vo.setId(rs.getInt("id"));
                    vo.setTitle(rs.getString("title"));
                    vo.setName(rs.getString("name"));
                    vo.setDetail(rs.getString("detail"));
                    vo.setCreatedAt(String.valueOf(rs.getTimestamp("createdAt")));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vo;
    }

    // 게시물 수정
    public int update(BoardVO vo) {
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement sttmt = conn.prepareStatement(BOARD_UPDATE)) {

            sttmt.setString(1, vo.getTitle());
            sttmt.setString(2, vo.getName());
            sttmt.setString(3, vo.getDetail());
            sttmt.setInt(4, vo.getId());
            return sttmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 게시물 삭제
    public int delete(int id) {
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement sttmt = conn.prepareStatement(BOARD_DELETE)) {

            sttmt.setInt(1, id);
            return sttmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public List<BoardVO> search(String type, String keyword) {
        List<BoardVO> list = new ArrayList<>();
        String sql = "SELECT * FROM BOARD WHERE " + type + " LIKE ? ORDER BY id DESC";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement sttmt = conn.prepareStatement(sql)) {

            sttmt.setString(1, "%" + keyword + "%");
            try (ResultSet rs = sttmt.executeQuery()) {
                while (rs.next()) {
                    BoardVO vo = new BoardVO();
                    vo.setId(rs.getInt("id"));
                    vo.setTitle(rs.getString("title"));
                    vo.setName(rs.getString("name"));
                    vo.setDetail(rs.getString("detail"));
                    vo.setCreatedAt(String.valueOf(rs.getTimestamp("createdAt")));
                    list.add(vo);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
