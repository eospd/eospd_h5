<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<jsp:include page="header.jsp"></jsp:include>


<style>
        .topRoundRect{
            text-align: center;
            font-size: 12px;
            width: 160px;
            color: white;
            padding:4px;
            -webkit-border-radius: 15px 15px 0px 0px;
            -moz-border-radius: 15px 15px 0px 0px;
            background-color: grey;
        }
        
        .bottomRoundRect{
            text-align: center;
            font-size: 8px;
            width: 160px;
            height:100px;
            color: white;
            -webkit-border-radius: 0px 0px 15px 15px;
            -moz-border-radius: 0px 0px 15px 15px;
            background-color: rgb(51,55,65);
        }
</style>

<body>
	<div class="row">
		<!--  <div class="col-md-1 left-right-empty"></div>
		<div class="col-md-10 left-right-empty">
			<div id="wrapper">-->
		<div id="wrapper">
		<div id="content-div">

				<jsp:include page="left_sidebar.jsp"></jsp:include>
				<div id="page-wrapper">
				<div class="div scrollbar" style="padding-top:15px; height:480px; overflow: auto">
				
				<div class="row" style="padding-top:15px; margin:auto; width:80%;">
				<div class="col-lg-3">
					<div class="topRoundRect">能耗数据采集间隔</div>
					<div class="bottomRoundRect">
					<table style="margin:auto; height:100%; width:80%">
						<tr>
						<td><input type="radio" style="width:20px;height:20px"/><br/>1s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>10s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>30s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>60s</td>
						</tr>
					<tr>
					<td><input type="radio" style="width:20px;height:20px"/><br/>5m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>10m</td>
					<td><input type="radio" checked="checked" style="width:20px;height:20px"/><br/>15m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>30m</td>
					</tr>
				</table>
				</div>
				</div>
				
				<div class="col-lg-3">
				<div class="topRoundRect">能耗数据存储间隔</div>
				<div class="bottomRoundRect">
					<table style="margin:auto; height:100%; width:80%">
						<tr>
						<td><input type="radio" checked="checked" style="width:20px;height:20px"/><br/>1s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>10s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>30s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>60s</td>
						</tr>
					<tr>
					<td><input type="radio" style="width:20px;height:20px"/><br/>5m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>10m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>15m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>30m</td>
					</tr>
				</table>
				</div>
				</div>
			
				
				<div class="col-lg-3">
				<div class="topRoundRect">能耗数据上传间隔</div>
				<div class="bottomRoundRect">
					<table style="margin:auto; height:100%; width:80%">
						<tr>
						<td><input type="radio" style="width:20px;height:20px"/><br/>1s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>10s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>30s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>60s</td>
						</tr>
					<tr>
					<td><input type="radio" style="width:20px;height:20px"/><br/>5m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>10m</td>
					<td><input type="radio" checked="checked" style="width:20px;height:20px"/><br/>15m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>30m</td>
					</tr>
				</table>
				</div>
				</div>
				<div class="col-lg-3">
				<div class="topRoundRect">能耗数据上传精度</div>
				<div class="bottomRoundRect">
					<table style="margin:auto; height:100%; width:80%">
						
					<tr>
						<td><input type="radio" style="width:20px;height:20px"/><br/>1.</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>1.0</td>
						<td><input type="radio" checked="checked" style="width:20px;height:20px"/><br/>1.00</td>
						</tr>
				</table>
				</div>
				</div>
    			</div>
    			

				<!-- row 2 start -->
				<div class="row" style="padding-top:15px;margin:auto; width:80%;">
				<div class="col-lg-3">
					<div class="topRoundRect">能量数据采集间隔</div>
					<div class="bottomRoundRect">
					<table style="margin:auto; height:100%; width:80%">
						<tr>
						<td><input type="radio" style="width:20px;height:20px"/><br/>1s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>10s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>30s</td>
						<td><input type="radio" checked="checked" style="width:20px;height:20px"/><br/>60s</td>
						</tr>
					<tr>
					<td><input type="radio"  style="width:20px;height:20px"/><br/>5m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>10m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>15m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>30m</td>
					</tr>
				</table>
				</div>
				</div>
				
				<div class="col-lg-3">
				<div class="topRoundRect">能量数据存储间隔</div>
				<div class="bottomRoundRect">
					<table style="margin:auto; height:100%; width:80%">
						<tr>
						<td><input type="radio" style="width:20px;height:20px"/><br/>1s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>10s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>30s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>60s</td>
						</tr>
					<tr>
					<td><input type="radio" style="width:20px;height:20px"/><br/>5m</td>
					<td><input type="radio" checked="checked" style="width:20px;height:20px"/><br/>10m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>15m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>30m</td>
					</tr>
				</table>
				</div>
				</div>
			
				
				<div class="col-lg-3">
				<div class="topRoundRect">能量数据上传间隔</div>
				<div class="bottomRoundRect">
					<table style="margin:auto; height:100%; width:80%">
						<tr>
						<td><input type="radio" style="width:20px;height:20px"/><br/>1s</td>
						<td><input type="radio" checked="checked" style="width:20px;height:20px"/><br/>10s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>30s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>60s</td>
						</tr>
					<tr>
					<td><input type="radio" style="width:20px;height:20px"/><br/>5m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>10m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>15m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>30m</td>
					</tr>
				</table>
				</div>
				</div>
				<div class="col-lg-3">
				<div class="topRoundRect">能量数据上传精度</div>
				<div class="bottomRoundRect">
					<table style="margin:auto; height:100%; width:80%">
						
					<tr>
						<td><input type="radio" style="width:20px;height:20px"/><br/>1.</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>1.0</td>
						<td><input type="radio" checked="checked" style="width:20px;height:20px"/><br/>1.00</td>
						</tr>
				</table>
				</div>
				</div>
				
				
    			</div>
    			
    			<!-- row 2 end -->
    			
    			<!-- row 3 start -->
    			<div class="row" style="padding-top:15px;margin:auto; width:80%;">
				<div class="col-lg-3">
					<div class="topRoundRect">环境数据采集间隔</div>
					<div class="bottomRoundRect">
					<table style="margin:auto; height:100%; width:80%">
						<tr>
						<td><input type="radio" style="width:20px;height:20px"/><br/>1s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>10s</td>
						<td><input type="radio" checked="checked" style="width:20px;height:20px"/><br/>30s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>60s</td>
						</tr>
					<tr>
					<td><input type="radio" style="width:20px;height:20px"/><br/>5m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>10m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>15m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>30m</td>
					</tr>
				</table>
				</div>
				</div>
				
				<div class="col-lg-3">
				<div class="topRoundRect">环境数据存储间隔</div>
				<div class="bottomRoundRect">
					<table style="margin:auto; height:100%; width:80%">
						<tr>
						<td><input type="radio" checked="checked" style="width:20px;height:20px"/><br/>1s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>10s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>30s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>60s</td>
						</tr>
					<tr>
					<td><input type="radio" style="width:20px;height:20px"/><br/>5m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>10m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>15m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>30m</td>
					</tr>
				</table>
				</div>
				</div>
			
				
				<div class="col-lg-3">
				<div class="topRoundRect">环境数据上传间隔</div>
				<div class="bottomRoundRect">
					<table style="margin:auto; height:100%; width:80%">
						<tr>
						<td><input type="radio" style="width:20px;height:20px"/><br/>1s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>10s</td>
						<td><input type="radio" checked="checked" style="width:20px;height:20px"/><br/>30s</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>60s</td>
						</tr>
					<tr>
					<td><input type="radio" style="width:20px;height:20px"/><br/>5m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>10m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>15m</td>
					<td><input type="radio" style="width:20px;height:20px"/><br/>30m</td>
					</tr>
				</table>
				</div>
				</div>
				<div class="col-lg-3">
				<div class="topRoundRect">能耗数据上传精度</div>
				<div class="bottomRoundRect">
					<table style="margin:auto; height:100%; width:80%">
						<tr>
						<td><input type="radio" style="width:20px;height:20px"/><br/>1.</td>
						<td><input type="radio" style="width:20px;height:20px"/><br/>1.0</td>
						<td><input type="radio" checked="checked" style="width:20px;height:20px"/><br/>1.00</td>
						</tr>
				</table>
				</div>
				</div>
				
				
    			</div>
    			<!-- row 3 end -->
				
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