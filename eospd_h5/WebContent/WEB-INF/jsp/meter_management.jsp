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
								<div class="panel-heading">
									表具管理
									<div class="pull-right">
										<button "class="btn btn-default" data-toggle="modal"
											data-target="#myModal">增加表具</button>
									</div>
								</div>

								<!-- modal window -->

								<!-- Modal -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">增加电支路</h4>
											</div>
											<div class="modal-body">

												<form role="form">
													<div class="form-group">
														<label>仪表名称</label> <input class="form-control">
													</div>
													<div class="form-group">
														<label>采集器名称</label> <input class="form-control">
													</div>

													<div class="form-group">
														<label>厂商</label> <input class="form-control">
													</div>
													<div class="form-group">
														<label>电支路名称</label> <input class="form-control">
													</div>
													<button type="submit" class="btn btn-default">提交</button>
													<button type="reset" class="btn btn-default">重置</button>
												</form>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>

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
											<th style="width: 100px">
												<div class="pull-right">
													<div class="btn-group">
														<button type="button"
															class="btn btn-default btn-xs dropdown-toggle"
															data-toggle="dropdown">
															全部采集器 <span class="caret"></span>
														</button>
														<ul class="dropdown-menu pull-right" role="menu">
															<li onclick=gen_dc_div()><a href="#">全部采集器</a></li>
															<li onclick=gen_meter_div()><a href="#">全部仪表</a></li>
														</ul>
													</div>
												</div>
											</th>
										</tr>
									</table>

									<!-- Tab panes -->
									<div class="tab-content">
										<div class="tab-pane fade in active" id="home">

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
			mm_his();
			});
	</script>

</body>

</html>