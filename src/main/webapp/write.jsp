<%@ include file="header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="file.BoardDao" %>
<%@ page import="file.BoardVO" %>
<%
    request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
    <title>글쓰기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 700px;
            margin: 20px auto;
            padding: 0 16px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            margin-top: 100px;
        }


        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin: 6px 0 12px 0;
            box-sizing: border-box;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: Black;
            color: white;
            border: none;
            border-radius: 4px;

            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        form {
            display: flex;
            flex-direction: column;
        }
    </style>
</head>
<body>
<h2>게시글 작성</h2>
<form method="post" action="write_ok.jsp">
    <label>제목:</label>
    <input type="text" name="title" required>

    <label>작성자:</label>
    <input type="text" name="name" required>

    <label>내용:</label>
    <textarea name="detail" rows="5" required></textarea>

    <input type="submit" value="등록">
</form>
</body>
</html>
<%@ include file="footer.jsp" %>