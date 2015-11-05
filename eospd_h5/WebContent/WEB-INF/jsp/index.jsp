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
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">数据采集</div>
							<div class="panel-body">
								<!-- Nav tabs -->
								<ul class="nav nav-pills">
									<li class="active"><a href="#home-pills" data-toggle="tab"
										aria-expanded="true">数据指标</a></li>
									<li class=""><a href="#history-pills" data-toggle="tab"
										aria-expanded="false">历史数据</a></li>
								<li class='dropdown'><a data-toggle="dropdown" href=""
									role="button" aria-expanded="false">全部仪表器 <span
										class="caret"></span>
								</a>
									<ul class="dropdown-menu">
										<li><a href="#"> 仪表器一 </a></li>
										<li><a href="#"> 仪表器二 </a></li>
										<li><a href="#"> 仪表器三 </a></li>
									</ul></li>

								<li class="home_select"><a data-toggle="tab">
										<div class="input-group input-daterange">
											<input type="text" class="form-control" value=""> <span
												class="input-group-addon">到</span> <input type="text"
												class="form-control" value="">
										</div>
								</a></li>
								</ul>

								<!-- Tab panes -->
								<div class="tab-content">
									<div class="tab-pane fade active in" id="home-pills">
										<div class="panel panel-default">

											<div class="panel-heading">
												<h4 class="panel-title">系统指标</h4>
											</div>
											<div class="panel-body">

												<div class="row">
													<div class="col-lg-4">
														<div id="data_efficiency" class="data_efficiency"></div>
													</div>
													<div class="col-lg-4">
														<div id="meter_online_r" class="meter_online_r"></div>
													</div>
													<div class="col-lg-4">
														<div id="real_time_cr" class="real_time_cr"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="panel panel-default">

											<div class="panel-heading">
												<h4 class="panel-title">仪表指标</h4>
											</div>
											<div class="panel-body">

												<div class="row">
													<div id="topo_canvas" class="col-lg-12"></div>
												</div>
											</div>
										</div>

									</div>

									<!-- history pannel -->
									<div class="tab-pane fade" id="history-pills">
										<div class="row">
											<div class="col-lg-12">
												<div class="panel panel-default">
													<div class="panel-heading">数据采集历史数据</div>
													<!-- /.panel-heading -->
													<div class="panel-body">
														<div class="dataTable_wrapper">
															<table
																class="table table-striped table-bordered table-hover"
																id="dm_table">
																<thead>
																	<tr>
																		<th>时间</th>
																		<th>仪表ID</th>
																		<th>数据有效率</th>
																		<th>仪表在线率</th>
																		<th>实时采集率</th>
																	</tr>
																</thead>
															</table>
														</div>
														<!-- /.table-responsive -->
													</div>
													<!-- /.panel-body -->
												</div>
												<!-- /.panel -->
											</div>
											<!-- /.col-lg-12 -->
										</div>
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

		<script type="text/javascript" src="js/ECOTree.js"></script>
		<script type="text/javascript">
			var CreateTree = function() {
				myTree = new ECOTree('myTree', 'topo_canvas');
				//	myTree.config.linkType = 'B';
				//myTree.config.iRootOrientation = ECOTree.RO_TOP;						
				//myTree.config.topYAdjustment = -180;
				myTree.config.linkColor = "black";
				myTree.config.nodeColor = "#FFAAAA";
				myTree.config.nodeBorderColor = "black";
				myTree.config.useTarget = false;
				myTree.config.iLevelSeparation = 80;
				//myTree.config.selectMode = ECOTree.SL_SINGLE;			
				//(id, pid, dsc, w, h, c, bc, target, meta)		
				myTree.add(0, -1, "Apex Node", 100, 50, "#CCCCFF", "#CCCCFF",
						"head", "能源采集系统");//, 150, 150, "#CCCCFF", "#CCCCFF", "hello", "URL:/pd/meter/e/1\n有效率:%30\n在线率:%40\n采集率:70%");
				var w = 70;
				var h = 80;
				myTree
						.add(1, 0, "Apex Node", w, h, "#CCCCFF", "#CCCCFF",
								"hello",
								"URL:/pd/meter/e/1\n有效率:30%\n在线率:%40\n采集率:70%");
				myTree
						.add(2, 0, "Apex Node", w, h, "#CCCCFF", "#CCCCFF",
								"hello",
								"URL:/pd/meter/e/2\n有效率:30%\n在线率:%40\n采集率:70%");
				myTree
						.add(3, 0, "Apex Node", w, h, "#CCCCFF", "#CCCCFF",
								"hello",
								"URL:/pd/meter/e/3\n有效率:30%\n在线率:%40\n采集率:70%");
				myTree
						.add(4, 0, "Apex Node", w, h, "#CCCCFF", "#CCCCFF",
								"hello",
								"URL:/pd/meter/e/4\n有效率:30%\n在线率:%40\n采集率:70%");
				myTree
						.add(5, 0, "Apex Node", w, h, "#CCCCFF", "#CCCCFF",
								"hello",
								"URL:/pd/meter/e/5\n有效率:30%\n在线率:%40\n采集率:70%");
				myTree
						.add(6, 0, "Apex Node", w, h, "#CCCCFF", "#CCCCFF",
								"hello",
								"URL:/pd/meter/e/6\n有效率:30%\n在线率:%40\n采集率:70%");
				myTree
						.add(7, 0, "Apex Node", w, h, "#CCCCFF", "#CCCCFF",
								"hello",
								"URL:/pd/meter/e/7\n有效率:30%\n在线率:%40\n采集率:70%");
				myTree.UpdateTree();
			}
		</script>
		<!-- Page-Level Demo Scripts - Tables - Use for reference -->
		<script>
			$(document).ready(function() {

				var objBar1 = [], objBar2 = [], objBar3 = [];
				objBar1.myChartBackgroundColor = "#000000";
				objBar1.myChartType = "gauge";
				objBar1.myChartLegendData = new Array('有功功率');
				objBar1.myChartYAxisFormatter = "kw";
				objBar1.myChartDataColor = [ '#ff9000' ];
				objBar1.myChartDyType = "0";

				objBar1.myContainerId = "data_efficiency";
				objBar1.myName = "有效率";
				objBar1.myValue = 50;

				getMyEcharts(objBar1);

				objBar2.myChartType = "gauge";
				objBar2.myContainerId = "meter_online_r";
				objBar2.myName = "在线率";
				objBar2.myValue = 60;

				getMyEcharts(objBar2);

				objBar3.myChartType = "gauge";
				objBar3.myContainerId = "real_time_cr";
				objBar3.myName = "采集率";
				objBar3.myValue = 80;
				getMyEcharts(objBar3);

				//var objBarMeters = [];

				//objBarMeters.myChartType = "mul_bar";
				//objBarMeters.myContainerId = "meters_cr";
				//objBarMeters.myName = "实时采集率";
				//objBarMeters.myValue = 80;
				//getMyEcharts(objBarMeters);

				//drawtopo();
				CreateTree();
				$('#dm_table').DataTable({
					"processing" : true,
					"serverSide" : true,
					"ajax" : {
						"url" : "/eospd_h5/cid/list",
						"type" : "POST"
					},
					"columns" : [ {
						"data" : "currentTime"
					},{
						"data" : "deviceId"
					}, {
						"data" : "dataEffRate"
					}, {
						"data" : "meterOnlineRate"
					}, {
						"data" : "realCollectRate"
					}]
				});
				$('.input-daterange input').each(function() {
			    	var d = new Date()
			    	$(this).val(d.getFullYear() + "年" + (d.getMonth() + 1) + "月" + (d.getDay() + 1) + "日");
			        $(this).datepicker({language: 'zh-CN',autoclose:true, todayHighlight:true, todayBtn: "linked"} );
				});
			});
		</script>
</body>

</html>