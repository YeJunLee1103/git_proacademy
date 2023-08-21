<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
//[1] 사용자가 입력한 값을 받아오자.
String student_id = request.getParameter("student_id");
String student_name = request.getParameter("student_name");
String student_sex = request.getParameter("student_sex");
String student_num = request.getParameter("student_num");
String student_add = request.getParameter("student_add");
String student_pnum = request.getParameter("student_pnum");
String part = request.getParameter("part");
String traffic = request.getParameter("traffic");
String payment_date = request.getParameter("payment_date");
String grade = request.getParameter("grade");
String note = request.getParameter("note");
String student_class = request.getParameter("student_class");

out.println("student_id: " + student_id + ", student_name : " + student_name + ", student_sex: " + student_sex
		+ ", student_num : " + student_num + ", student_add : " + student_add + ", student_pnum : " + student_pnum
		+ ", part : " + part + ", traffic : " + traffic + ", payment_date : " + payment_date + ", grade : " + grade
		+ ", note : " + note + ", student_class :" + student_class);
//[2] 유효성 체크 -널, 빈문자 체크... 서버차원에서 체크
if (student_id == null || student_name == null || student_sex == null || student_num == null || student_add == null
		|| student_pnum == null || part == null || traffic == null || payment_date == null || grade == null
		|| note == null || student_class == null || student_id.trim().equals("") || student_name.trim().equals("")
		|| student_sex.trim().equals("") || student_num.trim().equals("") || student_add.trim().equals("")
		|| student_pnum.trim().equals("") || part.trim().equals("") || traffic.trim().equals("")
		|| payment_date.trim().equals("") || grade.trim().equals("") || note.trim().equals("")
		|| student_class.trim().equals("")) {
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

String sql = "INSERT INTO student values(?,?,?,?,?,?,?,?,?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, student_id);
ps.setString(2, student_name);
ps.setString(3, student_sex);
ps.setString(4, student_num);
ps.setString(5, student_add);
ps.setString(6, student_pnum);
ps.setString(7, part);
ps.setString(8, traffic);
ps.setString(9, payment_date);
ps.setString(10, grade);
ps.setString(11, note);
ps.setString(12, student_class);

int result = ps.executeUpdate();

if (result > 0) {
%>
<script>
	alert("학생등록 성공!");
	location.href = "stMain.jsp";
</script>
<%	
} else {
%>
<script>
	alert("학생등록 실패...");
	location.href = "stMain.jsp";
</script>
<%
}

//[4] 자원반납 : db와 연결 끊기
ps.close();
con.close();
%>