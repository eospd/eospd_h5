<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<jsp:include page="header.jsp"></jsp:include>

<body>

	<div id="wrapper">

		<jsp:include page="left_sidebar.jsp"></jsp:include>

		<div id="page-wrapper">

			<div class="row">
				<div class="col-lg-12">

					<div class="panel panel-default">
						<div class="panel-heading">数据管理</div>
						<div class="panel-body">
							<table class="table table-bordered" id="filter_table">
								<tr>
									<th>
										<div class="pull-left">累计</div>
									</th>
									<th style="width: 400px;">
										<div class="input-group input-daterange pull-right">
											<input type="text" class="form-control" value=""> <span
												class="input-group-addon">到</span> <input type="text"
												class="form-control" value="">
										</div>
									</th>
								</tr>
							</table>
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dm_table">
									<thead>
										<tr>
											<th>采集时间</th>
											<th>断点续传</th>
											<th>电支路</th>
											<th>插值标志</th>
											<th>总电量</th>
											<th>总电量错误标志</th>
											<th>总电量差值</th>
											<th>总电量归零标志</th>
											<th>总功率</th>
											<th>总功率因数</th>
											<th>A相电流</th>
											<th>B相电流</th>
											<th>C相电流</th>
											<th>A相电压</th>
											<th>B相电压</th>
											<th>C相电压</th>
										</tr>
									</thead>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
					</div>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>

	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript"
		src="js/bootstrap-datepicker.zh-CN.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/sb-admin-2.js"></script>
	<script src="js/echarts.js"></script>
	<script src="js/eospd.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(
				function() {
					$('#dm_table').DataTable({
						"processing" : true,
						"serverSide" : true,
						"ajax" : {
							"url" : "/eospd_h5/dm/list",
							"type" : "POST"
						},
						"columns" : [ {
							"data" : "currentTime"
						}, {
							"data" : "bpSign"
						}, {
							"data" : "dataUrl"
						}, {
							"data" : "ivSign"
						}, {
							"data" : "p1Pv"
						}, {
							"data" : "p1Err"
						}, {
							"data" : "p1Dv"
						}, {
							"data" : "p1Rsz"
						}, {
							"data" : "p2Pv"
						}, {
							"data" : "p3Pv"
						}, {
							"data" : "p4Pv"
						}, {
							"data" : "p5Pv"
						}, {
							"data" : "p6Pv"
						}, {
							"data" : "p7Pv"
						}, {
							"data" : "p8Pv"
						}, {
							"data" : "p9Pv"
						} ]
					});

					$('.input-daterange input').each(
							function() {
								var d = new Date()
								$(this).val(
										d.getFullYear() + "年"
												+ (d.getMonth() + 1) + "月"
												+ (d.getDay() + 1) + "日");
								$(this).datepicker({
									language : 'zh-CN',
									autoclose : true,
									todayHighlight : true,
									todayBtn : "linked"
								});
							});
				});
	</script>

</body>

</html>