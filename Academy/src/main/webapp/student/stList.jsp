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
		<H2>학생 목록 보기</H2>
		<a href="stMain.jsp">등록</a>
		<hr color=deepskyblue width=400>
		<table width=1000 border=1>
			<tr bgcolor=deepskyblue>
				<th width=5%>학생번호</th>
				<th width=5%>이름</th>
				<th width=5%>성별</th>
				<th width=10%>전화번호</th>
				<th width=20%>주소</th>
				<th width=10%>부모님 전화번호</th>
				<th width=5%>과</th>
				<th width=5%>교통</th>
				<th width=10%>수업료 지불 날짜</th>
				<th width=10%>성적</th>
				<th width=10%>기타</th>
				<th width=5%>반</th>
			</tr>
			<%
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/academy";
			String user = "root", pwd = "yejun1103";

			Connection con = DriverManager.getConnection(url, user, pwd);
			//out.println("DB연결성공:"+con);

			String sql = "select * from student order by student_id asc"; //아이디 오름차순정렬
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				String student_id = rs.getString("student_id");
				String student_name = rs.getString("student_name");
				String student_sex = rs.getString("student_sex");
				String student_num = rs.getString("student_num");
				String student_add = rs.getString("student_add");
				String student_pnum = rs.getString("student_pnum");
				String part = rs.getString("part");
				String traffic = rs.getString("traffic");
				String payment_date = rs.getString("payment_date");
				String grade = rs.getString("grade");
				String note = rs.getString("note");
				String student_class = rs.getString("student_class");
			%>
			<!-- -----------------출력---------------- -->
			<tr>
				<td><%=student_id%></td>
				<td><%=student_name%></td>
				<td><%=student_sex%></td>
				<td><%=student_num%></td>
				<td><%=student_add%></td>
				<td><%=student_pnum%></td>
				<td><%=part%></td>
				<td><%=traffic%></td>
				<td><%=payment_date%></td>
				<td><%=grade%></td>
				<td><%=note%></td>
				<td><%=student_class%></td>
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