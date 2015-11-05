<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<jsp:include page="header.jsp"></jsp:include>

<body>

	<div id="wrapper">

		<jsp:include page="left_sidebar.jsp"></jsp:include>

		<div id="page-wrapper">

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
                    <div class="panel-heading">系统配置</div>

						<div class="panel-body">
							<table class="table table-bordered"
											id="filter_table">
											<tr>
											<th>
											<div class="pull-left">累计</div>
											</th>
											<th style="width:400px">
									<div class="input-group input-daterange pull-right">
										<input type="text" class="form-control" value=""> <span
											class="input-group-addon">到</span> <input type="text"
											class="form-control" value=""></div>
									</th>
									<th style="width:100px">
											
								<div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                       		全部仪表类型
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">全部仪表类型</a>
                                        </li>
                                        <li><a href="#">/e/dae/smb350_8</a>
                                        </li>
                                        <li><a href="#">/e/dae/smb350_4</a>
                                        </li>
                                        <li><a href="#">/e/lckj/ex8</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            </th>
                            <th style="width:100px">
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                       		全部厂商
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">全部厂商</a>
                                        </li>
                                        <li><a href="#">山东力创科技有限公司</a>
                                        </li>
                                        <li><a href="#">台科电科技股份有限公司</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            </th>
                            	</tr>
                            	</table>

							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane fade in active" id="home">
									<div class="dataTable_wrapper">
										<table class="table table-striped table-bordered table-hover"
											id="dm_table">
											<thead>
												<tr>
													<th>仪表URL</th>
													<th>仪表类型</th>
													<th>类型URL</th>
													<th>仪表安装</th>
													<th>操作</th>
												</tr>
											</thead>
											<tr>
												<td>/pd/meter/e/1</td>
												<td>SMB350-8路多回路电表</td>
												<td>/e/dae/smb350_8</td>
												<td><a>查看厂商信息</a></td>
												</tr>
												<tr>
												<td>/pd/meter/e/2</td>
												<td>SMB350-4路多回路电表</td>
												<td>/e/dae/smb350_4</td>
												<td><a>查看厂商信息</a></td>
												</tr>
										</table>
									</div>
									<!-- /.table-responsive -->
								</div>
								<div class="tab-pane fade" id="profile">
								</div>
								<div class="tab-pane fade" id="messages">
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
		/*	$('#dm_table').DataTable({
				"processing" : true,
				"serverSide" : true,
				"ajax" : {
					"url" : "/eospd_h5/dm/list",
					"type" : "POST"
				},
				"columns" : [ {
					"data" : "currentTime"
				}, {
					"data" : "dataId"
				}, {
					"data" : "meterName"
				}, {
					"data" : "dcId"
				}, {
					"data" : "dcUrl"
				}, {
					"data" : "dcLocation"
				}, {
					"data" : "dcIP"
				}, {
					"data" : "venderName"
				}, {
					"data" : "p1Pv"
				}, {
					"data" : "p1Err"
				} ]
			});
			*/

		    $('.input-daterange input').each(function() {
		    	var d = new Date()
		    	$(this).val(d.getFullYear() + "年" + (d.getMonth() + 1) + "月" + (d.getDay() + 1) + "日");
		        $(this).datepicker({language: 'zh-CN',autoclose:true, todayHighlight:true, todayBtn: "linked"} );
		    });
		});
	</script>

</body>

</html>