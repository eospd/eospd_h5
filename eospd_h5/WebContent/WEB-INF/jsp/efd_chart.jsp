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
								<!-- /.panel-heading -->
									<div class="panel-body">
										<div style="overflow: auto" id="topo_canvas" class="col-lg-12">
										</div>
									</div>
							<!-- /.col-lg-12 -->
						</div>

					</div>
					<!-- /#page-wrapper -->
				</div>
			</div>
			<!-- /#wrapper -->
		</div>
		<div class="col-md-1 left-right-empty"></div>
	</div>
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
				myTree = new ECOTree('myTree','topo_canvas');		
				//myTree.config.linkType = 'B';
				//myTree.config.iRootOrientation = ECOTree.RO_TOP;						
				//myTree.config.topYAdjustment = -180;
				//myTree.config.linkColor = "black";
				//myTree.config.nodeColor = "#FFAAAA";
				//myTree.config.nodeBorderColor = "black";
				//myTree.config.useTarget = false;
				myTree.config.iLevelSeparation = 80;
				//myTree.config.iSiblingSeparation = 150;
				//myTree.config.selectMode = ECOTree.SL_SINGLE;			
				//(id, pid, dsc, w, h, c, bc, target, meta)		
				myTree.add(0,-1,"Apex Node", 150, 50, "rgb(40,159,86)", "rgb(40,159,86)", "head", "浦东T2能源站总进线\n500A");//, 150, 150, "#CCCCFF", "#CCCCFF", "hello", "URL:/pd/meter/e/1\n有效率:%30\n在线率:%40\n采集率:70%");
				var w = 100;
				var h = 50;
				myTree.add(1,0,"Apex Node", w, h, "rgb(40,159,86)", "rgb(40,159,86)", "hello", "/pd/t2/eng_station/cooler/1\n1号冷机支路\n额定电率:500A");
				myTree.add(3,1,"Apex Node", w, h, "rgb(40,159,86)", "rgb(40,159,86)", "hello", "/pd/t2/eng_station/chwp/1\n1号冷却泵支路\n额定电率:500A");
				myTree.add(4,1,"Apex Node", w, h, "rgb(40,159,86)", "rgb(40,159,86)", "hello", "/pd/t2/eng_station/cooler/1\n2号冷机支路\n额定电率:500A");
				myTree.add(5,0,"Apex Node", w, h, "rgb(40,159,86)", "rgb(40,159,86)", "hello", "/pd/t2/eng_station/cooler/1\n2号冷机支路\n额定电率:500A");
				myTree.add(6,5,"Apex Node", w, h, "rgb(40,159,86)", "rgb(40,159,86)", "hello", "/pd/t2/eng_station/chwp/2\n2号冷却泵支路\n额定电率:500A");
				myTree.add(7,5,"Apex Node", w, h, "rgb(40,159,86)", "rgb(40,159,86)", "hello", "/pd/t2/eng_station/chwp/1\n1号冷却泵支路\n额定电率:500A");
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
        $("#his_page").click(function(){
     	   window.location.href="/eospd_h5/efd_his";
        });
    });
    </script>

</body>

</html>