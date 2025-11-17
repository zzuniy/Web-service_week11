<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<html>
<head>
    <title>게시물 수정</title>
    <style>
        body { font-family: Arial, sans-serif; max-width:900px; margin:20px auto; padding:0 16px; }
        input, textarea { width:100%; padding:10px; margin:8px 0; }
        button { padding:10px 18px; }
    </style>
</head>
<body>

<h1>게시물 수정</h1>

<div id="box">로딩 중...</div>

<script>
    const id = new URLSearchParams(location.search).get("id");

    // 기존 데이터 가져오기
    fetch(`http://68db331c23ebc87faa323bc7.mockapi.io/employee/${id}`)
        .then(res => res.json())
        .then(item => {
            document.getElementById('box').innerHTML = `
                <label>제목</label>
                <input id="title" value="${item.title}">

                <label>작성자</label>
                <input id="name" value="${item.name}">

                <label>내용</label>
                <textarea id="detail" rows="10">${item.detail}</textarea>

                <button onclick="location.href='edit_ok.jsp'">수정 완료</button>
                <button onclick="location.href='list.jsp'">취소</button>

            `;
        });


</script>

</body>
</html>
