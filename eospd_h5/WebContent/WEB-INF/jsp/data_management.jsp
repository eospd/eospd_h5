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
						<div class="panel-heading">数据明细</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dm_table">
									<thead>
										<tr>
											<th>时间</th>
											<th>能源ID</th>
											<th>仪表名称	</th>
											<th>采集器ID</th>
											<th>采集器URL</th>
											<th>采集器地址</th>
											<th>采集器IP</th>
											<th>厂商</th>
											<th>p1Pv</th>
											<th>p1Err</th>
										</tr>
									</thead>
								</table>
							</div>
							<!-- /.table-responsive -->
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


	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
    $(document).ready(function() {
    	
    	/*
    												<th>时间</th>
											<th>能源ID</th>
											<th>仪表名称	</th>
											<th>采集器ID</th>
											<th>采集器URL</th>
											<th>采集器地址</th>
											<th>采集器IP</th>
											<th>厂商</th>
											<th>p1Pv</th>
											<th>p1Err</th>
											*/
    	$('#dm_table').DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax": {
                "url": "/eospd_h5/dm/list",
                "type": "POST"
            },
            "columns": [
                { "data": "currentTime" },
                { "data": "dataId" },
                { "data": "meterName" },
                { "data": "dcId" },
                { "data": "dcUrl" },
                { "data": "dcLocation" },
                { "data": "dcIP" },
                { "data": "venderName" },
                { "data": "p1Pv" },
                { "data": "p1Err" }
            ]
        } );


        $('').DataTable({
                responsive: true
        });
    });
    </script>

</body>

</html>