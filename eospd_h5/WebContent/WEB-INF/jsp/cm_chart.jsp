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
								<!-- /.panel-heading -->
								<div class="panel-body">
									<div class="panel-body">
										<div style="overflow: auto" id="topo_canvas" class="col-lg-12">
										</div>
									</div>
								</div>
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-12 -->
				</div>

			</div>
			<!-- /#page-wrapper -->


		</div>
		<div class="col-md-1 left-right-empty"></div>
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

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
		var CreateTree = function() {
			myTree = new ECOTree('myTree', 'topo_canvas');
			//myTree.config.linkType = 'B';
			//myTree.config.iRootOrientation = ECOTree.RO_LEFT;						
			//myTree.config.topYAdjustment = -180;
			//myTree.config.linkColor = "black";
			myTree.config.nodeColor = "#FFAAAA";
			//myTree.config.nodeBorderColor = "black";
			myTree.config.useTarget = false;
			myTree.config.iLevelSeparation = 60;
			myTree.config.iSiblingSeparation = 30;
			//myTree.config.selectMode = ECOTree.SL_SINGLE;			
			//(id, pid, dsc, w, h, c, bc, target, meta)		
			myTree.add(0, -1, "Apex Node", 100, 40, "rgb(40,159,86)", "rgb(40,159,86)",
					"head", "能源采集系统");//, 150, 150, "#CCCCFF", "#CCCCFF", "hello", "URL:/pd/meter/e/1\n有效率:%30\n在线率:%40\n采集率:70%");
			var w = 80;
			var h = 60;
			myTree.add(101, 0, "Apex Node", w, h, "rgb(24,157,139)","rgb(24,157,139)",
					"hello", "/pd/dc/1\n192.168.1.10\n在线");
			myTree.add(102, 0, "Apex Node", w, h, "rgb(24,157,139)", "rgb(24,157,139)",
					"hello", "/pd/dc/2\n192.168.1.11\n在线");

			myTree.add(1011, 101, "Apex Node", 0, 0, "rgb(69,139,242)", "rgb(69,139,242)",
					"hello", "总线地址:1");

			myTree.add(1021, 102, "Apex Node", 0, 0, "rgb(69,139,242)", "rgb(69,139,242)",
					"hello", "总线地址:1");
			myTree.add(1022, 102, "Apex Node", 0, 0, "rgb(69,139,242)", "rgb(69,139,242)",
					"hello", "总线地址:2");

			myTree.add(1, 1011, "Apex Node", w, h, "rgb(34,92,171)", "rgb(34,92,171)",
					"hello", "/pd/meter/e/1\n通讯地址:1\n在线");
			myTree.add(2, 1011, "Apex Node", w, h, "rgb(34,92,171)", "rgb(34,92,171)",
					"hello", "/pd/meter/e/2\n通讯地址:2\n在线");

			myTree.add(3, 1021, "Apex Node", w, h, "rgb(244,92,72)", "rgb(244,92,72)",
					"hello", "/pd/meter/e/3\n通讯地址:3\n离线");
			myTree.add(4, 1021, "Apex Node", w, h, "rgb(34,92,171)", "rgb(34,92,171)",
					"hello", "/pd/meter/e/4\n通讯地址:4\n在线");
			myTree.add(6, 1022, "Apex Node", w, h, "rgb(244,92,72)", "rgb(244,92,72)",
					"hello", "/pd/meter/e/6\n通讯地址:6\n离线");
			myTree.UpdateTree();
		}
	</script>
	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>

    $(document).ready(function() {
		CreateTree();
        $('#dataTables-example').DataTable({
                responsive: true
        });
        document.getElementById("def_page").value="通讯结构";
        $("#his_page").value="历史数据";
        $("#his_page").click(function(){
     	   window.location.href="/eospd_h5/cm_his";
        });
    });
    </script>

</body>

</html>