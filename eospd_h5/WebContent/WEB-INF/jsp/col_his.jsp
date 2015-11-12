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

				<div id="page-wrapper">

					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">历史数据</div>
								<div class="panel-body">

									<table class="table table-bordered" id="filter_table">
										<tr>
											<th>
												<div class="pull-left">累计</div>
											</th>
											<th style="width: 400px">
												<div class="input-group input-daterange pull-right">
													<input type="text" class="form-control" value=""> <span
														class="input-group-addon">到</span> <input type="text"
														class="form-control" value="">
												</div>
											</th>
											<th style="width: 100px">

												<div class="btn-group dc-meter-dropdown"></div>
											</th>
										</tr>
									</table>

									<!-- history pannel -->
									<div class="tab-content">
										<div class="tab-pane fade in active" id="home">

											<div class="dataTable_wrapper">
												<table
													class="table table-striped table-bordered table-hover"
													id="dm_table">
													<thead>
														<tr>
															<th>时间</th>
															<th>仪表URL</th>
															<th>数据有效率</th>
															<th>仪表在线率</th>
															<th>实时采集率</th>
														</tr>
													</thead>
												</table>
											</div>
											<!-- /.table-responsive -->
										</div>
										<div class="tab-pane fade" id="profile"></div>
										<div class="tab-pane fade" id="messages"></div>
										<!-- /.panel-body -->
									</div>
									<!-- /.panel -->
								</div>
								<!-- /.col-lg-12 -->
							</div>
							<!-- /.col-lg-12 -->
						</div>
					</div>
					<!-- /#page-wrapper -->

				</div>
				<!-- /#wrapper -->
			</div>
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
	<script src="js/echarts.js"></script>
	<script src="js/eospd.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
			$(document).ready(function() {
				col_his();			
			});
		</script>
</body>

</html>