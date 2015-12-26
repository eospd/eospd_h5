<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<jsp:include page="header.jsp"></jsp:include>


<style>
.topRoundRect {
	text-align: center;
	font-size: 12px;
	width: 160px;
	color: white;
	padding: 4px;
	-webkit-border-radius: 15px 15px 0px 0px;
	-moz-border-radius: 15px 15px 0px 0px;
	background-color: grey;
}

.bottomRoundRect {
	text-align: center;
	font-size: 8px;
	width: 160px;
	height: 110px;
	color: white;
	-webkit-border-radius: 0px 0px 15px 15px;
	-moz-border-radius: 0px 0px 15px 15px;
	background-color: rgb(51, 55, 65);
}

input {
	-webkit-appearance: none; /* remove default */
	display: block;
	width: 24px;
	height: 24px;
	border-radius: 12px;
	vertical-align: middle;
	cursor: pointer;
	box-shadow: hsla(0, 0%, 100%, .15) 0 1px 1px, inset hsla(0, 0%, 0%, .5)
		0 0 0 1px;
	background-color: hsla(0, 0%, 0%, .2);
	background-image: -webkit-radial-gradient(hsla(200, 100%, 90%, 1) 0%,
		hsla(200, 100%, 70%, 1) 15%, hsla(200, 100%, 60%, .3) 28%,
		hsla(200, 100%, 30%, 0) 70%);
	background-repeat: no-repeat;
}

input, input:active {
	background-position: 0 24px;
}

input:checked {
	background-position: 0 0;
}
</style>

<body>
	<div class="row">
		<!--  <div class="col-md-1 left-right-empty"></div>
		<div class="col-md-10 left-right-empty">
			<div id="wrapper">-->
		<div id="wrapper">
			<div id="content-div">

				<jsp:include page="left_sidebar.jsp"></jsp:include>
				<div id="page-wrapper">
					<div class="div scrollbar"
						style="padding-top: 10px; height: 480px; overflow: auto">

						<div class="row"
							style="padding-top: 15px; margin: auto; width: 80%;">
							<div class="col-lg-3">
								<div class="topRoundRect">能耗数据采集间隔</div>
								<div class="bottomRoundRect">
									<table style="margin: auto; height: 100%; width: 80%">
										<tr>
											<td><input style="margin: auto;" id="enconCollection1" type="radio"
												name="group1" /></td>
											<td><input style="margin: auto;" id="enconCollection10" type="radio"
												name="group1" /></td>
											<td><input style="margin: auto;" id="enconCollection30" type="radio"
												name="group1" /></td>
											<td><input style="margin: auto;" id="enconCollection60" type="radio"
												name="group1" /></td>
										</tr>
										<tr>
											<td>1s</td>
											<td>10s</td>
											<td>30s</td>
											<td>60s</td>
										</tr>
										<tr>
											<td><input style="margin: auto;" id="enconCollection300" type="radio"
												name="group1" /></td>
											<td><input style="margin: auto;" id="enconCollection600" type="radio"
												name="group1" /></td>
											<td><input style="margin: auto;" id="enconCollection900" type="radio"
												name="group1" checked="checked" /></td>
											<td><input style="margin: auto;" id="enconCollection1800" type="radio"
												name="group1" /></td>
										</tr>
										<tr>
											<td>5m</td>
											<td>10m</td>
											<td>15m</td>
											<td>30m</td>
										</tr>
									</table>
								</div>
							</div>

							<div class="col-lg-3">
								<div class="topRoundRect">能耗本地上传间隔</div>
								<div class="bottomRoundRect">
									<table style="margin: auto; height: 100%; width: 80%">
										<tr>
											<td><input style="margin: auto;" id="enconLocal1" type="radio"
												name="group2" checked="checked" /></td>
											<td><input style="margin: auto;" id="enconLocal10" type="radio"
												name="group2" /></td>
											<td><input style="margin: auto;" id="enconLocal30" type="radio"
												name="group2" /></td>
											<td><input style="margin: auto;" id="enconLocal60" type="radio"
												name="group2" /></td>
										</tr>
										<tr>
											<td>1s</td>
											<td>10s</td>
											<td>30s</td>
											<td>60s</td>
										</tr>
										<tr>
											<td><input style="margin: auto;" id="enconLocal300" type="radio"
												name="group2" /></td>
											<td><input style="margin: auto;" id="enconLocal600" type="radio"
												name="group2" /></td>
											<td><input style="margin: auto;" id="enconLocal900" type="radio"
												name="group2" /></td>
											<td><input style="margin: auto;" id="enconLocal1800" type="radio"
												name="group2" /></td>
										</tr>
										<tr>
											<td>5m</td>
											<td>10m</td>
											<td>15m</td>
											<td>30m</td>
										</tr>
									</table>
								</div>
							</div>


							<div class="col-lg-3">
								<div class="topRoundRect">能耗远程上传间隔</div>
								<div class="bottomRoundRect">
									<table style="margin: auto; height: 100%; width: 80%">
										<tr>
											<td><input style="margin: auto;" id="enconRemote1" type="radio"
												name="group3" /></td>
											<td><input style="margin: auto;" id="enconRemote10" type="radio"
												name="group3" /></td>
											<td><input style="margin: auto;" id="enconRemote30" type="radio"
												name="group3" /></td>
											<td><input style="margin: auto;" id="enconRemote60" type="radio"
												name="group3" /></td>
										</tr>
										<tr>
											<td>1s</td>
											<td>10s</td>
											<td>30s</td>
											<td>60s</td>
										</tr>
										<tr>
											<td><input style="margin: auto;" id="enconRemote300" type="radio"
												name="group3" /></td>
											<td><input style="margin: auto;" id="enconRemote600" type="radio"
												name="group3" /></td>
											<td><input style="margin: auto;" id="enconRemote900" type="radio"
												name="group3" checked="checked" /></td>
											<td><input style="margin: auto;" id="enconRemote1800" type="radio"
												name="group3" /></td>
										</tr>
										<tr>
											<td>5m</td>
											<td>10m</td>
											<td>15m</td>
											<td>30m</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="topRoundRect">能耗上传精度</div>
								<div class="bottomRoundRect">
									<div class="row" style="padding-top: 30px">
										<div class="col-lg-4">
											<input style="margin: auto;" id="enconDecimal96" type="radio" name="group4" />
										</div>
										<div class="col-lg-4">
											<input style="margin: auto;" id="enconDecimal100" type="radio" name="group4" />
										</div>
										<div class="col-lg-4">
											<input style="margin: auto;" id="enconDecimal200" type="radio" name="group4"
												checked="checked" />
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4">0.96</div>
										<div class="col-lg-4">1.00</div>
										<div class="col-lg-4">2.00</div>
									</div>
								</div>
							</div>
						</div>


						<!-- row 2 start -->
						<div class="row"
							style="padding-top: 15px; margin: auto; width: 80%;">
							<div class="col-lg-3">
								<div class="topRoundRect">能量数据采集间隔 </div>
								<div class="bottomRoundRect">
									<table style="margin: auto; height: 100%; width: 80%">
										<tr>
											<td><input style="margin: auto;" id="enCollection1" type="radio"
												name="group5" /></td>
											<td><input style="margin: auto;" id="enCollection10" type="radio"
												name="group5" /></td>
											<td><input style="margin: auto;" id="enCollection30" type="radio"
												name="group5" /></td>
											<td><input style="margin: auto;" id="enCollection60" type="radio"
												name="group5" checked="checked" /></td>
										</tr>
										<tr>
											<td>1s</td>
											<td>10s</td>
											<td>30s</td>
											<td>60s</td>
										</tr>
										<tr>
											<td><input style="margin: auto;" id="enCollection300" type="radio"
												name="group5" /></td>
											<td><input style="margin: auto;" id="enCollection600" type="radio"
												name="group5" /></td>
											<td><input style="margin: auto;" id="enCollection900" type="radio"
												name="group5" /></td>
											<td><input style="margin: auto;" id="enCollection1800" type="radio"
												name="group5" /></td>
										</tr>
										<tr>
											<td>5m</td>
											<td>10m</td>
											<td>15m</td>
											<td>30m</td>
										</tr>
									</table>
								</div>
							</div>

							<div class="col-lg-3">
								<div class="topRoundRect">能量本地上传间隔</div>
								<div class="bottomRoundRect">
									<table style="margin: auto; height: 100%; width: 80%">
										<tr>
											<td><input style="margin: auto;" id="enLocal1" type="radio"
												name="group6" /></td>
											<td><input style="margin: auto;" id="enLocal0" type="radio"
												name="group6" /></td>
											<td><input style="margin: auto;" id="enLocal30" type="radio"
												name="group6" /></td>
											<td><input style="margin: auto;" id="enLocal60" type="radio"
												name="group6" /></td>
										</tr>
										<tr>
											<td>1s</td>
											<td>10s</td>
											<td>30s</td>
											<td>60s</td>
										</tr>
										<tr>
											<td><input style="margin: auto;" id="enLocal300" type="radio"
												name="group6" /></td>
											<td><input style="margin: auto;" id="enLocal600" type="radio"
												name="group6" checked="checked" /></td>
											<td><input style="margin: auto;" id="enLocal900" type="radio"
												name="group6" /></td>
											<td><input style="margin: auto;" id="enLocal1800" type="radio"
												name="group6" /></td>
										</tr>
										<tr>
											<td>5m</td>
											<td>10m</td>
											<td>15m</td>
											<td>30m</td>
										</tr>
									</table>
								</div>
							</div>


							<div class="col-lg-3">
								<div class="topRoundRect">能量远程上传间隔</div>
								<div class="bottomRoundRect">
									<table style="margin: auto; height: 100%; width: 80%">
										<tr>
											<td><input style="margin: auto;" id="enRemote1" type="radio"
												name="group7" /></td>
											<td><input style="margin: auto;" id="enRemote10" type="radio"
												name="group7" checked="checked" /></td>
											<td><input style="margin: auto;" id="enRemote30" type="radio"
												name="group7" /></td>
											<td><input style="margin: auto;" id="enRemote60" type="radio"
												name="group7" /></td>
										</tr>
										<tr>
											<td>1s</td>
											<td>10s</td>
											<td>30s</td>
											<td>60s</td>
										</tr>
										<tr>
											<td><input style="margin: auto;" id="enRemote300" type="radio"
												name="group7" /></td>
											<td><input style="margin: auto;" id="enRemote600" type="radio"
												name="group7" /></td>
											<td><input style="margin: auto;" id="enRemote900" type="radio"
												name="group7" /></td>
											<td><input style="margin: auto;" id="enRemote1800" type="radio"
												name="group7" /></td>
										</tr>
										<tr>
											<td>5m</td>
											<td>10m</td>
											<td>15m</td>
											<td>30m</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="topRoundRect">能量上传精度</div>
								<div class="bottomRoundRect">
									<div class="row" style="padding-top: 30px">
										<div class="col-lg-4">
											<input style="margin: auto;" id="enDecimal96" type="radio" name="group8"
												checked="checked" />
										</div>
										<div class="col-lg-4">
											<input style="margin: auto;" id="enDecimal100" type="radio" name="group8" />
										</div>
										<div class="col-lg-4">
											<input style="margin: auto;" id="enDecimal200" type="radio" name="group8" />
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4">0.96</div>
										<div class="col-lg-4">1.00</div>
										<div class="col-lg-4">2.00</div>
									</div>
								</div>
							</div>


						</div>

						<!-- row 2 end -->

						<!-- row 3 start -->
						<div class="row"
							style="padding-top: 15px; margin: auto; width: 80%;">
							<div class="col-lg-3">
								<div class="topRoundRect">环境数据采集间隔</div>
								<div class="bottomRoundRect">
									<table style="margin: auto; height: 100%; width: 80%">
										<tr>
											<td><input style="margin: auto;" id="envCollection1" type="radio"
												name="group9" /></td>
											<td><input style="margin: auto;" id="envCollection10" type="radio"
												name="group9" /></td>
											<td><input style="margin: auto;" id="envCollection30" type="radio"
												name="group9" checked="checked" /></td>
											<td><input style="margin: auto;" id="envCollection60" type="radio"
												name="group9" /></td>
										</tr>
										<tr>
											<td>1s</td>
											<td>10s</td>
											<td>30s</td>
											<td>60s</td>
										</tr>
										<tr>
											<td><input style="margin: auto;" id="envCollection300" type="radio"
												name="group9" /></td>
											<td><input style="margin: auto;" id="envCollection600" type="radio"
												name="group9" /></td>
											<td><input style="margin: auto;" id="envCollection900" type="radio"
												name="group9" /></td>
											<td><input style="margin: auto;" id="envCollection1800" type="radio"
												name="group9" /></td>
										</tr>
										<tr>
											<td>5m</td>
											<td>10m</td>
											<td>15m</td>
											<td>30m</td>
										</tr>
									</table>
								</div>
							</div>

							<div class="col-lg-3">
								<div class="topRoundRect">环境本地上传间隔</div>
								<div class="bottomRoundRect">
									<table style="margin: auto; height: 100%; width: 80%">
										<tr>
											<td><input style="margin: auto;" id="envLocal1" type="radio"
												name="group10" checked="checked" /></td>
											<td><input style="margin: auto;" id="envLocal10" type="radio"
												name="group10" /></td>
											<td><input style="margin: auto;" id="envLocal30" type="radio"
												name="group10" /></td>
											<td><input style="margin: auto;" id="envLocal60" type="radio"
												name="group10" /></td>
										</tr>
										<tr>
											<td>1s</td>
											<td>10s</td>
											<td>30s</td>
											<td>60s</td>
										</tr>
										<tr>
											<td><input style="margin: auto;" id="envLocal300" type="radio"
												name="group10" /></td>
											<td><input style="margin: auto;" id="envLocal600" type="radio"
												name="group10" /></td>
											<td><input style="margin: auto;" id="envLocal900" type="radio"
												name="group10" /></td>
											<td><input style="margin: auto;" id="envLocal1800" type="radio"
												name="group10" /></td>
										</tr>
										<tr>
											<td>5m</td>
											<td>10m</td>
											<td>15m</td>
											<td>30m</td>
										</tr>
									</table>
								</div>
							</div>


							<div class="col-lg-3">
								<div class="topRoundRect">环境远程上传间隔</div>
								<div class="bottomRoundRect radioGroup">
									<table style="margin: auto; height: 100%; width: 80%">
										<tr>
											<td><input style="margin: auto;" id="envRemote1" type="radio"
												name="group11" /></td>
											<td><input style="margin: auto;" id="envRemote10" type="radio"
												name="group11" /></td>
											<td><input style="margin: auto;" id="envRemote30" type="radio"
												name="group11" checked="checked" /></td>
											<td><input style="margin: auto;" id="envRemote60" type="radio"
												name="group11" /></td>
										</tr>
										<tr>
											<td>1s</td>
											<td>10s</td>
											<td>30s</td>
											<td>60s</td>
										</tr>
										<tr>
											<td><input style="margin: auto;" id="envRemote300" type="radio"
												name="group11" /></td>
											<td><input style="margin: auto;" id="envRemote600" type="radio"
												name="group11" /></td>
											<td><input style="margin: auto;" id="envRemote900" type="radio"
												name="group11" /></td>
											<td><input style="margin: auto;" id="envRemote1800" type="radio"
												name="group11" /></td>
										</tr>
										<tr>
											<td>5m</td>
											<td>10m</td>
											<td>15m</td>
											<td>30m</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="topRoundRect">环境数据上传精度</div>
								<div class="bottomRoundRect">
									<div class="row" style="padding-top: 30px">
										<div class="col-lg-4">
											<input style="margin: auto;" id="envDecimal96" type="radio" name="group12" />
										</div>
										<div class="col-lg-4">
											<input style="margin: auto;" id="envDecimal100" type="radio" name="group12"
												checked="checked" />
										</div>
										<div class="col-lg-4">
											<input style="margin: auto;" id="envDecimal200" type="radio" name="group12" />
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4">0.96</div>
										<div class="col-lg-4">1.00</div>
										<div class="col-lg-4">2.00</div>
									</div>
								</div>
							</div>


						</div>
						<!-- row 3 end -->

					</div>
					<jsp:include page="bottom_bar.jsp"></jsp:include>
					<!-- /#page-wrapper -->
				</div>
				<!-- /#wrapper -->

			</div>
		</div>
		<!--  <div class="col-md-1 left-right-empty"></div>-->
	</div>
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>

	<script type="text/javascript" src="js/bootstrap.min.js"></script>

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
				$("#his_page").toggleClass('active');
				//$("#index").toggleClass('active');
				$("#def_page").click(function() {
					window.location.href="/eospd_h5/efd_chart";
				});
				
				$("#r1").on("change", function(e) {
					console.log($(e.target).val()); 
				});
				
				$.get("/eospd_h5/cid/data_admin?areaId=8&subsysId=3", function(data ,status){
				 	var kvs = data.kvs;
				 	for(var k in kvs) {
				 		var kk = '#'+ k + kvs[k];
						//console.log("kk:" +kk);
				        $(kk).attr("checked",'checked');
				 	 
				 	}
				});
				
			});
		</script>
</body>

</html>