<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<!-- saved from url=(0052)http://getbootstrap.com/docs/4.0/examples/dashboard/ -->
<html lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>员工信息管理</title>
	<!-- Bootstrap core CSS -->
	<link href="${request}/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${request}/css/my-css.css">
	<!-- Custom styles for this template -->
	<link href="${request}/css/dashboard.css" rel="stylesheet">
	<style type="text/css">
		/* Chart.js */

		@-webkit-keyframes chartjs-render-animation {
			from {
				opacity: 0.99
			}

			to {
				opacity: 1
			}
		}

		@keyframes chartjs-render-animation {
			from {
				opacity: 0.99
			}

			to {
				opacity: 1
			}
		}

		.chartjs-render-monitor {
			-webkit-animation: chartjs-render-animation 0.001s;
			animation: chartjs-render-animation 0.001s;
		}
	</style>
</head>

<body>
	<div id="info_setting" style="position: fixed;width: 100%;height:100%;z-index: 9999;display: none;">
		<div class="row" style="margin-top: 5%;">
			<div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
				<div class="card card-primary">
					<div class="card-header">
						<h4>员工信息<button class="button-login" style="background-image:url(${request}/img/close.png);"
								onclick="hhide();"></button></h4>
					</div>
					<div class="card-body">
						<form id="upform" method="post" action="#" class="needs-validation" target="the_iframe">
							<div class="form-group">
								<label for="nname">姓名</label>
								<input id="nname" type="text" class="form-control" name="name" tabindex="1"
									required="required" autofocus>
							</div>
							<div class="form-group">
								<label >性别</label>
								<select id="ggender" class="form-control" name="gender" required="required" autofocus>
									<option value="1" selected>男</option>
									<option value="0">女</option>
								</select>
							</div>
							<div class="form-group">
								<label for="email">邮箱</label>
								<input id="email" type="email" class="form-control" name="email" tabindex="1"
									required="required" autofocus>
							</div>
							<div class="form-group">
								<label>部门名称</label>
								<select id="ddepartmentName" class="form-control" name="type">
								</select>
							</div>
							<div class="form-group">
								<label for="tel">电话</label>
								<input id="tel" type="number" class="form-control" name="tel" tabindex="1"
									required="required" autofocus>
							</div>
							<div class="form-group">
								<label for="bz">备注</label>
								<input id="bz" type="text" class="form-control" name="bz" tabindex="1"
									required="required" autofocus>
							</div>
							<input type="hidden" id="id" name="id" value="0">
							<div class="form-group">
								<button type="submit" onclick="putEmp()" class="btn btn-primary btn-block" tabindex="4" name="action"
									id="but">提交</button>
							</div>
						</form>
					</div>
				</div>
				<div style="margin: 10px"></div>
				<iframe id="is_iframe" name="the_iframe" style="display:none;"></iframe>
			</div>
		</div>
	</div>

	<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="">${username}</a>

		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap">
				<a class="nav-link" href="${request}/logout" onclick= "return confirm('是否确定');">注销</a>
			</li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item">
							<a class="nav-link" href="${request}/dep/maneger">
								<svg xmlns="" width="24" height="24" viewBox="0 0 24 24" fill="none"
									stroke="currentColor" stroke-width="2" stroke-linecap="round"
									stroke-linejoin="round" class="feather feather-home">
									<path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
									<polyline points="9 22 9 12 15 12 15 22"></polyline>
								</svg>
								部门管理
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" href="${request}/emp/in_emp">
								<svg xmlns="" width="24" height="24" viewBox="0 0 24 24" fill="none"
									stroke="currentColor" stroke-width="2" stroke-linecap="round"
									stroke-linejoin="round" class="feather feather-users">
									<path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
									<circle cx="9" cy="7" r="4"></circle>
									<path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
									<path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
								</svg>
								入职管理 <span class="sr-only">(current)</span>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${request}/emp/out_emp">
								<svg xmlns="" width="24" height="24" viewBox="0 0 24 24" fill="none"
									stroke="currentColor" stroke-width="2" stroke-linecap="round"
									stroke-linejoin="round" class="feather feather-layers">
									<polygon points="12 2 2 7 12 12 22 7 12 2"></polygon>
									<polyline points="2 17 12 22 22 17"></polyline>
									<polyline points="2 12 12 17 22 12"></polyline>
								</svg>
								离职管理
							</a>
						</li>
					</ul>
				</div>
			</nav>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
				<h2>员工信息管理</h2>
				<div style="margin-bottom: 20px;">
					<div>
						<div class="input-group" style="width: 70%;min-width: 500px; margin-bottom: 20px;">
							<a class="nav-link" style="margin-right: 20px;">姓名</a>
							<input id="name" type="text" class="form-control input-lg" style="margin-right: 30px;">
							<a class="nav-link" style="margin-right: 20px;">部门</a>
							<input type="text" id="departmentName" class="form-control input-group"
								style="margin-right: 30px;">
						</div>
					</div>
					<div class="input-group" style="width: 100%;min-width: 600px;">
						<a class="nav-link" style="margin-right: 20px;">性别</a>
						<div style="width: 15%;">
							<select class="form-control" id="gender">
								<option value="">全部</option>
								<option value="1">男</option>
								<option value="0">女</option>
							</select>
						</div>
						<a style="width: 50%;margin-bottom: 20px"></a>
						<span class="input-group-addon btn btn-primary" style="float: right;" onclick="search()">搜索</span>
						<a onclick="sshow(0,'add')" role="button" style="color: white;margin-left: 10px" class="btn btn-action badge-success" data-toggle="modal" data-target="#myModal1">添加</a>
					</div>
				</div>
				<div class="table-responsive">
					<table id="user_table" class="table table-striped table-sm">
					</table>
				</div>
			</main>
		</div>
	</div>

	<script src="${request}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${request}/js/popper.min.js"></script>
	<script type="text/javascript" src="${request}/js/bootstrap.min.js"></script>

	<!-- Icons -->
	<script type="text/javascript" src="${request}/js/feather.min.js"></script>
	<script>
		feather.replace()
	</script>

	<!-- Graphs -->
	<script type="text/javascript" src="${request}/js/Chart.min.js"></script>
	<script type="text/javascript" src="${request}/js/bootstrap-table.js"></script>
	<script type="text/javascript" src="${request}/js/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			loadtable();
			getDep();
		});
		function loadtable() {
			$('#user_table').bootstrapTable({
				method: "post",
				striped: false,
				singleSelect: false,
				url: "${request}/emp/getInEmp?name="+$('#name').val()+"&departmentName="+$('#departmentName').val()+"&gender="+$('#gender').val(),
				dataType: "json",
				pagination: true,
				pageSize: 3,
				pageNumber: 1,
				pageList: [3, 10, 20, "All"],
				smartDisplay: false,
				search: false,
				contentType: "application/x-www-form-urlencoded",
				queryParams: null,
				columns: [
					{
						title: "ID",
						field: 'id',
						align: 'center'
					},
					{
						title: '姓名',
						field: 'name',
						align: 'center'
					},
					{
						title: '性别',
						field: 'gender',
						align: 'center',
						formatter: getGender
					},
					{
						title: '邮箱',
						field: 'email',
						align: 'center'
					},
					{
						title: '部门',
						field: 'departmentName',
						align: 'center',
					},
					{
						title: '电话',
						field: 'tel',
						align: 'center',
					},
					{
						title: '入职时间',
						field: 'indate',
						align: 'center',
						formatter: getTime
					},
					{
						title: '备注',
						field: 'bz',
						align: 'center',
					},
					{
						title: '操作',
						field: 'id',
						align: 'center',
						valign: 'middle',
						formatter: actionFormatter
					}
				]
			});
		}
		function getTime(value, row, index) {
			var date = new Date(value);
			Y = date.getFullYear() + '-';
			M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
			D = date.getDate();
			return console.log(Y+M+D);
		}
		function search() {
			$('#user_table').bootstrapTable('destroy');
			loadtable();
		}
		function actionFormatter(value, row, index) {
			var id = value;
			var result = "";
			result += "<a onclick=\"sshow('" + id + "','update')\"  role=\"button\" class=\"btn btn-action badge-success\" style='color: white' data-toggle=\"modal\" data-target=\"#myModal1\">编辑</a>";
			return result;
		}
		function getGender(value, row, index) {
			if(value == 1)
				return '男';
			else
				return '女';
		}
		function hide() {
			$('#info_setting').hide();
		}
		function sshow(id, action) {
			$('#nname').val("");
			$('#gender').val("");
			$('#email').val("");
			$('#tel').val("");
			$('#bz').val("");

			$('#info_setting').show();
			$('#id').val(id);

			if (action == 'update') {
				$.ajax({
					type: "post",
					data: { "id": id },
					url: "${request}/emp/getOneEmp",
					dataType: 'json',
					async: true,
					success: function (data) {
						$('#nname').val(data[0].name);
						$('#gender').val(data[0].gender);
						$('#email').val(data[0].email);
						$('#tel').val(data[0].tel);
						$('#bz').val(data[0].bz);
						$('#ddepartmentName').val(data[0].departmentName);
					}
				});
				$('#but').val(action);
			} else {
				$('#but').val(action);
			}

		}
		function putEmp() {
			$.ajax({
				type: "post",
				data: { "id": $('#id').val(),"name": $('#nname').val(),"email": $('#email').val(),"bz": $('#bz').val(),"tel": $('#tel').val(),"departmentName": $('#ddepartmentName').val(),"gender": $('#ggender').val()},
				url: "${request}/emp/"+$('#but').val(),
				dataType: 'json',
				async: true,
				success: function (data) {
					if (data.length > 0)
						alert("提交成功！");
					hhide();
					search();
				}
			});
		}
		function getDep() {
			$.ajax({
				type: "post",
				data: {},
				url: "${request}/dep/getDep",
				dataType: 'json',
				async: true,
				success: function (data) {
					var obj = document.getElementById('ddepartmentName');
					for (var i = 0; i < data.length; i++)
						if(data[i].isdelete != 1)
							obj.options.add(new Option(data[i].departmentName, data[i].departmentName))
				}
			});
		}
		function hhide() {
			$('#info_setting').hide();
		}
	</script>

</body>

</html>