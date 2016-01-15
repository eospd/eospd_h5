<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<jsp:include page="header.jsp"></jsp:include>

<body>
	<div class="row">
		<!--  <div class="col-md-1 left-right-empty"></div>
		<div class="col-md-10 left-right-empty">
			<div id="wrapper">-->
				<div id="wrapper">
		<div id="content-div">

				<jsp:include page="left_sidebar.jsp"></jsp:include>
				<div id="page-wrapper" >
					<div class="div" style="height:480px; padding-left: 5px; padding-right: 5px; padding-top: 0px">
							<table class="table" style="margin-bottom: 0px"id="filter_table">
										<tr>
										<th>
											<!--  <button class="color  black button">+</button>
											<button class="color  black button">-</button>
											-->
											</th>
											<th style="width: 400px;">
												<div class="input-group input-daterange pull-right">
													<input type="text" class="form-control" value=""> <span
														class="input-group-addon" style="color: grey; background: rgb(54,59,70); border: none;">到</span> <input type="text"
														class="form-control" value="">
												</div>
											</th>
										</tr>
									</table>
							<div class="panel panel-default" style="padding:5px;">
								<div class="panel-body " style="height:450px;">
									<div class="scrollbar tab-content" style="overflow: auto; height:400px">
									
									<div class="dataTable_wrapper" >
										<table class="table table-striped table-bordered table-hover" allowHeaderWrap="true"
											id="dm_table">
											<thead>
												<tr>
													<th style="font-size:5px;">采集<br/>时间</th>
													<th style="font-size:5px;">电支路</th>
													<th style="font-size:5px;">断点<br/>续传</th>
													<th style="font-size:5px">插值<br/>标志</th>
													<th style="font-size:4px">表头电量<br/>(KWh)</th>
													<th style="font-size:5px">错误<br/>标志</th>
													<th style="font-size:5px">差值<br/>(KWh)</th>
													<th style="font-size:5px">归零<br/>标志</th>
													<th style="font-size:4px">总功率<br/>(KW)</th>
													<th style="font-size:4px">总功率<br/>因数</th>
													<!--  <th style="font-size:5px">A相<br/>电流(A)</th>
													<th style="font-size:5px">B相<br/>电流(A)</th>
													<th style="font-size:5px">C相<br/>电流(A)</th>
													<th style="font-size:5px">A相<br/>电压(V)</th>
													<th style="font-size:5px">B相<br/>电压(V)</th>
													<th style="font-size:5px">C相<br/>电压(V)</th>-->
												</tr>
											</thead>
										</table>
									</div>
									<!-- /.table-responsive -->
									</div>
								</div>
							</div>
						</div>
									<jsp:include page="bottom_bar.jsp"></jsp:include>
						<!-- /.panel-body -->
				</div>
				<!-- /#page-wrapper -->
			</div>
			<!-- /#wrapper -->

		</div>
		<!--  <div class="col-md-1 left-right-empty"></div>-->
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>

	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
		src="js/bootstrap-datetimepicker.zh-CN.js"></script>
		

	<!-- Metis Menu Plugin JavaScript -->
	<script src="js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/sb-admin-2.js"></script>
	<script src="js/eospd.js"></script>
	<script src="js/highcharts.js"></script>
	<script src="js/jquery.dragscroll.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(
				function() {
					$('#container').dragScroll({});
					$('#dm_table').DataTable({
						"language": chinese_langue,
						"processing" : true,
						"serverSide" : true,
						"bSort" : false,
						"ajax" : {
							"url" : "/eospd_h5/dm/list",
							"type" : "POST"
						},
						"columns" : [ {
							"data" : "currentTime"
						}, {
							"data" : "dataUrl"
						}, {
							"data" : "bpSign"
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
							"data" : "p25Pv"
						}, {
							"data" : "p37Pv"
						}
						/*, {
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
						}*/ 
						]
					});

					$('.input-daterange input').each(
							function(i) {

								var d = new Date();
								if (0 == i) {
									d = new Date(d.valueOf() - 12 * 60 * 60 * 1000);
								}
								
								$(this).val(
										d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
												+ (d.getDate()) + "日 "+ d.toString().split(' ')[4].substring(0, 5)); 
								
								$(this).datetimepicker({
							        language:  'zh-CN',
							        weekStart: 1,
							        todayBtn:  1,
									autoclose: 1,
									todayHighlight: 1,
									startView: 2,
									forceParse: 0,
									autoclose : true,
									endDate: new Date(),
									format: 'yyyy年mm月dd日 hh:ii'
								}).on('changeDate', function(value) {
								    //var s_date = $('.input-daterange input')[0].value;
								    //var e_date = $('.input-daterange input')[1].value;
								    //console.log("s_date:" + s_date);
								    //console.log("e_date:" + e_date);

									//var table = $('#dm_table').DataTable();
									//table.columns(0).search(s_date + "," + e_date).draw();
								});
							});
					
					var s_date = $('.input-daterange input')[0].value;
					    var e_date = $('.input-daterange input')[1].value;
					    //console.log("s_date:" + s_date);
					    //console.log("e_date:" + e_date);

					var table = $('#dm_table').DataTable();
					table.columns(0).search(s_date + "," + e_date).draw();
				});
		
		$("#def_page").click(function(){
	     	   window.location.href="/eospd_h5/dm";
	        });
		
		$("#def_page").css({'background-color':'#3b404a', 'border-color':'#3b404a'});
		$("#his_page").css({'background-color':'#269CE9'});
		$("#dm").toggleClass('active');
		$("#btn_refresh").click(function() {
			var s_date = $('.input-daterange input')[0].value;
		    var e_date = $('.input-daterange input')[1].value;
		    //console.log("s_date:" + s_date);
		    //console.log("e_date:" + e_date);

			var table = $('#dm_table').DataTable();
			table.columns(0).search(s_date + "," + e_date).draw();
		});
		$("#btn_rest").click(function() {
			window.location.href="/eospd_h5/dm";
		});
	</script>

</body>

</html>