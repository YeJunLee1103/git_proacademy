<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
//1.검색할 사람의 이름을 받아오자
String student_name = request.getParameter("student_name");

//2.유효성 체크
if (student_name == null || student_name.trim().equals("")) {
	response.sendRedirect("stMain.jsp");
	return;

} //end if----------

//3.db연결하여 select문을 db에 전송

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/academy";
String user = "root", pwd = "yejun1103";
Connection con = DriverManager.getConnection(url, user, pwd);

String sql = "select count(*) from student where student_name=?";
String sql2 = "select * from student where student_name=?";

PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, student_name);
ResultSet rs = ps.executeQuery();

//4. 그 결과를 받아와서 테이블 형태로 보여주기
rs.next();
int count = rs.getInt(1);
%>

<body>
	<div align=center>

		<hr color=orange width=400>
		<H2>학생 정보 보기</H2>
		<a href="stMain.jsp">등록</a>
		<hr color=orange width=400>

		<table width=1000 border=1>
			<tr bgcolor=orange>
				<th width=5%>학생 번호</th>
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
			<!-- ------------------------- -->
			<%
			if (count > 0) {
				ps = con.prepareStatement(sql2);
				ps.setString(1, student_name);
				rs = ps.executeQuery();
				while (rs.next()) {
					String student_id = rs.getString(1);
					String student_name2 = rs.getString(2);
					String student_sex = rs.getString(3);
					String student_num = rs.getString(4);
					String student_add = rs.getString(5);
					String student_pnum = rs.getString(6);
					String part = rs.getString(7);
					String traffic = rs.getString(8);
					String payment_date = rs.getString(9);
					String grade = rs.getString(10);
					String note = rs.getString(11);
					String student_class = rs.getString(12);
			%>
			<tr>
				<td><%=student_id%></td>
				<td><%=student_name2%></td>
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
			<%
			} //end while
			out.println("<tr><td colspan=12>");
			out.println("<b>" + student_name + "(이)란 학생은 총" + count + "명입니다.</b>");
			out.println("</td></tr>");

			} else {
			out.println("<tr><td colspan=12>");
			out.println("<b>" + student_name + "(이)란 학생은 존재하지 않습니다.</b>");
			out.println("</td></tr>");

			} //end if
			%>
			<!-- ------------------------- -->
		</table>

	</div>

</body>

<%
//5. 연결된 자원 반납
if (rs != null)
	rs.close();
if (ps != null)
	ps.close();
if (con != null)
	con.close();
%>