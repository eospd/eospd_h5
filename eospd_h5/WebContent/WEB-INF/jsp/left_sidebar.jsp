<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Navigation -->
<nav class="navbar navbar-default" role="navigation">
<div class="container-fluid" style="margin-top: 10px">
	<div class="navbar-header" style="margin-left: 10px;">
		<button class="color green button">电力</button>
		<button class="color black button">燃气</button>
		<button class="color black button">燃油</button>
		<button class="color black button">水</button>
	</div>
	<div class="nav navbar-nav navbar-right">
		<button id="btn_refresh" class="color black button">刷新</button>
		<button class="color black button" style="margin-right: 30px;">复位</button>
		<button id="def_page" class="color blue button">仪表</button>
		<button id="his_page" class="color black button">列表</button>
	</div>
</div>
</nav>


<!-- /.navbar-header -->
<div class="navbar-default sidebar" role="navigation">
	<div style="margin: 0 auto;height: 50px; width:180px; background-color: rgb(30,30,30)">
	<label  style="float:left; line-height:50px; margin-left:10px; color:white;font-size:16px;">数据采集</label>
	</div>
	<div class="sidebar-nav navbar-collapse">
		<ul class="nav" id="side-menu">

			<li><a href="/eospd_h5/index" id="index"><i class="fa fa-dashboard fa-fw"></i>
					数据质量</a></li>
					<!-- 
			<li><a href="/eospd_h5/col_his"><i
					class="fa fa-dashboard fa-fw"></i> 历史数据</a></li>
 -->
 			<li><a href="/eospd_h5/col_his" id="col_his"><i
					class="fa fa-bar-chart-o fa-fw"></i> 数据查询</a></li>
			<li><a href="/eospd_h5/dm" id="dm"><i
					class="fa fa-table fa-fw"></i> 数据管理</a></li>

			<li><a href="/eospd_h5/cm_chart" id="cm"><i
					class="fa fa-edit  fa-fw"></i>通讯管理</a></li>
			<!--  
			<li><a href="/eospd_h5/cm_his"><i class="fa fa-table fa-fw"></i>
					历史数据</a></li>
-->
			<li><a href="/eospd_h5/efd_chart" id="efd"><i
					class="fa fa-edit fa-fw"></i> 能流管理</a></li>
					<!--  
			<li><a href="/eospd_h5/efd_his"><i class="fa fa-edit fa-fw"></i>
					电支路信息 </a></li>
					-->
			<li><a href="/eospd_h5/efd_his" id="mm"><i class="fa fa-wrench fa-fw"></i>
					逻辑管理</a></li>
			<li><a href="/eospd_h5/mm" id="mm"><i class="fa fa-wrench fa-fw"></i>
					表具管理</a></li>
			<li><a href="/eospd_h5/sc" id="sc"><i class="fa fa-files-o fa-fw"></i>
					系统配置</a></li>
		</ul>
	</div>
	<!-- /.sidebar-collapse -->
</div>
</nav>

<!-- /.navbar-header -->
<div class="navbar-right sidebar-right" role="navigation">
<div style="margin: 0 auto;height: 50px; width:180px; background-color: rgb(30,30,30);">
	<label  style="float:left; line-height:50px; margin-left:10px; color:white;font-size:16px;">机场建筑</label>
	</div>
	<div class="sidebar-nav navbar-default">
		<ul class="nav" id="side-menu">
			<li><p class="text-justify" style="height:0px; padding-top:10px; margin-left:10px;font-size: 16px ">机场建筑</p></li>
			<li><p class="text-justify">机场</a></li>
			<li>
				<ul class="nav nav-second-level ">
					<li><a href="#">T1</a>
						<ul class="nav nav-second-level ">
							<li><a href="#">T1航站楼</a></li>
							<li><a href="#">T1能源楼</a></li>
							<li><a href="#">T1停车场</a></li>
						</ul></li>
						<li><a href="#">T2</a>
						<ul class="nav nav-second-level ">
							<li><a href="#">T2航站楼</a></li>
							<li><a href="#">T2能源楼</a></li>
							<li><a href="#">T2停车场</a></li>
						</ul></li>
				</ul></li>
		</ul>
	</div>
	<!-- /.sidebar-collapse -->
</div>