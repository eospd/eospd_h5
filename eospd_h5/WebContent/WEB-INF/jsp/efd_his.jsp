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

								<li class="active"><a href="#home" data-toggle="tab">电支路信息</a></li>

								<li class='dropdown'><a data-toggle="dropdown" href=""
									role="button" aria-expanded="false">全部仪表器 <span
										class="caret"></span>
								</a>
									<ul class="dropdown-menu">
										<li><a href="#"> 仪表器一 </a></li>
										<li><a href="#"> 仪表器二 </a></li>
										<li><a href="#"> 仪表器三 </a></li>
									</ul></li>

								<li class='dropdown nav-right'><a data-toggle="dropdown"
									href="" role="button" aria-expanded="false">全部采集器 <span
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
													<th>电支路URL</th>
													<th>电支路名称</th>
													<th>所在位置</th>
													<th>开关额定电流</th>
													<th>电压等级</th>
													<th>设计功率</th>
													<th>电源相数</th>
													<th>上级</th>
												</tr>
											</thead>
										</table>
									</div>
									<!-- /.table-responsive -->
								</div>
								<div class="tab-pane fade" id="profile"></div>
								<div class="tab-pane fade" id="messages"></div>
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
					"url" : "/eospd_h5/efd/list",
					"type" : "POST"
				},
				"columns" : [ {
					"data" : "currentTime"
				}, {
					"data" : "circuitUrl"
				}, {
					"data" : "circuitName"
				}, {
					"data" : "location"
				}, {
					"data" : "switchRatedC"
				}, {
					"data" : "levelV"
				}, {
					"data" : "designPower"
				}, {
					"data" : "powerPhase"
				}, {
					"data" : "parentId"
				} ]
			});
			$('.input-daterange input').each(function() {
				$(this).datepicker({
					language : 'zh-CN',
					autoclose : true
				});
			});
		});
	</script>

</body>
</html>