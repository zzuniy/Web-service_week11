<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<html>
<head>
    <title>삭제 처리 중...</title>
</head>
<body>
<script>
    const id = new URLSearchParams(location.search).get("id");

    fetch(`https://68db331c23ebc87faa323bc7.mockapi.io/employee/${id}`, {
        method: "DELETE"
    })
        .then(() => {
            alert("삭제 완료!");
            location.href = "list.jsp";
        });
</script>
</body>
</html>
