<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 페이지</title>
<link rel="stylesheet" a href="./css/style.css" />
</head>
<center>

<h1><a href="../user/userMain.jsp">PRO ACADEMY</a></h1>

	<!-- 학생 등록  -->
	<hr color="red" width="400">
	<h2>학생 등록</h2>
	<hr color="red" width="400">
	<form action="stAdd.jsp">
		<!-- method 지정하지않으면 Get방식 -->
		<table border=1>
			<tr>
			<tr>
				<td>학생 번호</td>
				<td><input type="text" name="student_id" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="student_name" /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="text" name="student_sex" /></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="number" name="student_num" /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="student_add" /></td>
			</tr>
			<tr>
				<td>부모님 전화번호</td>
				<td><input type="number" name="student_pnum" /></td>
			</tr>
			<tr>
				<td>과</td>
				<td><input type="text" name="part" /></td>
			</tr>
			<tr>
				<td>교통</td>
				<td><input type="text" name="traffic" /></td>
			</tr>

			<tr>
				<td>수업료 지불 날짜</td>
				<td><input type="text" name="payment_date" /></td>
			</tr>
			<tr>
				<td>성적</td>
				<td><input type="text" name="grade" /></td>
			</tr>
			<tr>
				<td>기타</td>
				<td><input type="text" name="note" /></td>
			</tr>
			<tr>
				<td>반</td>
				<td><input type="text" name="student_class" /></td>
			</tr>
		</table>
		<br> <input type="submit" value="등록"> <input type="reset"
			value="취소">

		</td>
		</tr>
		</table>
	</form>
	<br />

	<!-- 학생 검색  -->
	<hr width="400" color="orange" />
	<h2>학생 검색</h2>
	<hr width="400" color="orange" />
	<form action="stFind.jsp">
		검색할 학생의 이름: <input type="text" name="student_name"> <input
			type="submit" value="검색">
	</form>
	<br />

	<!-- 학생 삭제  -->
	<hr width="400" color="yellow" />
	<h2>학생 삭제</h2>
	<hr width="400" color="yellow" />

	<form action="stDel.jsp">
		삭제할 학생의 학생 번호: <input type="number" name="student_id"> <input
			type="submit" value="삭제">
	</form>
	<br />

	<!-- 학생 목록  -->
	<hr width="400" color="deepskyblue" />
	<h2>학생 목록</h2>
	<hr width="400" color="deepskyblue" />
	<a href="stList.jsp">목록 보기</a>

</center>


</nav>
</body>
</html>