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
						<div class="panel-heading">历史数据</div>
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
                                       		全部仪表
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">全部仪表</a>
                                        </li>
                                        <li><a href="#">仪表一</a>
                                        </li>
                                        <li><a href="#">仪表二</a>
                                        </li>
                                        <li><a href="#">仪表三</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            </th>
                            <th style="width:100px">
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                       		全部采集器
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">全部采集器</a>
                                        </li>
                                        <li><a href="#">采集器一</a>
                                        </li>
                                        <li><a href="#">采集器二</a>
                                        </li>
                                        <li><a href="#">采集器三</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            </th>
                            	</tr>
                            	</table>
							</div>

							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane fade in active" id="home">
									<div class="dataTable_wrapper">
										<table class="table table-striped table-bordered table-hover"
											id="dm_table">
											<thead>
												<tr>
													<th>时间</th>
													<th>仪表ID</th>
													<th>仪表名称</th>
													<th>采集器ID</th>
													<th>采集器URL</th>
													<th>在线状态</th>
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
			$('#dm_table').DataTable({
				"processing" : true,
				"serverSide" : true,
				"ajax" : {
					"url" : "/eospd_h5/cm/list",
					"type" : "POST"
				},
				"columns" : [ {
					"data" : "currentTime"
				}, {
					"data" : "meterId"
				}, {
					"data" : "meterName"
				}, {
					"data" : "dcId"
				}, {
					"data" : "dcUrl"
				}, {
					"data" : "onlineStatus"
				} ]
			});

			$('.input-daterange input').each(function() {
		    	var d = new Date()
		    	$(this).val(d.getFullYear() + "年" + (d.getMonth() + 1) + "月" + (d.getDay() + 1) + "日");
		        $(this).datepicker({language: 'zh-CN',autoclose:true, todayHighlight:true, todayBtn: "linked"} );
			});
		});
	</script>

</body>

</html>