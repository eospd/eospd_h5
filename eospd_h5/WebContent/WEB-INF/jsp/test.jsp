<!DOCTYPE html>
<html lang="utf-8">
<head>
<meta charset="utf-8">
<title>日期选择</title>
<!-- css -->
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">


<!-- DataTables CSS -->
<link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="css/buttons.bootstrap.min.css" rel="stylesheet">
<link href="css/select.bootstrap.min.css" rel="stylesheet">
<link href="css/editor.bootstrap.min.css" rel="stylesheet">

</head>
<body>


			<table class="table table-striped table-bordered table-hover"
				id="dm_table">
				<thead>
					<tr>
						<th>采集器URl</th>
						<th>采集器名称</th>
						<th>位置</th>
						<th>描述</th>
						<th>通道数量</th>
						<th>IP</th>
						<th>安装时间</th>
					</tr>
				</thead>
			</table>
	<!--<a href="https://www.baidu.com/s?wd=js&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YdrjF9uHubnHRzuHDYnyDv0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6K1TL0qnfK1TL0z5HD0IgF_5y9YIZ0lQzqlpA-bmyt8mh7GuZR8mvqVQL7dugPYpyq8Q1Dvn16vPWRzPHfLPHTdPH0Lrj0" target="_blank" class="baidu-highlight">js</a>-->

	<script src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<!-- DataTables JavaScript -->
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>
	<script src="js/dataTables.buttons.min.js"></script>
	<script src="js/buttons.bootstrap.min.js"></script>
	<script src="js/dataTables.select.min.js"></script>
	<script src="js/dataTables.editor.min.js"></script>
	<script src="js/editor.bootstrap.min.js"></script>
	<script src="js/eospd.js"></script>

	<script type="text/javascript">
		$(document).ready(
				
				function() {
					var table;

					//document.getElementById("home").innerHTML ="";
					//$('#home').html('<div class="dataTable_wrapper"><table class="table table-striped table-bordered table-hover" id="dm_table"><thead><tr><th>采集器URl</th><th>采集器名称</th><th>位置</th><th>描述</th><th>通道数量</th><th>IP</th><th>安装时间</th></tr></thead></table></div>');

					var editor = new $.fn.dataTable.Editor({
						ajax : "/eospd_h5/mm/dc/staff",
						table : "#dm_table",
						i18n : table_editor_chinese,
						idSrc : 'id',
						fields : [ {
							label : "采集器URL:",
							name : "dcUrl"
						}, {
							label : "采集器名称:",
							name : "dcName"
						}, {
							label : "位置:",
							name : "location"
						}, {
							label : "描述:",
							name : "desc"
						}, {
							label : "通道数量:",
							name : "channelCount"
						}, {
							label : "IP:",
							name : "dcIP"
						}, {
							label : "安装时间:",
							name : "installTime",
							type : 'datetime'
						} ]
					});

					table = $('#dm_table').DataTable({
						"language" : chinese_langue,
						"processing" : true,
						"serverSide" : true,
						"ajax" : {
							"url" : "/eospd_h5/mm/dc/list",
							"type" : "POST"
						},
						lengthChange : false,
						select : true,
						"columns" : [ {
							"data" : "dcUrl"
						}, {
							"data" : "dcName"
						}, {
							"data" : "location"
						}, {
							"data" : "desc"
						}, {
							"data" : "channelCount"
						}, {
							"data" : "dcIP"
						}, {
							"data" : "installTime"
						} ]
					});

					// Display the buttons
					new $.fn.dataTable.Buttons(table, [ {
						extend : "create",
						editor : editor
					}, {
						extend : "edit",
						editor : editor
					}, {
						extend : "remove",
						editor : editor
					} ]);

					table.buttons().container().appendTo(
							$('.col-sm-6:eq(0)', table.table().container()));
				});
	</script>
</body>
</html>