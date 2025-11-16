<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <title>등록 결과</title>
</head>
<body>
<script>
    const id = new URLSearchParams(location.search).get("id");

    fetch(`https://68db331c23ebc87faa323bc7.mockapi.io/employee/${id}`, {
        method: "DELETE"
    })
        .then(() => {
            alert("등록 완료!");
            location.href = "list.jsp";
        });
</script>
</body>
</html>
