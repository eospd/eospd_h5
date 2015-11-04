<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0">
<div class="navbar-header">
	<button type="button" class="navbar-toggle" data-toggle="collapse"
		data-target=".navbar-collapse">
		<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
		<span class="icon-bar"></span> <span class="icon-bar"></span>
	</button>
	<a class="navbar-brand" href="/eospd_h5">能源管理系统</a>
</div>
<!-- /.navbar-header -->
<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse">
		<ul class="nav" id="side-menu">

			<li><a href="/eospd_h5"><i class="fa fa-dashboard fa-fw"></i> 数据采集</a></li>
			<li><a href="/eospd_h5/dm"><i
					class="fa fa-bar-chart-o fa-fw"></i> 数据管理</a></li>
					
			<li><a href="#"><i
					class="fa fa-table fa-fw"></i> 通讯管理<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level collapse" aria-expanded="true">
					<li><a href="/eospd_h5/cm_chart">通讯结构</a></li>
					<li><a href="/eospd_h5/cm_his">历史数据</a></li>
				</ul> <!-- /.nav-second-level --></li>
			
			<li><a href="#"><i
					class="fa fa-edit fa-fw"></i> 能流图 <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level collapse" aria-expanded="true">
					<li><a href="/eospd_h5/efd_chart">电支路结构</a></li>
					<li><a href="/eospd_h5/efd_his">电支路信息</a></li>
				</ul> <!-- /.nav-second-level --></li>
				
			<li><a href="/eospd_h5/mm"><i class="fa fa-wrench fa-fw"></i> 表具管理</a></li>
			<li><a href="/eospd_h5/sc"><i class="fa fa-files-o fa-fw"></i> 系统配置</a></li>
		</ul>
	</div>
	<!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side --> </nav>
