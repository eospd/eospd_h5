<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<jsp:include page="header.jsp"></jsp:include>

<body>
	<div class="row">
		<!--  <div class="col-md-1 left-right-empty"></div>
		<div class="col-md-10 left-right-empty">
			<div id="wrapper" style="height:720px">-->
		<div id="wrapper">
		<div id="content-div">		
		
				<jsp:include page="left_sidebar.jsp"></jsp:include>

				<div id="page-wrapper" style="height:580px">

					<div class="row div" style="height:480px; padding-top:10px">
					<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-body">
									
									<table class="table" id="filter_table">
										<tr>
											<th>
											</th>
											<th style="width: 400px">
												<div class="input-group input-daterange pull-right">
													<input type="text" class="form-control s_time" value=""> <span
														class="input-group-addon"  style="color: grey; background: rgb(54,59,70); border: none;">到</span> <input type="text"
														class="form-control e_time" value="">
												</div>
											</th>
											<th style="width: 2px">

												<div class="btn-group dc-meter-dropdown"></div>
											</th>
										</tr>
									</table>

									<!-- history pannel -->
									<div class="scrollbar tab-content" style="overflow: auto; height:350px">
										<div class="tab-pane fade in active" id="home">

											<div class="dataTable_wrapper">
												<table
													class="table table-striped table-bordered table-hover"
													id="dm_table">
													<thead>
														<tr>
															<th style="width:160px">时间</th>
															<th>机场建筑</th>
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
<jsp:include page="bottom_bar.jsp"></jsp:include>
					</div>
					<!-- /#page-wrapper -->
</div>
				</div>
				<!-- /#wrapper -->
			</div>
		</div>
	<!--  	<div class="col-md-1 left-right-empty"></div>-->
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

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
			$(document).ready(function() {
				col_his();
				$("#def_page").css({'background-color':'#3b404a', 'border-color':'#3b404a'});
				$("#his_page").css({'background-color':'#269CE9'});
				$("#index").toggleClass('active');
				$("#def_page").click(function() {
					var s_time =  $('.s_time').val().replace('年', '-').replace('月', '-').replace('日' ,'');
					var e_time = $('.e_time').val().replace('年', '-').replace('月', '-').replace('日' ,'');
				
					window.location.href='/eospd_h5/index?s_time=' + s_time + '&e_time=' + e_time;;
				});	
				$("#btn_rest").click(function() {
					var s_time =  $('.s_time').val().replace('年', '-').replace('月', '-').replace('日' ,'');
					var e_time = $('.e_time').val().replace('年', '-').replace('月', '-').replace('日' ,'');
					
					window.location.href='/eospd_h5/index?s_time=' + s_time + '&e_time=' + e_time;
				});
			});
		</script>
</body>

</html>