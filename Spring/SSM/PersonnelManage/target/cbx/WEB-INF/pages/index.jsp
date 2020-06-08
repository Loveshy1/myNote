<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>人事管理系统</title>
	<!-- Bootstrap core CSS -->
	<link href="${request}/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="${request}/css/signin.css" rel="stylesheet">
</head>

<body class="text-center">
	<form class="form-signin" target="the_iframe">
		<img class="mb-4" src="${request}/img/bootstrap-solid.svg" alt="" width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">请登录</h1>
		<label class="sr-only">账号</label>
		<input type="text" class="form-control" id="username" placeholder="账号" required autofocus="">
		<label class="sr-only">密码</label>
		<input type="password" class="form-control" id="pwd" placeholder="密码" required>
		<div class="checkbox mb-3">
			<label>
			</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit" onclick="login()">登 录</button>
		<p class="mt-5 mb-3 text-muted">© 2020-2021</p>
	</form>
	<iframe id="is_iframe" name="the_iframe" style="display:none;"></iframe>
</body>
<script src="${request}/js/jquery.min.js"></script>
<script type="text/javascript">
	function login() {
		if ($('#username').val().trim() != "" && $('#pwd').val().trim() != "") {
			$.ajax({
				type: "post",
				data: { 'password':$("#pwd").val() ,'username':$('#username').val() },
				url: "login",
				dataType: 'json',
				async: false,
				success:function(data){
					if(data.length>0){
						alert("登陆成功！");
						window.location.href="dep/maneger";
					}
					else{
						alert("账号或密码错误！");
					}
				},
			});
		}

	}
</script>

</html>