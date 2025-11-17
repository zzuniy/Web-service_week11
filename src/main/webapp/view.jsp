<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
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


<div id="box">로딩 중...</div>

<script>
    const id = new URLSearchParams(location.search).get("id");

    fetch(`http://68db331c23ebc87faa323bc7.mockapi.io/employee/${id}`)
        .then(res => res.json())
        .then(item => {
            const created = new Date(item.createdAt).toLocaleString();

            document.getElementById('box').innerHTML = `
                <h2>${item.title}</h2>
                <div class="meta">작성자: ${item.name} | 작성일: ${created}</div>
                <div class="content">${item.detail}</div>

            <div class="actions" style="margin-top:20px;">
                <button onclick="location.href='list.jsp'">목록</button>
                <button onclick="location.href='edit.jsp?id=${item.id}'">수정</button>             
                <button onclick="location.href='delete_ok.jsp?id=${item.id}'">삭제</button>
            </div>

            `;
        });
</script>

</body>
</html>
