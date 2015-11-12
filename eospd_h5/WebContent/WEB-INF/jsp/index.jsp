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

					<div class="panel-body">

						<table class="table-none" id="filter_table">
							<tr>
								<th></th>
								<th style="width: 250px; padding-left: 10px">
									<div class="input-group input-daterange pull-right">
										<span class="input-group-addon">选择日期：</span> <input
											type="text" class="form-control" value="">
									</div>
								</th>
								<th>
									<button id="btn_refresh" class="color black button"
										style="margin-left: 250px">刷新</button>
								</th>
							</tr>
						</table>
						<div class="div">
							<canvas id="meter_canvas" width=508 height=220
								style="margin:0 auto;"></canvas>
						</div>

						<div class="div" style="height: 90px; padding-top: 10px">
							<div class="row">
								<div class="col-lg-3">
									<button class="color black button">机场电力</button>
								</div>
								<div class="col-lg-3">
									<button class="color black button">远程抄表</button>
								</div>
								<div class="col-lg-3">
									<button class="color green button">电力监控</button>
								</div>
								<div class="col-lg-3">
									<button class="color black button">能量监控</button>
								</div>
							</div>

							<div class="row" style="padding-top: 10px;">
								<div class="col-lg-4">
									<button class="color black button">楼宇自动系统</button>
								</div>
								<div class="col-lg-4">
									<button class="color black button">机房群控系统</button>
								</div>
								<div class="col-lg-4">
									<button class="color black button">照明控制系统</button>
								</div>
							</div>
						</div>
					</div>
				</div>
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

	<script type="text/javascript" src="js/ECOTree.js"></script>
	<script type="text/javascript">
		function loadImages(sources, callback) {
	        var images = {};
	        var loadedImages = 0;
	        var numImages = 0;
	        start = 0;
	        step = 0;
	        // get num of sources
	        for(var src in sources) {
	          numImages++;
	        }
	        for(var src in sources) {
	          images[src] = new Image();
	          images[src].onload = function() {
	            if(++loadedImages >= numImages) {
	              callback(images);
	            }
	          };
	          images[src].src = sources[src];
	        }
	      };

	      var sources = {
	        guage_bg: 'imgs/guage.png'//,
	        //guage_line: 'imgs/guage_line.png',
	        //guage_round: 'imgs/guage_round.png'
	      };
	    	     
      createMeter = function(ctx, images, start, leftV, midV, rightV) {
		ctx.clearRect(0, 0, 508, 220);
		

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
	   	ctx.drawImage(img, 0, 0, 508, 220);
		var midx = 508 / 2;
	   	var midy = 220 / 2;
	  	var midR = start;
	   
	   
	   ctx.save();   
	   ctx.translate(midx, midy)
	   if (midV < start) {
		   midR = midV;
	   } 

	   if (midR > 95){
		   ctx.fillStyle=red;
		   ctx.strokeStyle =red;
	   } else if (midR > 80) {
	   		ctx.fillStyle=blue;
	   		ctx.strokeStyle =blue;
	   }
	   ctx.rotate(midR * Math.PI / 180 * 2.7 - 135 * Math.PI / 180);
	   ctx.translate(-1 * midx, -1 * midy);
	   ctx.moveTo(midx - 5, midy); 
	   ctx.lineTo(midx, midy-80);
	   ctx.lineTo(midx+5, midy);
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
	   ctx.fillStyle="white";
	   ctx.font="16px serif";
	   ctx.fillText("数据质量", midx-textWidth/2-10, midy+midy/3);
	   ctx.fillText(midR+"%", midx-textWidth/2-10, midy+16+midy/3);
	   ctx.restore();
		  
	   var rightx = 508 - 95;
	   var righty = 220 - 97;
	   var rightR = start;
	   
	   ctx.save();   
	   ctx.beginPath();
	   
	   ctx.translate( rightx, righty);
	   if (rightV < start) {
		   rightR = rightV;
	   }
	   if (rightR > 80){
		   ctx.fillStyle = red;
		   ctx.strokeStyle = red;
	   } else if (rightR > 60) {
	   	   ctx.fillStyle = blue;
	   	   ctx.strokeStyle =blue;
	   }
	   ctx.rotate(Math.PI * (-1 * rightR * 1.8 / 180 + 18*8/180));
	   ctx.translate(-1 * rightx, -1 * righty);
	   ctx.moveTo(rightx - 4, righty); 
	   ctx.lineTo(rightx, righty-60);
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
	   ctx.fillStyle="white";
	   ctx.font="14px serif";
	   ctx.fillText("通讯有效", rightx-textWidth/2-10, righty+righty/3);
	   ctx.fillText(rightR+"%", rightx-textWidth/2-10, righty+14+righty/3);
	   ctx.restore();
	   
	   
	   var leftx = 95;
	   var lefty = 220-97;
	   ctx.beginPath();
	   ctx.save();   
	   ctx.translate( leftx, lefty);
	   var leftR = start;
	   if (leftV  < start) {
		   leftR = leftV;
	   }
	   if (leftR > 95){
		   ctx.fillStyle=red;
		   ctx.strokeStyle =red;
	   }else if (leftR > 80) {
   			ctx.fillStyle = blue;
		   ctx.strokeStyle =blue;
	   }
	   ctx.rotate(leftR * Math.PI / 180 * 1.8 - Math.PI*18*8/180);

	   ctx.translate(-1 * leftx, -1 * lefty);
	   ctx.moveTo(leftx - 4, lefty); 
	   ctx.lineTo(leftx, lefty-60);
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
	   ctx.fillStyle="white";
	   ctx.font="14px serif";
		  ctx.fillText("数据有效", leftx, lefty+lefty/3);
		  ctx.fillText(leftR+"%", leftx, lefty+14+lefty/3);
		  ctx.restore();
	};
	

      var leftV =10;
      var midV = 56;
      var rightV = 0;
      var start = 0;
      var step = 0;
		 animat = function (images){
			//span.textContent = options.start + '%';
			var canvas = document.getElementById("meter_canvas");
				var ctx = canvas.getContext('2d');
				
			createMeter(ctx, images, start, leftV, midV, rightV);
			console.log(step);
			start++;
			step += 0.02;
			if (start <= leftV || start <= midV || start <= rightV)
			{
				setTimeout(animat, 10);
			}
		};
			
		</script>
	<script>
                       $(document).ready(function() {
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
                                   },{
                                           "data" : "deviceId"
                                   }, {
                                           "data" : "dataEffRate"
                                   }, {
                                           "data" : "meterOnlineRate"
                                   }, {
                                           "data" : "realCollectRate"
                                   }]
                           });
                           
                           $('.input-daterange input').each(function() {
                           var d = new Date()
                           $(this).val(d.getFullYear() + "年" + (d.getMonth() + 1) + "月" + (d.getDate()) + "日");
                           $(this).datepicker({language: 'zh-CN',autoclose:true, todayHighlight:true, todayBtn: "linked", 
                           } ).on('changeDate', function(value) {
                       			   getMeterData(value.date, 0)
                           });
                           });
                   
                           $("#btn_refresh").click(function(){
                        	   console.log("------click refresh btn------");
                        	   var d = new Date();
                        	   getMeterData(d, 0);
                        	   //"dataEffRate":98.0,"meterOnlineRate":90.0,"realCollectRate":
                        	   //leftV = data.realCollectRate;
                        	   //midV = data.dataEffRate;
                        	   //rightV = data.meterOnlineRate;
                        	   });
                       
                       });
                       
                       getMeterData = function (date, deviceid) {
            			   var time = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
                    	   $.get('/eospd_h5/cid/sys_spec?time='+time+'&deviceid='+deviceid,  function(result){
                   		 	
                   	        $.each(result, function(key, val) {
                   	        	$.each(val, function(a, b) {
                   	        		if (a == 'dataEffRate') {
                   	        			midV = b;
                   	        		}
                   	        		if (a == 'meterOnlineRate'){
                   	        			rightV = b;
                   	        		}
                   	        		if (a== 'realCollectRate'){
                   	        			leftV = b;
                   	        		}
                   	        		
                   	        	console.log(a+" "+b);
                   	        	});
                   	        });

                        	   console.log(' leftV:'+leftV+",midV:"+midV+",rightV:"+rightV);
                        	 
                        	   loadImages(sources, animat);
                   		});	  
                       };
                       
               </script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->

</body>

</html>