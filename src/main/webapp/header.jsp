<%@ page pageEncoding="UTF-8"%>
<!-- header.jsp -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    /* 헤더 고정 */
    header.navbar {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 1000;
    }
    body {
        padding-top: 70px; /* header 높이만큼 여백 */
        padding-bottom: 50px; /* footer 높이만큼 여백 */
    }
</style>

<header class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="list.jsp">Handong 게시판</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="list.jsp">목록</a></li>
                <li class="nav-item"><a class="nav-link" href="write.jsp">글쓰기</a></li>
            </ul>
        </div>
    </div>
</header>
