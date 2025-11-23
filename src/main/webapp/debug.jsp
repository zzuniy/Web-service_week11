<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>DB 디버깅</title>
</head>
<body>
<h2>DB 연결 & BOARD 데이터 확인</h2>

<%
    Connection conn = null;
    try {
        // MySQL 드라이버 로드
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 톰캣 환경용 DB 연결
        String url = "jdbc:mysql://walab.handong.edu:3306/W25_22400790";
        String user = "아이디";      // DB 계정
        String pass = "비밀번호";   // DB 비밀번호

        conn = DriverManager.getConnection(url, user, pass);

        if(conn != null) {
            out.println("<p>DB 연결 성공: " + conn + "</p>");
        } else {
            out.println("<p style='color:red'>DB 연결 실패</p>");
        }

        // BOARD 테이블 row count
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM BOARD");
        if(rs.next()) {
            out.println("<p>BOARD 테이블 ROW COUNT: " + rs.getInt(1) + "</p>");
        }

        // BOARD 테이블 실제 데이터 출력
        rs = stmt.executeQuery("SELECT * FROM BOARD");
        while(rs.next()) {
            out.println("<hr>");
            out.println("ID: " + rs.getInt("id") + "<br>");
            out.println("Title: " + rs.getString("title") + "<br>");
            out.println("Name: " + rs.getString("name") + "<br>");
            out.println("Detail: " + rs.getString("detail") + "<br>");
            out.println("CreatedAt: " + rs.getTimestamp("createdAt") + "<br>");
        }

        rs.close();
        stmt.close();

    } catch(Exception e) {
        out.println("<p style='color:red'>에러 발생: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        if(conn != null) {
            try { conn.close(); } catch(Exception e) {}
        }
    }
%>

</body>
</html>
