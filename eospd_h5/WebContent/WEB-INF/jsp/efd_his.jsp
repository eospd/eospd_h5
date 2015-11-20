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
					<div class="row" style="height:400px;">
						<div class="col-lg-12">

							<div class="panel panel-default">
									<div class="pull-right" style="margin-bottom: 10px">
										<button class="color black button" data-toggle="modal"
											data-target="#myModal">增加电支路</button>
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
														<label>电支路URL</label> <input
															class="form-control circuitUrl">
														<p class="help-block">/pd/t2/eng_station/total2</p>
													</div>
													<div class="form-group">
														<label>电支路名称</label> <input
															class="form-control circuitName">
														<p class="help-block">测试电支路</p>
													</div>

													<div class="form-group">
														<label>所在位置</label> <input class="form-control location">
														<p class="help-block">第五机柜</p>
													</div>

													<div class="form-group all-efds">
														<label>上级电支路</label> <select class="form-control parentId">
															<option>1</option>
															<option>2</option>
															<option>3</option>
															<option>4</option>
															<option>5</option>
														</select>
													</div>

													<div class="form-group">
														<label>额定电流,单位：A</label> <input
															class="form-control switchRatedC">
														<p class="help-block">100</p>
													</div>
													<div class="form-group">
														<label>电压等级，单位：V</label> <input
															class="form-control levelV">
														<p class="help-block">220</p>
													</div>

													<div class="form-group">
														<label>设计功率，单位：kw</label> <input
															class="form-control designPower">
														<p class="help-block">100</p>
													</div>

													<div class="form-group">
														<label>电源相数，1 or 3</label> <select
															class="form-control powerPhase">
															<option>1</option>
															<option>3</option>
														</select>
													</div>
													<button type="submit" onclick=add_efd()
														class="btn btn-default">提交</button>
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
										<div class="div scrollbar" style="padding-top:0px; height:350px;overflow: auto">
											<table class="table table-striped table-bordered table-hover"
												id="dm_table">
												<thead>
													<tr>
														<th>电支路URL</th>
														<th>电支路名称</th>
														<th>所在位置</th>
														<th>额定电流</th>
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
						<!-- /.col-lg-12 -->
					</div>
				<jsp:include page="bottom_bar.jsp"></jsp:include>
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
		$(document).ready(function() {
			$("#def_page").css({'background-color':'#3b404a', 'border-color':'#3b404a'});
			$("#his_page").css({'background-color':'#269CE9'});
			$("#efd").toggleClass('active');
			$('#dm_table').DataTable({
				"language": chinese_langue,
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
		    	$(this).val(d.getFullYear() + "年" + (d.getMonth() + 1) + "月" + (d.getDate()) + "日");
		        $(this).datepicker({language: 'zh-CN',autoclose:true, todayHighlight:true, todayBtn: "linked"} );
			});
			$("#def_page").click(function() {
				window.location.href="/eospd_h5/efd_chart";
			});
		});
	</script>

</body>
</html>