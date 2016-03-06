<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<jsp:include page="header.jsp"></jsp:include>

<body>
	<div class="row">
		<!--  <div class="col-md-1 left-right-empty"></div>-->
		<div id="wrapper">
			<div id="content-div">
				<jsp:include page="left_sidebar.jsp"></jsp:include>
				<div id="page-wrapper">

					<div class="panel-body div" style="height: 480px">

						<div class="row" style="height: 50px; padding-top: 10px">
							<div class="col-lg-6">
								<div class="col-lg-9">
									<div class="input-group input-daterange">
										<span class="input-group-addon" style="color: darkgray;background-color: transparent;border: 0;">开始时间</span>
										<input style="color: darkgrey; margin-left: 5px" type="text"
											class="form-control s_time_y" value="">
									</div>
								</div>
								<div class="col-lg-3" style="padding-left: 0px">
									<input class ="s_time_hm"
										style="color: darkgrey; text-align: center; width: 60px; height: 34px; border-radius: 0 3px 3px 0; background-color: rgb(47, 52, 63); border: none;"
										value="00:00"></input>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="col-lg-9">
									<div class="input-group input-daterange">
										<span class="input-group-addon" style="color: darkgray;background-color: transparent;border: 0;">结束时间</span>
										<input style="color: darkgrey; margin-left: 5px" type="text"
											class="form-control e_time_y" value="">
									</div>
								</div>
								<div class="col-lg-3" style="padding-left: 0px">
									<input  class ="e_time_hm"
										style="text-align: center; width: 60px; height: 34px; border-radius: 0 3px 3px 0; background-color: rgb(47, 52, 63); border: none; color: darkgray"
										value="00:00"></input>
								</div>
							</div>
						</div>


						<div class="row" style="margin-top: 60px">
							<canvas id="meter_canvas" width=715 height=324
								style="margin:0 auto;"></canvas>
							<div class="row" style="height: 50px">
								<div class="col-lg-4">
									<label
										style="padding-right: 25px; float: right; font-size: 18px">数据有效</label>
								</div>
								<div class="col-lg-4">
									<label style="font-size: 20px">数据质量</label>
								</div>
								<div class="col-lg-4">
									<label style="padding-left: 25px; float: left; font-size: 18px">通讯有效</label>
								</div>
							</div>

						</div>
					</div>
					<jsp:include page="bottom_bar.jsp"></jsp:include>
				</div>
				<!-- /#wrapper -->
			</div>
		</div>
		<!--  <div class="col-md-1 left-right-empty"></div>-->
	</div>
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.plugin.min.js"></script>
	<script src="js/jquery.timer.min.js"></script>

	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
		src="js/bootstrap-datetimepicker.zh-CN.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/sb-admin-2.js"></script>
	<script src="js/eospd.js"></script>

	<script type="text/javascript" src="js/ECOTree.js"></script>
	<script type="text/javascript">
		function loadImages(sources, callback) {
			var images = {};
			var loadedImages = 0;
			var numImages = 0;
			start = 0;
			step = 0;
			// get num of sources
			for ( var src in sources) {
				numImages++;
			}
			for ( var src in sources) {
				images[src] = new Image();
				images[src].onload = function() {
					if (++loadedImages >= numImages) {
						callback(images);
					}
				};
				images[src].src = sources[src];
			}
		};

		var sources = {
			guage_bg : 'imgs/guage.png'//,
		//guage_line: 'imgs/guage_line.png',
		//guage_round: 'imgs/guage_round.png'
		};

		createMeter = function(ctx, images, start, leftV, midV, rightV) {
			var w = 715;
			var h = 324;

			var small_r = 251 / 2;

			ctx.clearRect(0, 0, w, h);

			var canvas = document.getElementById("meter_canvas");
			var ctx = canvas.getContext('2d');
			//ctx.drawImage(images.guage_bg, 0, 0, 508, 220);
			//ctx.drawImage(images.guage_line, 508 / 2 - 10, 220/2 - 79, 20, 80);
			//ctx.drawImage(imloadImagesages.guage_round, 508 / 2 - 10, 220/2-10, 20, 20);
			var green = 'rgb(61, 214, 119)';
			var blue = 'rgb(63,176,234)';
			var red = 'rgb(244,92,72)';
			ctx.fillStyle = green;//填充颜色：红色，半透明
			ctx.strokeStyle = green;//线条颜色：绿色
			ctx.lineWidth = 1;//设置线宽

			var img = new Image();
			img.src = "imgs/guage.png";
			ctx.drawImage(img, 0, 0, w, h);
			var midx = w / 2;
			var midy = h / 2;
			var midR = start;

			ctx.save();
			ctx.translate(midx, midy)
			if (midV < start) {
				midR = midV;
			}

			if (midR > 95) {
				ctx.fillStyle = red;
				ctx.strokeStyle = red;
			} else if (midR > 80) {
				ctx.fillStyle = blue;
				ctx.strokeStyle = blue;
			}
			ctx.rotate(midR * Math.PI / 180 * 2.7 - 135 * Math.PI / 180);
			ctx.translate(-1 * midx, -1 * midy);
			ctx.moveTo(midx - 5, midy);
			ctx.lineTo(midx, midy - 80);
			ctx.lineTo(midx + 5, midy);
			ctx.closePath();//可以把这句注释掉再运行比较下不同
			ctx.stroke();//画线框
			ctx.fill();//填充颜色

			ctx.beginPath();
			ctx.arc(midx, midy, 10, 0, Math.PI * 2, true);
			ctx.closePath();
			ctx.stroke();
			ctx.fill();
			ctx.restore();

			ctx.save();
			var textWidth = ctx.measureText("数据质量").width; //文字宽
			ctx.fillStyle = "white";
			ctx.font = "22px serif";
			//ctx.fillText("数据质量", midx - textWidth / 2 - 10, midy + midy / 3 +40);
			var m_width = ctx.measureText(midR + "%").width;
			ctx.fillText(midR + "%", midx - m_width / 2, midy + 10
					+ midy / 3);
			ctx.restore();

			var rightx = w - small_r;
			var righty = h - small_r - 18;
			var rightR = start;

			ctx.save();
			ctx.beginPath();

			ctx.translate(rightx, righty);
			if (rightV < start) {
				rightR = rightV;
			}
			if (rightR > 80) {
				ctx.fillStyle = red;
				ctx.strokeStyle = red;
			} else if (rightR > 60) {
				ctx.fillStyle = blue;
				ctx.strokeStyle = blue;
			}
			ctx.rotate(Math.PI * (-1 * rightR * 1.8 / 180 + 18 * 8 / 180));
			ctx.translate(-1 * rightx, -1 * righty);
			ctx.moveTo(rightx - 4, righty);
			ctx.lineTo(rightx, righty - 60);
			ctx.lineTo(rightx + 4, righty);
			ctx.closePath();//可以把这句注释掉再运行比较下不同
			ctx.stroke();//画线框
			ctx.fill();//填充颜色

			ctx.beginPath();
			ctx.arc(rightx, righty, 10, 0, Math.PI * 2, true);
			ctx.closePath();
			ctx.fill();
			ctx.restore();

			ctx.save();
			var textWidth = ctx.measureText("通讯有效").width; //文字宽
			ctx.fillStyle = "white";
			ctx.font = "20px serif";
			//ctx.fillText("通讯有效", rightx - textWidth / 2 - 10, righty + righty / 3 + 24);
			var r_width = ctx.measureText(rightR + "%").width;
			ctx.fillText(rightR + "%", rightx - r_width / 2, righty + 5
					+ righty / 3);
			ctx.restore();

			var leftx = small_r;
			var lefty = h - small_r - 18;
			ctx.beginPath();
			ctx.save();
			ctx.translate(leftx, lefty);
			var leftR = start;
			if (leftV < start) {
				leftR = leftV;
			}
			if (leftR > 95) {
				ctx.fillStyle = red;
				ctx.strokeStyle = red;
			} else if (leftR > 80) {
				ctx.fillStyle = blue;
				ctx.strokeStyle = blue;
			}
			ctx.rotate(leftR * Math.PI / 180 * 1.8 - Math.PI * 18 * 8 / 180);

			ctx.translate(-1 * leftx, -1 * lefty);
			ctx.moveTo(leftx - 4, lefty);
			ctx.lineTo(leftx, lefty - 60);
			ctx.lineTo(leftx + 4, lefty);
			ctx.closePath();//可以把这句注释掉再运行比较下不同
			ctx.stroke();//画线框
			ctx.fill();//填充颜色

			ctx.beginPath();
			ctx.arc(leftx, lefty, 10, 0, Math.PI * 2, true);
			ctx.closePath();
			ctx.stroke();
			ctx.fill();
			ctx.restore();

			ctx.save();
			var textWidth = ctx.measureText("数据有效").width; //文字宽
			ctx.fillStyle = "white";
			ctx.font = "20px serif";
			//ctx.fillText("数据有效", leftx - 20, lefty + lefty / 3 + 24);
			var l_width = ctx.measureText(leftR + "%").width;
			
			ctx.fillText(leftR + "%", leftx - l_width / 2, lefty + 5 + lefty / 3);
			ctx.restore();
		};

		var leftV = 0;
		var midV = 0;
		var rightV = 0;
		var start = 0;
		var step = 0;
		animat = function(images) {
			//span.textContent = options.start + '%';
			var canvas = document.getElementById("meter_canvas");
			var ctx = canvas.getContext('2d');

			createMeter(ctx, images, start, leftV, midV, rightV);
			//console.log(step);
			start ++;
			//step += 0.02;
			if (start <= leftV || start <= midV || start <= rightV) {
				setTimeout(animat, 10);
			} else {
				createMeter(ctx, images, start, leftV, midV, rightV);
			}
			
		};
	</script>

	<script>
		$(document).ready(
				function() {
					$('.input-daterange input').each(
							function(i) {
								var d = new Date();
								if (0 == i) {
									if (null != $.getUrlParam('s_time')) {
										d = new Date($.getUrlParam('s_time'));
									}
									$('.s_time_hm').val("00:00");
								} else {
									if (null != $.getUrlParam('e_time')) {
										d = new Date($.getUrlParam('e_time'));
									}
									$('.e_time_hm').val(d.toString().split(' ')[4].substring(0, 5));
								}
								
								$(this).val(
										d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
												+ (d.getDate()) + "日");
								
								$(this).datetimepicker({
							        language:  'zh-CN',
							        weekStart: 1,
							        todayBtn:  1,
									autoclose: 1,
									todayHighlight: 1,
									startView: 2,
									forceParse: 0,
									autoclose : true,
									endDate: new Date(),
									format: 'yyyy年mm月dd日'
								}).on('changeDate', function(value) {
									//console.log("i:" +i);
									if (0 == i) {
										$('.s_time_hm').val(value.date.toGMTString().split(' ')[4].substring(0, 5));
									} else {
										$('.e_time_hm').val(value.date.toGMTString().split(' ')[4].substring(0, 5));
									}
									//getMeterData();
								});
							});
					
					getMeterData();
					loadImages(sources, animat);
					$('#dm_table').DataTable({
						"processing" : true,
						"serverSide" : true,
						"ajax" : {
							"url" : "/eospd_h5/cid/list",
							"type" : "POST"
						},
						"columns" : [ {
							"data" : "currentTime"
						}, {
							"data" : "deviceId"
						}, {
							"data" : "dataEffRate"
						}, {
							"data" : "meterOnlineRate"
						}, {
							"data" : "realCollectRate"
						} ]
					});

					

					// 每隔十五分钟，自动拉取服务器数据
					$('body').timer({
						callback: function() {

							var d = new Date();
							$('.e_time_y').val(
									d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
											+ (d.getDate()) + "日");

							$('.e_time_hm').val(d.toString().split(' ')[4].substring(0, 5));
							
							

							d = new Date(d.valueOf() - 900000);
							$('.s_time_y').val(
									d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
											+ (d.getDate()) + "日");
							
							$('.s_time_hm').val(d.toString().split(' ')[4].substring(0, 5));

							
							getMeterData(); },
						repeat: true,
						//delay: 60000
						delay: 900000
					});
					
					$("#btn_refresh").click(function() {
						getMeterData();
					});
					
					$("#btn_rest").click(function() {
						
						var d = new Date();
						$('.e_time_y').val(
								d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
										+ (d.getDate()) + "日");

						$('.e_time_hm').val(d.toString().split(' ')[4].substring(0, 5));
						
						

						d = new Date(d.valueOf() - 900000);
						$('.s_time_y').val(
								d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
										+ (d.getDate()) + "日");
						
						$('.s_time_hm').val("00:00");

						
						
						getMeterData();
					});
					

					$("#his_page").click(function() {
						var s_time =  $('.s_time_y').val().replace('年', '-').replace('月', '-').replace('日' ,'') + " " + $('.s_time_hm').val();
						var e_time = $('.e_time_y').val().replace('年', '-').replace('月', '-').replace('日' ,'') + " " + $('.e_time_hm').val();
					
						window.location.href = '/eospd_h5/col_his?s_time=' + s_time + '&e_time=' + e_time;
					});

					$(".t2_e").click(function() {
						getMeterData();
					});
				});

		getMeterData = function() {
			var s_time =  $('.s_time_y').val().replace('年', '-').replace('月', '-').replace('日' ,'') + " " + $('.s_time_hm').val();
			var e_time = $('.e_time_y').val().replace('年', '-').replace('月', '-').replace('日' ,'') + " " + $('.e_time_hm').val();
			$.get('/eospd_h5/cid/sys_spec/?s_time=' + s_time + '&e_time=' + e_time, 
					function(result) {

					$.each(result, function(a, b) {
						if (a == 'dataQuality') {
							midV = b;
						}
						if (a == 'commValid') {
							rightV = b;
						}
						if (a == 'dataValid') {
							leftV = b;
						}
					});

				console.log(' leftV:' + leftV + ",midV:" + midV + ",rightV:"
						+ rightV);

				loadImages(sources, animat);
			});
			$("#electric_monitor").toggleClass('active');
		};
	</script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->

</body>

</html>