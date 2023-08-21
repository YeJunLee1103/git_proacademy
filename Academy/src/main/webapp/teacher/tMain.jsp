<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 페이지</title>
<link rel="stylesheet" a href="./css/style.css" />
</head>
<center>

<h1><a href="../user/userMain.jsp">PRO ACADEMY</a></h1>

	<!-- 선생님 등록  -->
	<hr color="red" width="400">
	<h2>선생님 등록</h2>
	<hr color="red" width="400">
	<form action="tAdd.jsp">
		<!-- method 지정하지않으면 Get방식 -->
		<table border=1>
			<tr>
			<tr>
				<td>선생님 번호</td>
				<td><input type="text" name="teacher_id" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="teacher_name" /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="text" name="teacher_sex" /></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="number" name="teacher_num" /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="teacher_add" /></td>
			</tr>
			<tr>
				<td>경력</td>
				<td><input type="text" name="career" /></td>
			</tr>
			<tr>
				<td>급여</td>
				<td><input type="number" name="salary" /></td>
			</tr>
			<tr>
				<td>과목</td>
				<td><input type="text" name="subject" /></td>
			</tr>

			<tr>
				<td>계약 기간</td>
				<td><input type="number" name="term" /></td>
			</tr>
			<tr>
				<td>기타</td>
				<td><input type="text" name="note" /></td>
			</tr>

		</table>
		<br> <input type="submit" value="등록"> <input type="reset"
			value="취소">

		</td>
		</tr>
		</table>
	</form>
	<br />

	<!-- 선생님 삭제  -->
	<hr width="400" color="yellow" />
	<h2>선생님 삭제</h2>
	<hr width="400" color="yellow" />

	<form action="tDel.jsp">
		삭제할 선생님의 선생님 번호: <input type="number" name="teacher_id"> <input
			type="submit" value="삭제">
	</form>
	<br />

	<!-- 선생님 목록  -->
	<hr width="400" color="deepskyblue" />
	<h2>선생님 목록</h2>
	<hr width="400" color="deepskyblue" />
	<a href="tList.jsp">목록 보기</a>

</center>


</nav>
</body>

</html>