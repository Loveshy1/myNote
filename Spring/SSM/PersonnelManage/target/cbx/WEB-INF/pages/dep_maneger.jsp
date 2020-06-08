<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>部门管理页面</title>
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
	<div id="info_setting" style="position: fixed;width: 100%;height:100%;z-index: 9999;display: none">
		<div class="row" style="margin-top: 5%;">
			<div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
				<div class="card card-primary">
					<div class="card-header">
						<h4>部门信息<button class="button-login" style="background-image:url(${request}/img/close.png);"
								onclick="hhide();"></button></h4>
					</div>
					<div class="card-body">
						<form id="upform" method="post" class="needs-validation" target="the_iframe">
							<div class="form-group">
								<label for="ddepartmentName">部门名称</label>
								<input id="ddepartmentName" type="text" class="form-control" name="leader" tabindex="1"
									   required="required" autofocus>
							</div>
							<div class="form-group">
								<label for="lleader">领导人</label>
								<input id="lleader" type="text" class="form-control" name="leader" tabindex="1"
									required="required" autofocus>
							</div>
							<div class="form-group">
								<label for="detail">详细</label>
								<input id="detail" type="text" class="form-control" name="detail" tabindex="1"
									required="required" autofocus>
							</div>
							<input type="hidden" id="id" name="id" value="0">
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-block" tabindex="4" name="action"
									id="but" value="" onclick="putDep()">提交</button>
							</div>
						</form>
						<iframe id="is_iframe" name="the_iframe" style="display:none;"></iframe>
					</div>
				</div>
				<div style="margin: 10px"></div>
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
							<a class="nav-link active" href="${request}/dep/maneger">
								<svg xmlns="" width="24" height="24" viewBox="0 0 24 24"
									fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
									stroke-linejoin="round" class="feather feather-home">
									<path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
									<polyline points="9 22 9 12 15 12 15 22"></polyline>
								</svg>
								部门管理 <span class="sr-only">(current)</span>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${request}/emp/in_emp">
								<svg xmlns="" width="24" height="24" viewBox="0 0 24 24"
									fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
									stroke-linejoin="round" class="feather feather-users">
									<path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
									<circle cx="9" cy="7" r="4"></circle>
									<path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
									<path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
								</svg>
								入职管理
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${request}/emp/out_emp">
								<svg xmlns="" width="24" height="24" viewBox="0 0 24 24"
									fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
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
				<h2>部门信息</h2>
				<div class="input-group" style="width: 80%;min-width: 550px; margin-bottom: 20px;">
					<a class="nav-link" style="margin-right: 20px;" >部门名称</a>
					<input id="departmentName" type="text" class="form-control input-lg" style="margin-right: 30px;">
					<a class="nav-link" style="margin-right: 20px;" >领导人</a>
					<input id="leader" type="text" class="form-control input-group" style="margin-right: 30px;">
					<span class="input-group-addon btn btn-primary" onclick="search()">搜索</span>
					<a onclick="showin()" role="button" style="color: white;margin-left: 10px" class="btn btn-action badge-success" data-toggle="modal" data-target="#myModal1">添加</a>
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
		});
		function search() {
			$('#user_table').bootstrapTable('destroy');
			loadtable();
		}
		function loadtable() {
			$('#user_table').bootstrapTable({
				method: "post",
				striped: false,
				singleSelect: false,
				url: "${request}/dep/getDepList?leader="+$('#leader').val()+"&departmentName="+$('#departmentName').val(),
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
						title: '部门',
						field: 'departmentName',
						align: 'center',
					},
					{
						title: '领导者',
						field: 'leader',
						align: 'center',
					},
					{
						title: '详细',
						field: 'detail',
						align: 'center',
					},
					{
						title: '状态',
						field: 'isdelete',
						align: 'center',
						formatter: isdel
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
		};
		function actionFormatter(value, row, index) {
			var id = value;
			var result = "";
			if(row.isdelete!=1){
				result += "<a onclick=\"showup(" + id + ",'" + row.departmentName + "','" + row.leader + "','" + row.detail + "')\"  role=\"button\" style='color: white' class=\"btn btn-action badge-success\" data-toggle=\"modal\" data-target=\"#myModal1\">编辑</a>";
				result += "<a  onclick=\"deldep(" + id + ")\"class='btn btn-action badge-danger' style='margin-left: 10px;color: white'>关闭</a>";
			}
			return result;
		}
		function isdel(value, row, index) {
			var id = value;
			if (value == 1)
				return '停运';
			else
				return '运作';
		}
		function deldep(id) {
			$.ajax({
				type: "post",
				data: { "id": id },
				url: "${request}/dep/delDep",
				dataType: 'json',
				async: true,
				success: function (data) {
					if (data.length > 0)
						alert("停运成功！");
					search();
				}
			});
		}
		function putDep() {
			$.ajax({
				type: "post",
				data: { "id": $('#id').val(),"departmentName": $('#ddepartmentName').val(),"leader": $('#lleader').val(),"detail": $('#detail').val()},
				url: "${request}/dep/"+$('#but').val(),
				dataType: 'json',
				async: false,
				success: function (data) {
					if (data.length > 0)
						alert("提交成功！");
					else
						alert("部门已存在！")
					hhide();
					search();
				}
			});
		}
		function showup(id, departmentName, leader, detail) {
			$('#info_setting').show();
			$('#id').val(id);
			$('#ddepartmentName').val(departmentName);
			$('#lleader').val(leader);
			if(detail=='null')
				detail='';
			$('#detail').val(detail);
			$('#but').val('update');
		}
		function showin() {
			$('#info_setting').show();
			$('#id').val('0');
			$('#ddepartmentName').val('');
			$('#lleader').val('');
			$('#detail').val('');
			$('#but').val('add');
		}
		function hhide() {
			$('#info_setting').hide();
		}
	</script>
</body>

</html>