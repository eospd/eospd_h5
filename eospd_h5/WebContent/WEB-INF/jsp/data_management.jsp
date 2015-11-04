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

						<div class="panel-body">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs">

								<li class="active"><a href="#home" data-toggle="tab">数据明细</a></li>

								<li class='dropdown'><a data-toggle="dropdown" href=""
									role="button" aria-expanded="false">全部仪表器 <span
										class="caret"></span>
								</a>
									<ul class="dropdown-menu">
										<li><a href="#"> 仪表器一 </a></li>
										<li><a href="#"> 仪表器二 </a></li>
										<li><a href="#"> 仪表器三 </a></li>
									</ul></li>

								<li class='dropdown nav-right'><a data-toggle="dropdown" href=""
									role="button" aria-expanded="false">全部采集器 <span
										class="caret"></span>
								</a>
									<ul class="dropdown-menu">
										<li><a href="#"> 采集器一 </a></li>
										<li><a href="#"> 采集器二 </a></li>
										<li><a href="#"> 采集器三 </a></li>
									</ul></li>

								<li><a data-toggle="tab">
										<div class="input-group input-daterange">
											<input type="text" class="form-control" value=""> <span
												class="input-group-addon">到</span> <input type="text"
												class="form-control" value="">
										</div>
								</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane fade in active" id="home">
									<div class="dataTable_wrapper">
										<table class="table table-striped table-bordered table-hover"
											id="dm_table">
											<thead>
												<tr>
													<th>时间</th>
													<th>能源ID</th>
													<th>仪表名称</th>
													<th>采集器ID</th>
													<th>采集器URL</th>
													<th>采集器地址</th>
													<th>采集器IP</th>
													<th>厂商</th>
													<th>p1Pv</th>
													<th>p1Err</th>
												</tr>
											</thead>
										</table>
									</div>
									<!-- /.table-responsive -->
								</div>
								<div class="tab-pane fade" id="profile">
									<h4>Profile Tab</h4>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat. Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
										sint occaecat cupidatat non proident, sunt in culpa qui
										officia deserunt mollit anim id est laborum.</p>
								</div>
								<div class="tab-pane fade" id="messages">
									<h4>Messages Tab</h4>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat. Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
										sint occaecat cupidatat non proident, sunt in culpa qui
										officia deserunt mollit anim id est laborum.</p>
								</div>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<!-- /.col-lg-12 -->
			</div>

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
		$(document).ready(function() {
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
					"data" : "dataId"
				}, {
					"data" : "meterName"
				}, {
					"data" : "dcId"
				}, {
					"data" : "dcUrl"
				}, {
					"data" : "dcLocation"
				}, {
					"data" : "dcIP"
				}, {
					"data" : "venderName"
				}, {
					"data" : "p1Pv"
				}, {
					"data" : "p1Err"
				} ]
			});
			

		    $('.input-daterange input').each(function() {
		        $(this).datepicker({language: 'zh-CN',autoclose:true} );
		    });
		});
	</script>

</body>

</html>