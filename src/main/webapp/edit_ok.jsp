<%--
  Created by IntelliJ IDEA.
  User: heojueun
  Date: 25. 11. 16.
  Time: 오후 3:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수정 완료</title>
</head>
<body>

<script>
    const id = new URLSearchParams(location.search).get("id");

    fetch(`https://68db331c23ebc87faa323bc7.mockapi.io/employee/${id}`, {
        method: "DELETE"
    })
        .then(() => {
            alert("수정 완료!");
            location.href = "list.jsp";
        });
</script>
</body>
</html>
