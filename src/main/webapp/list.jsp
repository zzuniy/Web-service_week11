<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="file.BoardDao" %>
<%@ page import="file.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="header.jsp" />

<%
    String keyword = request.getParameter("keyword");
    String type = request.getParameter("type");

    BoardDao dao = new BoardDao();
    List<BoardVO> list;

    if(keyword != null && !keyword.trim().isEmpty()){
        list = dao.search(type, keyword);
    } else {
        list = dao.getList();
    }

    request.setAttribute("list", list);
%>

<div class="container mt-4">
    <h1 class="text-center mb-4">ZZUNIY'S WORLD</h1>

    <!-- 검색 폼 -->
    <form method="get" action="list.jsp" class="d-flex mb-3">
        <input type="text" name="keyword" class="form-control me-2" placeholder="검색어 입력" value="${param.keyword}">
        <select name="type" class="form-select me-2">
            <option value="title" ${param.type == 'title' ? 'selected' : ''}>제목</option>
            <option value="name" ${param.type == 'name' ? 'selected' : ''}>작성자</option>
            <option value="detail" ${param.type == 'detail' ? 'selected' : ''}>내용</option>
        </select>
        <button type="submit" class="btn btn-primary">검색</button>
        <a href="write.jsp" class="btn btn-dark ms-2">글쓰기</a>
    </form>

    <!-- 게시물 목록 -->
    <table class="table table-striped table-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>액션</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="vo" items="${list}">
            <tr>
                <td>${vo.id}</td>
                <td><a href="view.jsp?id=${vo.id}">${vo.title}</a></td>
                <td>${vo.name}</td>
                <td>${vo.createdAt}</td>
                <td>${vo.cnt}</td>
                <td>
                    <a href="edit.jsp?id=${vo.id}" class="btn btn-sm btn-warning">수정</a>
                    <a href="delete_ok.jsp?id=${vo.id}" class="btn btn-sm btn-danger">삭제</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <c:if test="${fn:length(list) == 0}">
        <p class="text-center text-muted">검색 결과가 없습니다.</p>
    </c:if>
</div>

<jsp:include page="footer.jsp" />
