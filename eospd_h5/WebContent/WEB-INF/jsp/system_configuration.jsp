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
								<div class="panel-body">


											<div class="dataTable_wrapper">
												<table
													class="table table-striped table-bordered table-hover"
													id="dm_table">
													<thead>
														<tr>
															<th>设备标识</th>
															<th>设备名称</th>
															<th>描述</th>
															<th>厂家名称</th>
															<th>厂家地址</th>
															<th>厂家电话</th>
															<th>厂家联系人</th> 
														</tr>
													</thead>
												</table>
											</div>
											<!-- /.table-responsive -->
										</div>
										<!-- /.panel-body -->
									</div>
								</div>
								<!-- /.panel-body -->
							
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
	<script src="js/eospd.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(
				function() {
					$('#dm_table').DataTable({
						"language": chinese_langue,
						"processing" : true,
						"serverSide" : true,
						"ajax" : {
							"url" : "/eospd_h5/sc/list",
							"type" : "POST"
						},
						"columns" : [ {
							"data" : "typeUrl"
						},{
							"data" : "typeName"
						}, {
							"data" : "desc"
						}, {
							"data" : "venderName"
						}, {
							"data" : "venderAddr"
						}, {
							"data" : "contactPhone"
						}, {
							"data" : "contactPerson"
						}]
					});
					
				});
	</script>

</body>

</html>