<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<body>
	<div align=center>

		<hr color=deepskyblue width=400>
		<H2>선생님 목록 보기</H2>
		<a href="tMain.jsp">등록</a>
		<hr color=deepskyblue width=400>
		<table width=1000 border=1>
			<tr bgcolor=deepskyblue>
				<th width=5%>선생님번호</th>
				<th width=5%>이름</th>
				<th width=5%>성별</th>
				<th width=10%>전화번호</th>
				<th width=20%>주소</th>
				<th width=10%>경력</th>
				<th width=5%>급여</th>
				<th width=5%>과목</th>
				<th width=10%>계약 기간</th>
				<th width=10%>기타</th>

			</tr>
			<%
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/academy";
			String user = "root", pwd = "yejun1103";

			Connection con = DriverManager.getConnection(url, user, pwd);
			//out.println("DB연결성공:"+con);

			String sql = "select * from teacher order by teacher_id asc"; //아이디 오름차순정렬
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				String teacher_id = rs.getString("teacher_id");
				String teacher_name = rs.getString("teacher_name");
				String teacher_sex = rs.getString("teacher_sex");
				String teacher_num = rs.getString("teacher_num");
				String teacher_add = rs.getString("teacher_add");
				String career = rs.getString("career");
				String salary = rs.getString("salary");
				String subject = rs.getString("subject");
				String term = rs.getString("term");
				String note = rs.getString("note");

			%>
			<!-- -----------------출력---------------- -->
			<tr>
				<td><%=teacher_id%></td>
				<td><%=teacher_name%></td>
				<td><%=teacher_sex%></td>
				<td><%=teacher_num%></td>
				<td><%=teacher_add%></td>
				<td><%=career%></td>
				<td><%=salary%></td>
				<td><%=subject%></td>
				<td><%=term%></td>
				<td><%=note%></td>

			</tr>
			<!-- ------------------------------------ -->
			<%
			} //End while-----------------
			%>
		</table>

	</div>

</body>

<%
if (rs != null)
	rs.close();
if (ps != null)
	ps.close();
if (con != null)
	con.close();
%>