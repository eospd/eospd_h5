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
                   		电支路结构
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="panel-body">
                    <div id = "topo_canvas" class="col-lg-12">
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
	<script type="text/javascript" >
			var CreateTree = function() {
				myTree = new ECOTree('myTree','topo_canvas');		
				//	myTree.config.linkType = 'B';
				//myTree.config.iRootOrientation = ECOTree.RO_TOP;						
				//myTree.config.topYAdjustment = -180;
				myTree.config.linkColor = "black";
				myTree.config.nodeColor = "#FFAAAA";
				myTree.config.nodeBorderColor = "black";
				myTree.config.useTarget = false;
				myTree.config.iLevelSeparation = 80;
				//myTree.config.selectMode = ECOTree.SL_SINGLE;			
				//(id, pid, dsc, w, h, c, bc, target, meta)		
				myTree.add(0,-1,"Apex Node", 100, 50, "#CCCCFF", "#CCCCFF", "head", "能源采集系统");//, 150, 150, "#CCCCFF", "#CCCCFF", "hello", "URL:/pd/meter/e/1\n有效率:%30\n在线率:%40\n采集率:70%");
				var w = 70;
				var h = 80;
				myTree.add(1,0,"Apex Node", w, h, "#CCCCFF", "#CCCCFF", "hello", "URL:/pd/meter/e/1\n有效率:30%\n在线率:%40\n采集率:70%");
				myTree.add(2,0,"Apex Node", w, h, "#CCCCFF", "#CCCCFF", "hello", "URL:/pd/meter/e/2\n有效率:30%\n在线率:%40\n采集率:70%");
				myTree.add(3,1,"Apex Node", w, h, "#CCCCFF", "#CCCCFF", "hello", "URL:/pd/meter/e/3\n有效率:30%\n在线率:%40\n采集率:70%");
				myTree.add(4,1,"Apex Node", w, h, "#CCCCFF", "#CCCCFF", "hello", "URL:/pd/meter/e/4\n有效率:30%\n在线率:%40\n采集率:70%");
				myTree.add(5,2,"Apex Node", w, h, "#CCCCFF", "#CCCCFF", "hello", "URL:/pd/meter/e/5\n有效率:30%\n在线率:%40\n采集率:70%");
				myTree.add(6,5,"Apex Node", w, h, "#CCCCFF", "#CCCCFF", "hello", "URL:/pd/meter/e/6\n有效率:30%\n在线率:%40\n采集率:70%");
				myTree.add(7,5,"Apex Node", w, h, "#CCCCFF", "#CCCCFF", "hello", "URL:/pd/meter/e/7\n有效率:30%\n在线率:%40\n采集率:70%");
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
    });
    </script>

</body>

</html>