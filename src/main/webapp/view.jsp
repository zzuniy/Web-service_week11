<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="file.BoardDao" %>
<%@ page import="file.BoardVO" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    BoardDao dao = new BoardDao();
    BoardVO vo = dao.getBoard(id);
%>

<html>
<head>
    <title>게시물 상세보기</title>
    <style>
        body {
            margin: 100px auto;
            font-family: Arial, sans-serif;
            max-width:900px;
            padding:0 16px; }
        .meta { color:#666;
            margin-bottom:12px; }
        .content {
            padding:16px;
            border:1px solid #eee;
            background:#fafafa;
            line-height:1.6;
        }
        .actions a {
            margin-right:10px;
        }

        .actions button {
            padding: 8px 16px;
            margin-right: 10px;
            border: 1px solid #ccc;
            background-color: #f5f5f5;
            cursor: pointer;
            border-radius: 4px;
        }
        .actions button:hover {
            background-color: #e0e0e0;
        }

    </style>
</head>
<body>
<h2><%= vo.getTitle() %></h2>
<div class="meta">
    작성자: <%= vo.getName() %> | 작성일: <%= vo.getCreatedAt() %>
</div>
<div class="content"><%= vo.getDetail() %></div>

<div class="actions" style="margin-top:20px;">
    <button onclick="location.href='list.jsp'">목록</button>
    <button onclick="location.href='edit.jsp?id=<%= vo.getId() %>'">수정</button>
    <button onclick="location.href='delete_ok.jsp?id=<%= vo.getId() %>'">삭제</button>
</div>



</body>
</html>

<%@ include file="footer.jsp" %>