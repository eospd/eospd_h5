<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<jsp:include page="header.jsp"></jsp:include>

<body>
	<div class="row">
		<!--  <div class="col-md-1 left-right-empty"></div>-->
		<div class="col-md-10 left-right-empty">

			<div id="wrapper">

				<jsp:include page="left_sidebar.jsp"></jsp:include>
				<div id="page-wrapper" >
					<div class="div" style="height:480px; padding-left: 5px; padding-right: 5px; padding-top: 0px">
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
							<div class="panel panel-default" style="padding:5px;">
								<div class="panel-body scrollbar" style="height:250px;overflow: auto">
									
									<div class="dataTable_wrapper" >
										<table class="table table-striped table-bordered table-hover" allowHeaderWrap="true"
											id="dm_table">
											<thead>
												<tr>
													<th style="font-size:5px;">采集<br/>时间</th>
													<th style="font-size:5px;">电支路</th>
													<th style="font-size:5px;">断点<br/>续传</th>
													<th style="font-size:5px">插值<br/>标志</th>
													<th style="font-size:4px">总电量<br/>(KWh)</th>
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
	                	enabled:false,
	                    lineWidth: 1,
	                    lineColor: '#ffffff'
	                }
	            }
	        },
	        legend:{
	        	reversed:true
	        },
	        
	        series: [
	            {
	            name: '<label style="color:white">无数据</label>',                
	            data: [200, 31, 54, 156, 339, 818, 201,200, 31, 54, 156, 339, 818, 201]
	        },{
	            name: '<label style="color:white">错误未修复</label>',
	            data: [106, 107, 111, 133, 221, 767, 766,106, 107, 111, 133, 221, 767, 766]
	        }, {
	            name: '<label style="color:white">错误修复</label>',
	            data: [163, 203, 276, 408, 547, 729, 628,163, 203, 276, 408, 547, 729, 628]
	        },{
	            name: '<label style="color:white">重传数据</label>',
	            data: [300, 31, 54, 156, 339, 818, 201,300, 31, 54, 156, 339, 818, 201]
	        },  {
	            name: '<label style="color:white">正常数据</label>',
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
							"data" : "p2Pv"
						}, {
							"data" : "p3Pv"
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