<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>浦东机场能源管理系统</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="css/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="css/dataTables.bootstrap.css" rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="css/dataTables.responsive.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link href="css/carousel.css" rel="stylesheet">
    <link href="css/echartsHome.css" rel="stylesheet">
    <script src="js/codemirror.js"></script>
    <script src="js/javascript.js"></script>

    <link href="css/codemirror.css" rel="stylesheet">
    <link href="css/monokai.css" rel="stylesheet">

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="">能源管理系统</a>
		</div>
		<!-- /.navbar-header -->
		
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="Search...">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div> <!-- /input-group -->
					</li>
					<li><a href=""><i class="fa fa-dashboard fa-fw"></i> 数据采集</a>
					</li>
					<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
							数据管理<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="flot.html">Flot Charts</a></li>
							<li><a href="morris.html">Morris.js Charts</a></li>
						</ul> <!-- /.nav-second-level --></li>
					<li><a href=""><i class="fa fa-table fa-fw"></i>
							通讯管理</a></li>
					<li><a href=""><i class="fa fa-edit fa-fw"></i>
							能流图</a></li>
					<li><a href="#"><i class="fa fa-wrench fa-fw"></i> 表具管理<span
							class="fa arrow"></span></a></li>

					<li><a href="#"><i class="fa fa-files-o fa-fw"></i> 系统配置<span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="blank.html">Blank Page</a></li>
							<li><a href="login.html">Login Page</a></li>
						</ul> <!-- /.nav-second-level --></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">数据指标</h3>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			
			
        <div class="row">
		  <div class="col-md-3">

		  	<div class="row">
				<h4>系统指标</h4>
				<!-- /.col-lg-12 -->
			</div>

		  	<div class="row-fluid example">
            <div id="graphic" class="col-lg-12">
                <div id="data_efficiency" class="data_efficiency"></div>
            </div><!--/span-->
        	</div><!--/row-->
        	<div class="row-fluid example">
            <div id="graphic" class="col-lg-12">
                <div id="meter_online_r" class="meter_online_r"></div>
            </div><!--/span-->
        	</div><!--/row-->

        	<div class="row-fluid example">
            <div id="graphic" class="col-lg-12">
                <div id="real_time_cr" class="real_time_cr"></div>
            </div><!--/span-->
        	</div><!--/row-->
		  </div>
		  <div class="col-md-7">

		  	<div class="row">
				<h4>仪表指标</h4>
				<!-- /.col-lg-12 -->
			</div>
		  	
				<div class="row-fluid example">
				    <div id="graphic" class="col-lg-12">
						<div id="meters_cr" class="meters_cr"></div>
					</div><!--/span-->
				</div><!--/row-->
		  </div>
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

		var objBar1 = [], objBar2 = [], objBar3 = [];
		objBar1.myChartBackgroundColor = "#000000";
		objBar1.myChartType = "gauge";
		objBar1.myChartLegendData = new Array('有功功率');
		objBar1.myChartYAxisFormatter = "kw";
		objBar1.myChartDataColor = [ '#ff9000' ];
		objBar1.myChartDyType = "0";

		objBar1.myContainerId = "data_efficiency";
		objBar1.myName = "数据有效率";
		objBar1.myValue = 50;

	   	getMyEcharts(objBar1);

		objBar2.myChartType = "gauge";
		objBar2.myContainerId = "meter_online_r";
		objBar2.myName = "仪表在线率";
		objBar2.myValue = 60;

	   	getMyEcharts(objBar2);

		objBar3.myChartType = "gauge";
	   	objBar3.myContainerId = "real_time_cr";
		objBar3.myName = "实时采集率";
		objBar3.myValue = 80;
	   	getMyEcharts(objBar3);


	   	var objBarMeters = [];

		objBarMeters.myChartType = "mul_bar";
	   	objBarMeters.myContainerId = "meters_cr";
		objBarMeters.myName = "实时采集率";
		objBarMeters.myValue = 80;
	   	getMyEcharts(objBarMeters);


        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>

</body>

</html>