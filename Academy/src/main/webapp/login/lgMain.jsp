<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<center>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width" , initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>PRO ACADEMY</title>

</head>

<body class="text-center">

	<hr width="400" color="purple" />
	<h1 class="navbar-brand">PRO ACADEMY</h1>
	<hr width="400" color="purple" />

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="lgAction.jsp">

					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="user_id" maxlength='20'>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="user_pw" maxlength='20'>
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="로그인">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

	</center>
</body>
</html>