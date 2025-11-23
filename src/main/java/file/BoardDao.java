import java.util.ArrayList;
import java.util.List;

public int insert(BoardVO.boardVO vo) {
    System.out.println("===> JDBC로 insertBoard() 실행");
    try {
        conn = getConnection();
        sttmt = conn.prepareStatement(BOARD_INSERT);
        sttmt.setString(1, vo.getTitle());
        sttmt.setString(2, vo.getName());
        sttmt.setString(3, vo.getDetail());
        int result = sttmt.executeUpdate();
        return result;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return 0;
}


public List<BoardVO.boardVO> getList() {
    List<BoardVO.boardVO> list = new ArrayList<>();

    try {
        conn = getConnection();
        sttmt = conn.prepareStatement(BOARD_LIST);
        rs = sttmt.executeQuery();

        while (rs.next()) {
            BoardVO.boardVO vo = new BoardVO.boardVO();
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


public BoardVO.boardVO getBoard(int id) {
    BoardVO.boardVO vo = new BoardVO.boardVO();

    try {
        conn = getConnection();
        sttmt = conn.prepareStatement(BOARD_GET);
        sttmt.setInt(1, id);
        rs = sttmt.executeQuery();

        if (rs.next()) {
            vo.setId(rs.getInt("id"));
            vo.setTitle(rs.getString("title"));
            vo.setName(rs.getString("name"));
            vo.setDetail(rs.getString("detail"));
            vo.setCreatedAt(String.valueOf(rs.getTimestamp("createdAt")));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return vo;
}


public int update(BoardVO.boardVO vo) {
    System.out.println("===> updateBoard() 실행");
    try {
        conn = getConnection();
        sttmt = conn.prepareStatement(BOARD_UPDATE);
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


public int delete(int id) {
    System.out.println("===> deleteBoard() 실행");
    try {
        conn = getConnection();
        sttmt = conn.prepareStatement(BOARD_DELETE);
        sttmt.setInt(1, id);
        return sttmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
    return 0;
}
        }