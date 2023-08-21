<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//[1] 삭제하려는 사람의 ID값을 받아오자
	String teacher_id = request.getParameter("teacher_id");

	//[2] 유효성 체크
	if (teacher_id == null || teacher_id.trim().equals("")) {

		response.sendRedirect("tMain.jsp");
		//널일 경우 tMain.jsp페이지로 돌려보낸다.

		return;
	}

	//[3] db와 연결하여 delete문을 전송
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/academy";
	String user = "root", pwd = "yejun1103";

	Connection con = DriverManager.getConnection(url, user, pwd);

	String sql = "delete from teacher where teacher_id = ?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, teacher_id);
	int result = ps.executeUpdate();

	//[4] 그 실행 결과를 스크립트 로 처리
	String msg = "선생님 삭제";
	String urlMove = "tMain.jsp";
	if (result > 0) {
		msg += " 성공!";
		urlMove = "tMain.jsp";
	} else {
		msg += " 실패";
	}
	%>
	<script>
                alert("<%=msg%>");
                location.href="<%=urlMove%>";
	</script>
	<%
	//[5] db연결 자원 반납

	if (ps != null)
		ps.close();
	if (con != null)
		con.close();
	%>
</body>
</html>