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
				<div id="page-wrapper">
					<div class="div"
						style="height: 480px; padding-left: 5px; padding-right: 5px; padding-top: 0px">
						<table class="table" style="margin-bottom: 0px" id="filter_table">
							<tr>
								<th>
									<!--  <button class="color  black button">+</button>
											<button class="color  black button">-</button>
											-->
								</th>
								<th style="width: 400px;">
									<div class="input-group input-daterange pull-right">
										<input type="text" class="form-control s_time_y" value=""> <span
											class="input-group-addon" style="color: grey; background: rgb(54,59,70); border: none;">到</span> 
										<input type="text" class="form-control e_time_y" value="">
									</div>
								</th>
							</tr>
						</table>
						<div id="container" class="scrollbar"
							style="margin-top: 50px; overflow: auto; overflow-x: hidden; overflow-y: hidden; height: 350px"></div>

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
	<script src="js/jquery.plugin.min.js"></script>
	<script src="js/jquery.timer.min.js"></script>

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
	<script src="js/highcharts.js"></script>
	<script src="js/jquery.dragscroll.js"></script>
	<script src="js/eospd.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(
				function() {
					
					var d = new Date();
					$('.e_time_y').val(
							d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
									+ (d.getDate()) + "日" + " " + d.toString().split(' ')[4].substring(0, 5));

					d = new Date(d.valueOf() - 12 * 60 * 60 * 1000);
					$('.s_time_y').val(
							d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
									+ (d.getDate()) + "日"+" "+d.toString().split(' ')[4].substring(0, 5));
					
					 $('.input-daterange input').each(
								function(i) {

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
										//render_data_admin();
									});
								});
					 render_data_admin();
					// 每隔十五分钟，自动拉取服务器数据
						$('body').timer({
							callback: function() {

								var d = new Date();
								$('.e_time_y').val(
										d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
												+ (d.getDate()) + "日" + " " + d.toString().split(' ')[4].substring(0, 5));

								d = new Date(d.valueOf() - 12 * 60 * 60 * 1000);
								$('.s_time_y').val(
										d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
												+ (d.getDate()) + "日"+" "+d.toString().split(' ')[4].substring(0, 5));
								
						render_data_admin();
								 },
							repeat: true,
							//delay: 2000
							delay: 900000
						});
				});
		
		$("#his_page").click(function(){
	     	   window.location.href="/eospd_h5/datam_list";
	        });
		$("#btn_refresh").click(function() {
			render_data_admin();
		});
		$("#btn_rest").click(function() {
			
			var d = new Date();
			$('.e_time_y').val(
					d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
							+ (d.getDate()) + "日" + " " +d.toString().split(' ')[4].substring(0, 5));
			d = new Date(d.valueOf() - 12 * 60 * 60 * 1000);
			$('.s_time_y').val(
					d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
							+ (d.getDate()) + "日" + " " + d.toString().split(' ')[4].substring(0, 5));
			
			render_data_admin();
		});
	</script>

</body>

</html>