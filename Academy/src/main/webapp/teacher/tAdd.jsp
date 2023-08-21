<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
//[1] 사용자가 입력한 값을 받아오자.
String teacher_id = request.getParameter("teacher_id");
String teacher_name = request.getParameter("teacher_name");
String teacher_sex = request.getParameter("teacher_sex");
String teacher_num = request.getParameter("teacher_num");
String teacher_add = request.getParameter("teacher_add");
String career = request.getParameter("career");
String salary = request.getParameter("salary");
String subject = request.getParameter("subject");
String term = request.getParameter("term");
String note = request.getParameter("note");


out.println("teacher_id: " + teacher_id + ", teacher_name : " + teacher_name + ", teacher_sex: " + teacher_sex
		+ ", teacher_num : " + teacher_num + ", teacher_add : " + teacher_add + ", career : " + career
		+ ", salary : " + salary + ", subject : " + subject + ", term : " + term + ", note : " + note);
//[2] 유효성 체크 -널, 빈문자 체크... 서버차원에서 체크
if (teacher_id == null || teacher_name == null || teacher_sex == null || teacher_num == null || teacher_add == null
		|| career == null || salary == null || subject == null || term == null || note == null
		|| teacher_id.trim().equals("") || teacher_name.trim().equals("")
		|| teacher_sex.trim().equals("") || teacher_num.trim().equals("") || teacher_add.trim().equals("")
		|| career.trim().equals("") || salary.trim().equals("") || subject.trim().equals("")
		|| term.trim().equals("") || note.trim().equals("")) {
%>
<script type="text/javascript">
	alert("모든 값을 입력해야합니다.");
	history.back();
</script>


<%
return;
} //if-----------------------------------------
//[3] DB와 연결하여 insert문을 전송
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/academy";
String user = "root", pwd = "yejun1103";

Connection con = DriverManager.getConnection(url, user, pwd);
out.println("<br/> DB연결 성공: " + con);

String sql = "INSERT INTO teacher values(?,?,?,?,?,?,?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, teacher_id);
ps.setString(2, teacher_name);
ps.setString(3, teacher_sex);
ps.setString(4, teacher_num);
ps.setString(5, teacher_add);
ps.setString(6, career);
ps.setString(7, salary);
ps.setString(8, subject);
ps.setString(9, term);
ps.setString(10, note);


int result = ps.executeUpdate();

if (result > 0) {
%>
<script>
	alert("선생님등록 성공!");
	location.href = "tMain.jsp";
</script>
<%
} else {
%>
<script>
	alert("선생님등록 실패...");
	location.href = "tMain.jsp";
</script>
<%
}

//[4] 자원반납 : db와 연결 끊기
ps.close();
con.close();
%>