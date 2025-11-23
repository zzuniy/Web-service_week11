<%@ include file="header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="file.BoardDao" %>
<%@ page import="file.BoardVO" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%
    String title = request.getParameter("title");
    String name = request.getParameter("name");
    String detail = request.getParameter("detail");

    BoardVO vo = new BoardVO();
    vo.setTitle(title);
    vo.setName(name);
    vo.setDetail(detail);

    BoardDao dao = new BoardDao();
    int result = dao.insert(vo);

    if(result > 0){
        response.sendRedirect("list.jsp");
    }

%>

<%-- 여기서부터 HTML 출력 --%>
<% if(result <= 0) { %>
<h3>게시글 등록 실패</h3>
<a href='write.jsp'>다시 작성</a>
<% } %>
<%---- %>

