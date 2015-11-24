<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<jsp:include page="header.jsp"></jsp:include>

<body>
		<!--  <div class="col-md-1 left-right-empty"></div>-->
		<div class="col-md-10 left-right-empty">
			<div id="wrapper">

				<jsp:include page="left_sidebar.jsp"></jsp:include>

				<div id="page-wrapper">
				
				<div class="panel-body div" style="height:480px">
				<div class="row" style="height:50px;padding-top: 10px">
					<div class="col-lg-6">
					<div class="col-lg-9">
									<div class="input-group input-daterange">
										<span class="input-group-addon" style="color:darkgray">开始时间</span> <input style="color:darkgrey; margin-left: 5px"
											type="text" class="form-control" value="">
									</div>
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


					<div class="scrollbar" id="container" style="padding-top:0px; height:400px; overflow: auto; overflow-x: hidden">
					<img src="imgs/cm_chart.png"/>
						
							<!-- 
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

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>

    $(document).ready(function() {
    	$('#container').dragScroll({});
    	//CreateCmChartTree();
        $('#dataTables-example').DataTable({
                responsive: true
        });
        document.getElementById("def_page").value="通讯结构";
        $("#his_page").value="历史数据";
        $("#his_page").click(function(){
     	   window.location.href="/eospd_h5/cm_his";
        });
        
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
    });
    </script>

</body>

</html>