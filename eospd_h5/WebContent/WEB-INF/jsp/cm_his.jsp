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

					<div class="row div" style="padding-top:10px; height:480px">
						<div class="col-lg-12">

							<div class="panel panel-default">
								<div class="panel-body">

									<table class="table " id="filter_table">
										<tr>
											<th>
											</th>
											<th style="width: 400px">
												<div class="input-group input-daterange pull-right">
													<input type="text" class="form-control" value=""> <span
														class="input-group-addon">到</span> <input type="text"
														class="form-control" value="">
												</div>
											</th>
											<th style="width: 100px">

												<div class="pull-right">
													<div class="btn-group dc-meter-dropdown"></div>
												</div>
											</th>
											<th style="width: 100px">
												<div class="pull-right">
													<div class="btn-group">
														<button type="button"
															class="btn btn-default btn-xs dropdown-toggle"
															data-toggle="dropdown">
															设备类型 <span class="caret"></span>
														</button>
														<ul class="dropdown-menu pull-right" role="menu">
															<li onclick=gen_all_dc()><a href="#">全部采集器</a></li>
															<li onclick=gen_all_meter()><a href="#">全部仪表</a></li>
														</ul>
													</div>
												</div>
											</th>
										</tr>
									</table>
								</div>
<div class="scrollbar tab-content" style="overflow: auto; height:350px">
									
								<!-- Tab panes -->
								<div class="tab-content">
									<div class="tab-pane fade in active" id="home">
										<div class="dataTable_wrapper">
											<table class="table table-striped table-bordered table-hover"
												id="dm_table">
												<thead>
													<tr>
														<th>时间</th>
														<th>设备类型</th>
														<th>设备标识</th>
														<th>状态</th>
														<th>断点续传</th>
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
				<jsp:include page="bottom_bar.jsp"></jsp:include>
				</div>
				
				<!-- /#page-wrapper -->
			</div>
			<!-- /#wrapper -->
		</div>
		<!--<div class="col-md-1 left-right-empty"></div>-->
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

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function(){
			cm_his();
			$("#def_page").click(function() {
				window.location.href="/eospd_h5/cm_chart";
			});
			$("#cm").toggleClass('active');
			$("#def_page").css({'background-color':'#3b404a', 'border-color':'#3b404a'});
			$("#his_page").css({'background-color':'#269CE9'});
			$("#btn_rest").click(function() {
				window.location.href="/eospd_h5/cm_chart";
			});
			$("#btn_refresh").click(function() {
				window.location.href="/eospd_h5/cm_chart";
			});
		});


	</script>
</body>
</html>