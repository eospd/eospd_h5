<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<jsp:include page="header.jsp"></jsp:include>

<body>
	<div class="row">
		<!--  <div class="col-md-1 left-right-empty"></div>-->
		<div class="col-md-10 left-right-empty">
			<div id="wrapper">

				<jsp:include page="left_sidebar.jsp"></jsp:include>
				<div id="page-wrapper">
				<div class="div scrollbar" style="padding-top:0px; height:480px; overflow: auto">
					<img src="imgs/data_manage.png"/>
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
				col_his();	
				$("#his_page").toggleClass('active');
				//$("#index").toggleClass('active');
				$("#def_page").click(function() {
					window.location.href="/eospd_h5/efd_chart";
				});
			});
		</script>
</body>

</html>