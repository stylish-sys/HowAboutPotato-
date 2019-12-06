<%@ page contentType="text/html; charset=UTF-8"%>

<%
	session.invalidate(); //모든 것을 전부 지우겠다. (id랑 grade 다 지워야 함)
	//id만 넣었으므로, session.removeAttribute("id");해도 됨

	response.sendRedirect("../index.jsp");
%>