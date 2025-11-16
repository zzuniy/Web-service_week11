<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP 게시판 시작 페이지</title>
    <style>
        body {

            font-family: Arial, sans-serif;
            max-width: 900px;
            margin: 300px auto;
            padding: 0 16px;
            text-align: center;
        }

        h1 {
            margin-bottom: 40px;
        }

        .btn {

            display: inline-block;
            padding: 12px 24px;
            background-color:black;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h1>WELCOME TO THE<br>
    ZZUNIY'S WORLD</h1>


<a href="list.jsp" class="btn">입장하기</a>
</body>
</html>
