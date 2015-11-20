<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<jsp:include page="header.jsp"></jsp:include>

<body>
	<div class="row">
		<div class="col-md-1 left-right-empty"></div>
		<div class="col-md-10 left-right-empty">

			<div id="wrapper">

				<jsp:include page="left_sidebar.jsp"></jsp:include>
				<div id="page-wrapper" >
					<div class="div" style="height:400px; padding-left: 5px; padding-right: 5px; padding-top: 0px">
							<table class="table" style="margin-bottom: 0px"id="filter_table">
										<tr>
											<th>
											<button class="color  black button">+</button>
											<button class="color  black button">-</button>
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
				 <div id="container" class="scrollbar" style="overflow:auto; overflow-x: hidden; overflow-y: hidden; height:150px"></div>
									<!-- 
							<img  src="imgs/data_search.png"/> -->
							<div class="panel panel-default">
								<div class="panel-body scrollbar" style="height:180px;overflow: auto">
									
									<div class="dataTable_wrapper" >
										<table class="table table-striped table-bordered table-hover"
											id="dm_table">
											<thead>
												<tr>
													<th>采集时间</th>
													<th>断点续传</th>
													<th>电支路</th>
													<th>插值标志</th>
													<th>总电量</th>
													<th>错误标志</th>
													<th>差值</th>
													<th>归零标志</th>
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
									<jsp:include page="bottom_bar.jsp"></jsp:include>
						<!-- /.panel-body -->
				</div>
				<!-- /#page-wrapper -->
			</div>
			<!-- /#wrapper -->

		</div>
		<div class="col-md-1 left-right-empty"></div>
	</div>

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
	<script src="js/eospd.js"></script>
	<script src="js/highcharts.js"></script>
	<script src="js/jquery.dragscroll.js"></script>

	<script>
	$(function () {
	    var defaultColors = ['grey', 'yellow','blue', '#006400',  'green'];
	    Highcharts.setOptions({colors : defaultColors});
	    $('#container').highcharts({
	        chart: {
	        	height:150,
	        	width: 1000,
	            type: 'area',
	            backgroundColor:'rgba(0,0,0,0)'
	        },
	        xAxis: {
	            categories: ['11-01', '11-02', '11-03', '11-04', '11-05', '11-06', '11-07', 
	                         '11-08', '11-09', '11-10', '11-11', '11-12', '11-13', '11-14', 
	                         ],
	            tickmarkPlacement: 'off',
	            title: {
	                enabled: false
	            }
	        },
	        yAxis: {
	            
	        },
	        tooltip: {
	            pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.percentage:.1f}%</b> ({point.y:,.0f})<br/>',
	            shared: true
	        },
	        plotOptions: {
	            area: {
	                stacking: 'percent',
	                lineColor: '#ffffff',
	                lineWidth: 1,
	                marker: {
	                    lineWidth: 1,
	                    lineColor: '#ffffff'
	                }
	            }
	        },
	        series: [
	            {
	            name: '无法修复',                
	            data: [200, 31, 54, 156, 339, 818, 201,200, 31, 54, 156, 339, 818, 201]
	        },{
	            name: '错误未修复',
	            data: [106, 107, 111, 133, 221, 767, 766,106, 107, 111, 133, 221, 767, 766]
	        }, {
	            name: '错误修复',
	            data: [163, 203, 276, 408, 547, 729, 628,163, 203, 276, 408, 547, 729, 628]
	        },{
	            name: '重传数据',
	            data: [300, 31, 54, 156, 339, 818, 201,300, 31, 54, 156, 339, 818, 201]
	        },  {
	            name: '正常数据',
	            data: [402, 335, 409, 847, 902, 834, 868,402, 335, 409, 847, 902, 834, 868]
	        }]
	    });
	});				
	
	</script>
	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(
				function() {
					$('#container').dragScroll({});
					$('#dm_table').DataTable({
						"language": chinese_langue,
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
												+ (d.getDate()) + "日");
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