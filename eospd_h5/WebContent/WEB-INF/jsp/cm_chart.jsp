<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<jsp:include page="header.jsp"></jsp:include>

<body>
		<!--  <div class="col-md-1 left-right-empty"></div>
		<div class="col-md-10 left-right-empty">
			<div id="wrapper"> -->
			<div id="wrapper">
		<div id="content-div">

				<jsp:include page="left_sidebar.jsp"></jsp:include>

				<div id="page-wrapper">
				
				<div class="panel-body div " style="height:480px;">
				<!--<div class="row" style="height:50px;padding-top: 10px">
					<div class="col-lg-6">
					<div class="col-lg-9">
								  	<div class="input-group input-daterange">
										<span class="input-group-addon" style="color:darkgray">开始时间</span> <input style="color:darkgrey; margin-left: 5px"
											type="text" class="form-control" value="">
									
								</div>	
								<div class="col-lg-3" style="padding-left:0px"><input style="color:darkgrey; text-align:center; width:60px; height:34px; border-radius: 0 3px 3px 0;background-color:rgb(47,52,63);border:none;" value="12:00"></input>
								</div>
									</div>
									<div class="col-lg-6">
							<div class="col-lg-9">
									<div class="input-group input-daterange">
										<span class="input-group-addon" style="color:darkgray">结束时间</span> <input style="color:darkgrey; margin-left: 5px"
											type="text" class="form-control" value="">
									</div>
								</div>	
								<div class="col-lg-3" style="padding-left:0px"><input style="text-align:center; width:60px; height:34px; border-radius: 0 3px 3px 0;background-color:rgb(47,52,63);border:none;color:darkgray" value="12:00"></input>
								</div>
							</div>
									</div>
-->

					<div class="scrollbar" id="topo_canvas" style="padding-top:10px; height:450px; overflow: auto; overflow-x: hidden">
					
						
							<!-- 
					<img src="imgs/cm_chart.png"/>
									<div class="panel-body">
										<div id="topo_canvas">
										</div>
									</div> -->
				</div>

			</div>
					<jsp:include page="bottom_bar.jsp"></jsp:include>
			<!-- /#page-wrapper -->
			</div>

		</div>
		<!--  <div class="col-md-1 left-right-empty"></div>-->
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.plugin.min.js"></script>
	<script src="js/jquery.timer.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
	
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
	<script type="text/javascript" src="js/ECOTree.js"></script>
	<script src="js/eospd.js"></script>
	<script src="js/jquery.dragscroll.js"></script>

<script>
			var onlineMap = new Map();
			var t = null;
			function CreateTree() {
				t = new ECOTree('t','topo_canvas');						
				t.config.iRootOrientation = ECOTree.RO_LEFT;
				var w = 120;
				var h = 40;
				var c = "#208DAD";
				var nodeCode = "#0F70A7";
				c = nodeCode;
				var target = false;
				var meta = 'hide';
				var show = 'show';
				t.config.defaultNodeWidth = w;
				t.config.defaultNodeHeight = h;
				t.config.iSubtreeSeparation = 40;
				t.config.iSiblingSeparation = 20;										
				//t.config.linkType = 'B';
				t.config.useTarget = target;
				t.config.nodeFill = ECOTree.NF_FLAT;//ECOTree.NF_GRADIENT;
				//t.config.colorStyle = ECOTree.CS_LEVEL;
				//t.config.levelColors = ["#966E00","#BC9400","#D9B100","#FFD700"];
				//t.config.levelBorderColors = ["#FFD700","#D9B100","#BC9400","#966E00"];
				t.config.nodeColor = c;
				t.config.nodeBorderColor = c;
				t.config.linkColor = "#208DAD";
				//32,141,173 
				t.add('0','-1', '', 50, 50,c, c, target, meta);
				t.add('1','0','TB-9802', 60, 30, "#189C8B", onlineMap['/ec2/dc/1'] == 1 ? "#189C8B" : "#FF0000", target, 'dc_/ec2/dc/1');
				t.add('2','1','MOXA DA-660-16', 120, 30, "#208DAD", onlineMap['/ec2/gw/1'] == 1 ? "#208DAD" : "#FF0000", target, 'gate_/ec2/gw/2');

				t.add('2_1','2','SN2_1', 100, 1,c, c, target, meta, 1);
				t.add('3','2_1','EPM 5500P-1');

				t.add('2_2','2','SN2_2', 100, 1,c, c, target, meta, 1);
				t.add('4','2_2','EPM 5500P-2', w, h, c, c, target, meta);
				t.add('5','2_2','EPM 5500P-3', w, h, c, c, target, meta);

				t.add('2_3', '2','SN2_3', 100, 1,c, c, target, meta, 1);
				t.add('6','2_3','PMAC600B-4', w, h, c, c, target, show);
				t.add('7','2_3','PMAC600B-5', w, h, c, c, target, meta);
				t.add('8','2_3','PMAC600B-6', w, h, c, c, target, meta);
				t.add('9','2_3','PMAC600B-7', w, h, c, c, target, meta);
				t.add('10','2_3','PMAC600B-8', w, h, c, c, target, show);

				t.add('2_4','2','SN2_4', 100, 1, c, c, target, meta, 1);
				t.add('12','2_4','PMAC600B-1', w, h, c, c, target, show);
				t.add('13','2_4','PMAC600B-2', w, h, c, c, target, meta);
				t.add('14','2_4','PMAC600B-3', w, h, c, c, target, meta);
				t.add('15','2_4','PMAC600B-4', w, h, c, c, target, meta);
				t.add('16','2_4','PMAC600B-5', w, h, c, c, target, meta);
				t.add('17','2_4','PMAC600B-6', w, h, c, c, target, show);

				t.add('2_5','2','SN2_5', 100, 1,c, c, target, meta, 1);
				t.add('19','2_5','PMAC600B-1', w, h, c, c, target, show);
				t.add('20','2_5','PMAC600B-2', w, h, c, c, target, meta);
				t.add('21','2_5','PMAC600B-3', w, h, c, c, target, meta);
				t.add('22','2_5','PMAC600B-4', w, h, c, c, target, meta);
				t.add('23','2_5','PMAC600B-5', w, h, c, c, target, meta);
				t.add('24','2_5','PMAC600B-6', w, h, c, c, target, meta);
				t.add('25','2_5','PMAC600B-7', w, h, c, c, target, meta);
				t.add('26','2_5','PMAC600B-8', w, h, c, c, target, show);

				t.add('2_6','2','SN2_6', 100, 1,c, c, target, meta, 1);
				t.add('28','2_6','PMAC600B-1', w, h, c, c, target, show);
				t.add('29','2_6','PMAC600B-2', w, h, c, c, target, meta);
				t.add('30','2_6','PMAC600B-3', w, h, c, c, target, meta);
				t.add('31','2_6','PMAC600B-4', w, h, c, c, target, meta);
				t.add('32','2_6','PMAC600B-5', w, h, c, c, target, meta);
				t.add('33','2_6','PMAC600B-6', w, h, c, c, target, meta);
				t.add('34','2_6','PMAC600B-7', w, h, c, c, target, meta);
				t.add('35','2_6','PMAC600B-8', w, h, c, c, target, show);
				t.UpdateTree();
				t.initClick(function (id) {
					console.log("initClick click:"+id);
					t.collapseNode(id, true);
				});
				t.collapseNode('2_3');
				t.collapseNode('2_4');
				t.collapseNode('2_5');
				t.collapseNode('2_6');
				t.UpdateTree();
			}									
		</script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>

	function getOnline () {
		$.get('/eosserver/rest/getonline', function(result){
    		onlineMap.clear();
    		console.log("result="+result);	
        	var arr = eval(result);
        	for (var i = 0; i < arr.length; i++){
        		console.log("key="+arr[i].deviceUrl+", item="+arr[i].deviceStatus);
    			onlineMap[arr[i].deviceUrl] = arr[i].deviceStatus;
        	}
    		loadImages(sources, CreateTree);
		});
	}
	
    $(document).ready(function() {
    	$('#container').dragScroll({});
    	//CreateCmChartTree();
    	getOnline();
    	$('body').timer({callback: function() {
			getOnline();
		},
		repeat: true,
		//delay: 6000
		delay: 30000
    	});
    	
    	loadImages(sources, CreateTree);
    	//CreateTree();
        $('#dataTables-example').DataTable({
                responsive: true
        });
        document.getElementById("def_page").value="通讯结构";
        $("#his_page").value="历史数据";
        $("#his_page").click(function(){
     	   window.location.href="/eospd_h5/cm_his";
        });
        <!--
        $('.input-daterange input').each(
				function() {
					var d = new Date()
					$(this).val(
							d.getFullYear() + "年"
									+ (d.getMonth() + 1) + "月"
									+ (d.getDate()) + "日");
					$(this).datepicker({
						language : 'zh-CN',
						autoclose : true,
						todayHighlight : true,
						todayBtn : "linked",
					}).on('changeDate', function(value) {
						//getMeterData(value.date, 0)
					});
				});
        -->
    });
    
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
		root : 'imgs/root.png',
		meta: 'imgs/meta.png',
		offline: 'imgs/offline.png',
		wifi: 'imgs/wifi.png',
		plug: 'imgs/plus.gif',
		less: 'imgs/less.gif',
		tran: 'imgs/trans.gif'
	};
    </script>

</body>

</html>