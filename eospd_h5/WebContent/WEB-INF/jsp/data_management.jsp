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
		<div style="width:1280px; margin: auto">

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
														class="input-group-addon">到</span> <input type="text"
														class="form-control" value="">
												</div>
											</th>
										</tr>
									</table>
				 		<div id="container" class="scrollbar" style="margin-top:50px; overflow:auto; overflow-x: hidden; overflow-y: hidden; height:350px"></div>
							
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
	        	height:350,
	        	width: 1000,
	            type: 'area',
	            backgroundColor:'rgba(0,0,0,0)'
	        },
	        xAxis: {
	            categories: ['11:00', '11:15', '11:30', '11-45','12:00', '12:15', '12:30', '12:45', 
	                         '13:00', '13:15', '13:30', '13:45', '14:00', '14:15',  
	                         ],
	            tickmarkPlacement: 'off',
	            title: {
	                enabled: false
	            }
	        	
	        },
	        yAxis: {
	        	gridLineColor:'rgba(0,0,0,0)',
	        	tickPositions:[0,100],
                   tickmarkPlacement: 'off',
   	            title: {
   	                enabled: false
   	            }
	        },
	        tooltip: {
	            pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.percentage:.1f}%</b> ({point.y:,.0f})<br/>',
	            shared: true
	        },
	        plotOptions: {
	            area: {
	                stacking: 'percent',
	                lineColor: '#ffffff',
	                lineWidth: 2,
	                marker: {
	                	enabled:false,
	                    lineWidth: 2,
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
		$("#his_page").click(function(){
	     	   window.location.href="/eospd_h5/datam_list";
	        });
	</script>

</body>

</html>