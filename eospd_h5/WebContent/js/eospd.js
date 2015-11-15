function mm_his() {
	gen_dc_div();

	$('.input-daterange input').each(
			function() {
				var d = new Date()
				$(this).val(
						d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
								+ (d.getDate()) + "日");
				$(this).datepicker({
					language : 'zh-CN',
					autoclose : true,
					todayHighlight : true,
					todayBtn : "linked"
				});
			});
}

function col_his() {
	gen_all_meter();
	$('#dm_table').DataTable({
		"language" : chinese_langue,
		"processing" : true,
		"serverSide" : true,
		"ajax" : {
			"url" : "/eospd_h5/cid/list",
			"type" : "POST"
		},
		"columns" : [ {
			"data" : "currentTime"
		}, {
			"data" : "meterUrl"
		}, {
			"data" : "dataEffRate"
		}, {
			"data" : "meterOnlineRate"
		}, {
			"data" : "realCollectRate"
		} ]
	});

	$('.input-daterange input').each(
			function() {
				var d = new Date()
				$(this).val(
						d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
								+ (d.getDate()) + "日");
				$(this).datepicker({
					language : 'zh-CN',
					autoclose : true,
					todayHighlight : true,
					todayBtn : "linked"
				});
			});
}
function cm_his() {
	gen_all_meter();

	$('#dm_table').DataTable({
		"language" : chinese_langue,
		"processing" : true,
		"serverSide" : true,
		"ajax" : {
			"url" : "/eospd_h5/cm/list",
			"type" : "POST"
		},
		"columns" : [ {
			"data" : "currentTime"
		}, {
			"data" : "deviceType"
		}, {
			"data" : "deviceUrl"
		}, {
			"data" : "deviceStatus"
		}, {
			"data" : "bpSign"
		} ]
	});

	$('.input-daterange input').each(
			function() {
				var d = new Date()
				$(this).val(
						d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
								+ (d.getDate()) + "日");
				$(this).datepicker({
					language : 'zh-CN',
					autoclose : true,
					todayHighlight : true,
					todayBtn : "linked"
				});
			});

}

function gen_dm_table(deviceUrl) {
	var table = $('#dm_table').DataTable();
	table.search(deviceUrl).draw();
}

function gen_all_dc() {
	$
			.get(
					'/eospd_h5/mm/dcs',
					function(result) {
						var output = '<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown"> 全部采集器 <span class="caret"></span></button>';
						output += '<ul class="dropdown-menu pull-right" role="menu">';

						$.each(result, function(key, val) {
							output += '<li value = "' + val.deviceUrl
									+ '" onclick=gen_dm_table("' + val.dcUrl
									+ '")><a href ="#">' + val.dcUrl
									+ '</a></li>';
						});
						output += '</ul>';

						$('.dc-meter-dropdown').html(output);
					});
}
function gen_all_meter() {
	$
			.get(
					'/eospd_h5/mm/meters',
					function(result) {
						var output = '<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown"> 全部仪表 <span class="caret"></span></button>';
						output += '<ul class="dropdown-menu pull-right" role="menu">';

						$.each(result, function(key, val) {
							output += '<li value = "' + val.deviceUrl
									+ '" onclick=gen_dm_table("'
									+ val.deviceUrl + '")><a href ="#">'
									+ val.deviceUrl + '</a></li>';
						});
						output += '</ul>';

						$('.dc-meter-dropdown').html(output);
					});
}

function add_efd() {
	$.post("/eospd_h5/efd/add", {
		circuitUrl : $('.circuitUrl')[0].value,
		circuitName : $('.circuitName')[0].value,
		location : $('.location')[0].value,
		parentId : $('.parentId')[0].value,
		circuitName : $('.circuitName')[0].value,
		switchRatedC : $('.switchRatedC')[0].value,
		levelV : $('.levelV')[0].value,
		designPower : $('.designPower')[0].value,
		powerPhase : $('.powerPhase')[0].value
	}, function(result) {
		alert(result);
	});
}

function gen_meter_div() {
	gen_all_meter();
	document.getElementById("home").innerHTML = "";
	$('#home')
			.html(
					'<div class="dataTable_wrapper"><table class="table table-striped table-bordered table-hover" id="dm_table"><thead><tr><th>仪表名称</th><th>仪表类型</th><th>仪表通讯地址</th><th>位置</th><th>描述</th><th>采集器</th></tr></thead></table></div>');

	$.get('/eospd_h5/mm/dcs', function(dcs_result) {
		$.get('/eospd_h5/mm/metertypes', function(metertypes_result) {
			
		var dc_select_options = [];
		$.each(dcs_result, function(n, item) {
			dc_select_options.push({
				label : item.dcUrl,
				value : item.dcId
			});
		});
		
		var meter_type_select_options = [];
		$.each(metertypes_result, function(n, item) {
			meter_type_select_options.push({
				label : item.typeName,
				value : item.dataTypeId
			});
		});
		
		var editor = new $.fn.dataTable.Editor({
			ajax : "/eospd_h5/mm/meter/staff",
			table : "#dm_table",
			i18n : table_editor_chinese,
			idSrc : 'dcUrl',
			fields : [ {
				label : "仪表名称:",
				name : "deviceUrl"
			}, {
				label : "仪表类型:",
				name : "typeName",
					type : "select",
					options : meter_type_select_options
			}, {
				label : "仪表通讯地址:",
				name : "deviceCommAddr"
			}, {
				label : "位置:",
				name : "location"
			}, {
				label : "描述:",
				name : "desc"
			}, {
				label : "采集器:",
				name : "dcUrl",
				type : "select",
				options : dc_select_options
			} ]
		});

		var table = $('#dm_table').DataTable({
			"language" : chinese_langue,
			"processing" : true,
			"serverSide" : true,
			lengthChange : false,
			select : true,
			"ajax" : {
				"url" : "/eospd_h5/mm/meter/list",
				"type" : "POST"
			},
			"columns" : [ {
				"data" : "deviceUrl"
			}, {
				"data" : "typeName"
			}, {
				"data" : "deviceCommAddr"
			}, {
				"data" : "location"
			}, {
				"data" : "desc"
			}, {
				"data" : "dcUrl"
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
	});
}

function gen_dc_div() {
	gen_all_dc();
	document.getElementById("home").innerHTML = "";
	$('#home')
			.html(
					'<div class="dataTable_wrapper"><table class="table table-striped table-bordered table-hover" id="dm_table"><thead><tr><th>采集器URl</th><th>采集器名称</th><th>位置</th><th>描述</th><th>通道数量</th><th>IP</th><th>安装时间</th></tr></thead></table></div>');

	var editor = new $.fn.dataTable.Editor({
		ajax : "/eospd_h5/mm/dc/staff",
		table : "#dm_table",
		i18n : table_editor_chinese,
		idSrc : 'dcUrl',
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

	var table = $('#dm_table').DataTable({
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

}

var table_editor_chinese = {
	create : {
		button : "创建",
		title : "新建一个吧",
		submit : "提交"
	},
	edit : {
		button : "修改",
		title : "修改",
		submit : "提交"
	},
	remove : {
		button : "删除",
		title : "即将删除，请审核信息",
		submit : "提交",
		confirm : {
			_ : "确认要删除 %d lignes?",
			1 : "确认要删除?"
		}
	},
	error : {
		system : "系统错误，请联系开发人员"
	},
	multi : {
		title : "Plusieurs valeurs",
		info : "Les éléments sélectionnés contiennent des valeurs différentes pour cette entrée. Pour modifier et mettre tous les éléments pour cette entrée pour la même valeur, cliquez ou appuyez ici, sinon ils vont conserver leurs valeurs individuelles.",
		restore : "Annuler les modifications"
	},
	datetime : {
		previous : 'qian',
		next : 'Premier',
		months : [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月',
				'11月', '12月' ],
		weekdays : [ '一', '二', '三', '四', '五', '六', '日' ]
	}
}

var chinese_langue = {
	"sProcessing" : "处理中...",
	"sLengthMenu" : "显示 _MENU_ 项结果",
	"sZeroRecords" : "没有匹配结果",
	"sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
	"sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
	"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
	"sInfoPostFix" : "",
	"sSearch" : "搜索:",
	"sUrl" : "",
	"sEmptyTable" : "表中数据为空",
	"sLoadingRecords" : "载入中...",
	"sInfoThousands" : ",",
	"oPaginate" : {
		"sFirst" : "首页",
		"sPrevious" : "上页",
		"sNext" : "下页",
		"sLast" : "末页"
	},
	"oAria" : {
		"sSortAscending" : ": 以升序排列此列",
		"sSortDescending" : ": 以降序排列此列"
	}
};