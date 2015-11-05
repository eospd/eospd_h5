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
						<div class="panel-heading">数据管理</div>
						<div class="panel-body">
							<table class="table table-bordered"
											id="filter_table">
											<tr>
											<th>
											<div class="pull-left">累计</div>
											</th>
											<th>
									<div class="input-group input-daterange pull-right">
										<input type="text" class="form-control" value=""> <span
											class="input-group-addon">到</span> <input type="text"
											class="form-control" value="">
									</th>
									<th>
									<div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                       		全部电支路
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">全部电支路</a>
                                        </li>
                                        <li><a href="#">电支路一</a>
                                        </li>
                                        <li><a href="#">电支路二</a>
                                        </li>
                                        <li><a href="#">电支路三</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
									</th>
									<th>
											
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
                            <th>
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
                            </div>
                            </th>
                            	</tr>
                            	</table>
									<div class="dataTable_wrapper">
										<table class="table table-striped table-bordered table-hover"
											id="dm_table">
											<thead>
												<tr>
													<th>时间</th>
													<th>能源ID</th>
													<th>仪表名称</th>
													<th>采集器ID</th>
													<th>采集器URL</th>
													<th>采集器地址</th>
													<th>采集器IP</th>
													<th>厂商</th>
													<th>p1Pv</th>
													<th>p1Err</th>
												</tr>
											</thead>
										</table>
									</div>
									<!-- /.table-responsive -->
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
			$('#dm_table').DataTable({
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
			

		    $('.input-daterange input').each(function() {
		    	var d = new Date()
		    	$(this).val(d.getFullYear() + "年" + (d.getMonth() + 1) + "月" + (d.getDay() + 1) + "日");
		        $(this).datepicker({language: 'zh-CN',autoclose:true, todayHighlight:true, todayBtn: "linked"} );
		    });
		});
	</script>

</body>

</html>