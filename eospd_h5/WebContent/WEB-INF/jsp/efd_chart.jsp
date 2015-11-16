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
										<div class="dropdown pull-right ">
										<button id="select_info" type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">总电量<span class="caret"></span></button>
										<ul class="dropdown-menu pull-right" role="menu">
										<li onclick="get_all_efd_info('总电量')"><a href ="#">总电量</a></li>
										<li onclick="get_all_efd_info('总功率')"><a href ="#">总功率</a></li>
										<li onclick="get_all_efd_info('功率因素')"><a href ="#">功率因素</a></li>
										<li onclick="get_all_efd_info('电流')"><a href ="#">电流</a></li>
										<li onclick="get_all_efd_info('电压')"><a href ="#">电压</a></li>
										</ul>
										</div>
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
	<script type="text/javascript" src="js/ECOTree.js"></script>
	<script src="js/eospd.js"></script>

	<script>
    $(document).ready(function() {
    	CreateEfdChartTree();
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