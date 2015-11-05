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
						<div class="panel-heading">
						电支路信息
						<div class="pull-right">
						<button "class="btn btn-default" data-toggle="modal" data-target="#myModal">
                            		增加电支路
                            </button>
                        </div>
						</div>
						
						<!-- modal window -->
						        	
                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">增加电支路</h4>
                                        </div>
                                        <div class="modal-body">
                                        
										<form role="form">
											<div class="form-group">
												<label>电支路URL</label> <input class="form-control">
												<p class="help-block">/pd/t2/eng_station/total2</p>
											</div>
											<div class="form-group">
												<label>电支路名称</label> <input class="form-control">
												<p class="help-block">测试电支路</p>
											</div>

											<div class="form-group">
												<label>所在位置</label> <input class="form-control">
												<p class="help-block">第五机柜</p>
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

									<div class="col-lg-12">
						<div style="overflow:auto">
										<table class="table table-striped table-bordered table-hover"
											id="dm_table">
											<thead>
												<tr>
													<th >电支路URL</th>
													<th>电支路名称</th>
													<th>所在位置</th>
													<th>开关额定电流</th>
													<th>电压等级</th>
													<th>设计功率</th>
													<th>电源相数</th>
													<th>上级</th>
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
					"url" : "/eospd_h5/efd/list",
					"type" : "POST"
				},
				"columns" : [ 
				{
					"data" : "circuitUrl"
				}, {
					"data" : "circuitName"
				}, {
					"data" : "location"
				}, {
					"data" : "switchRatedC"
				}, {
					"data" : "levelV"
				}, {
					"data" : "designPower"
				}, {
					"data" : "powerPhase"
				}, {
					"data" : "parentId"
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