function render_data_admin(s_time, e_time){
	var s_time =  $('.s_time_y').val().replace('年', '-').replace('月', '-').replace('日' ,'');
	var e_time = $('.e_time_y').val().replace('年', '-').replace('月', '-').replace('日' ,'');
	
	$.get("/eospd_h5/cid/data_query?s_time="+s_time +"&e_time=" + e_time, function(data ,status){
	 	data_admin(data);
	});
}

function data_admin(response_data) {
	
//	if (typeof response_data.qualityTime == "undefined" || 0 === response_data.qualityTime.length) {
//		response_data = new Object();
//		response_data.qualityTime = ['11:00', '11:15', '11:30', '11-45','12:00', '12:15', '12:30', '12:45', 
//	                         '13:00', '13:15', '13:30', '13:45', '14:00', '14:15',  
//	                         ];
//		response_data.realNormalCnt = [402, 335, 409, 847, 902, 834, 868,402, 335, 409, 847, 902, 834, 868];
//		response_data.retranNormalCnt = [300, 31, 54, 156, 339, 818, 201,300, 31, 54, 156, 339, 818, 201];
//		response_data.dataRepairCnt = [163, 203, 276, 408, 547, 729, 628,163, 203, 276, 408, 547, 729, 628];
//		response_data.dataErrCnt = [106, 107, 111, 133, 221, 767, 766,106, 107, 111, 133, 221, 767, 766];
//		response_data.dataLoseCnt = [200, 31, 54, 156, 339, 818, 201,200, 31, 54, 156, 339, 818, 201];
//	}
	
	var defaultColors = ['grey', 'yellow','blue', '#006400',  'green'];
    Highcharts.setOptions({colors : defaultColors});
    
    $('#container').highcharts({
        chart: {
        	height:350,
        	width: 1000,
            type: 'area',
            backgroundColor:'rgba(0,0,0,0)'
        },
        xAxis: {
            categories: response_data.qualityTime,
            tickmarkPlacement: 'off',
            title: {
                enabled: false
            }
        	
        },
        yAxis: {
        	gridLineColor:'rgba(0,0,0,0)',
        	tickPositions:[0,100],
               tickmarkPlacement: 'off',
	            title: {
	                enabled: false
	            }
        },
        tooltip: {
            pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.percentage:.1f}%</b> ({point.y:,.0f})<br/>',
            shared: true
        },
        plotOptions: {
            area: {
                stacking: 'percent',
                lineColor: '#ffffff',
                lineWidth: 2,
                marker: {
                	enabled:false,
                    lineWidth: 2,
                    lineColor: '#ffffff'
                }
            }
        },
        legend:{
        	reversed:true
        },
        
        series: [
            {
            name: '<label style="color:white">数据丢失</label>',                
            data: response_data.dataLoseCnt 
        },{
            name: '<label style="color:white">错误未修复</label>',
            data: response_data.dataErrCnt
        }, {
            name: '<label style="color:white">错误修复</label>',
            data: response_data.dataRepairCnt
        },{
            name: '<label style="color:white">重传数据</label>',
            data: response_data.retranNormalCnt
        },  {
            name: '<label style="color:white">正常数据</label>',
            data: response_data.realNormalCnt
        }]
    });
    $('#container').dragScroll({});
}

var CreateEfdChartTree = function(title) {
	$.get('/eospd_h5/efd/tree_data', function(obj) {
		myTree = new ECOTree('myTree', 'topo_canvas');
		var w = 100;
		var h = 50;
		// myTree.config.linkType = 'B';
		// myTree.config.iRootOrientation = ECOTree.RO_TOP;
		// myTree.config.topYAdjustment = -180;
		myTree.config.linkColor = "black";
		// myTree.config.nodeColor = "#FFAAAA";
		// myTree.config.nodeBorderColor = "black";
		// myTree.config.useTarget = false;
		myTree.config.iLevelSeparation = 80;
		// myTree.config.iSiblingSeparation = 150;
		// myTree.config.selectMode = ECOTree.SL_SINGLE;
		// (id, pid, dsc, w, h, c, bc, target, meta)

		var dcs = new Map();
		$.each(obj, function(key, item) {
			if (key == "circuits") {
				var i = 0;
				$.each(item, function(key, item) {
					var circuit = new Object();
					circuit.url = item.url;
					circuit.title = item.title;
					circuit.parent = item.parent;
					console.log(circuit.url + ',' + circuit.title);
					if (circuit.parent == '') {
						myTree.add(circuit.url, -1, "Apex Node", w, h,
								"rgb(24,157,139)", "rgb(24,157,139)", "hello",
								circuit.title + "\n" + circuit.url);
					} else {
						myTree.add(circuit.url, circuit.parent, "Apex Node", w,
								h, "rgb(24,157,139)", "rgb(24,157,139)",
								"hello", circuit.title + "\n" + circuit.url);
					}

				});
			}
		});
		myTree.UpdateTree();
	});
}

var get_all_efd_info = function(title) {
	console.log("title:" + title);
	$('#select_info').html(title + ' <span class="caret"></span>');
	CreateEfdChartTree();
};
			

var CreateCmChartTree = function() {
	$.get('/eospd_h5/mm/dc/mter/tree_data', function(obj) {
		
		myTree = new ECOTree('myTree', 'topo_canvas');
		myTree.config.nodeColor = "#FFAAAA";
		myTree.config.iRootOrientation=ECOTree.RO_LEFT;
		myTree.config.useTarget = false;
		myTree.config.linkType = 'Q';
		myTree.config.iLevelSeparation = 5;
		myTree.config.iSiblingSeparation = 5;
		myTree.config.iSubtreeSeparation = 5;

		myTree.add(0, -1, "Apex Node", 100, 40, "rgb(40,159,86)",
				"rgb(40,159,86)", "head", "能源采集系统");
		var w = 80;
		var h = 60;

		var dcs = new Map();
		$.each(obj, function(key, item) {
			if (key == "dcs") {
				var i = 0;
				$.each(item, function(key, item) {
					var dc = new Object();
					dc.title = item.title;
					dc.ip = item.ip;
					console.log(dc.title + " " + dc.ip);
					myTree.add(dc.title, 0, "Apex Node", w, h,
							"rgb(24,157,139)", "rgb(24,157,139)", "hello",
							dc.title + "\n" + dc.ip);
					$.each(item.sns, function(key, item) {
						myTree.add(dc.title + "/#" + item, dc.title,
								"Apex Node", 1, 1, "rgb(69,139,242)",
								"rgb(69,139,242)", "hello", "总线地址:" + item);
						console.log("item:" + item);
					});
					// dcs.put(dc.title, dc);
				});
			}

		});
		var meters = new Map();
		$.each(obj, function(key, item) {
			if (key == "meters") {
				$.each(item, function(key, item) {
					var meter = new Object();
					meter.title = item.title;
					meter.addr = item.addr;
					meter.dc = item.dc;
					meter.dc_sn = item.dc_sn;
					meter.status = item.status;
					console.log(meter.title + "," + meter.addr + "," + meter.dc
							+ "," + meter.dc_sn);
					myTree.add(meter.title, meter.dc + "/#" + meter.dc_sn,
							"Apex Node", 0, 0, meter.status ? "rgb(34,92,171)"
									: "rgb(244,92,72)", "rgb(34,92,171)",
							"hello", meter.title + "\n" + meter.addr);

					// meters.put(dc.title, meter);
				});
			}

		});
		myTree.config.nodeColor = "#FFAAAA";
		myTree.config.useTarget = false;
		myTree.config.iLevelSeparation = 60;
		myTree.config.iSiblingSeparation = 30;
		myTree.UpdateTree();
	});
}


function mm_his() {
	gen_dc_div();

	$('.input-daterange input').each(
			function(i) {

				var d = new Date();
				if (0 == i) {
					d = new Date(d.valueOf() - 900000);
				}
				
				$(this).val(
						d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
								+ (d.getDate()) + "日 "+ d.toString().split(' ')[4].substring(0, 5)); 
				
				$(this).datetimepicker({
			        language:  'zh-CN',
			        weekStart: 1,
			        todayBtn:  1,
					autoclose: 1,
					todayHighlight: 1,
					startView: 2,
					forceParse: 0,
					autoclose : true,
					endDate: new Date(),
					format: 'yyyy年mm月dd日 hh:ii'
				}).on('changeDate', function(value) {
				    var s_date = $('.input-daterange input')[0].value;
				    var e_date = $('.input-daterange input')[1].value;
				    //console.log("s_date:" + s_date);
				    //console.log("e_date:" + e_date);

					var table = $('#dm_table').DataTable();
					table.columns(0).search(s_date + "," + e_date).draw();
				});
			});
}

function col_his() {
	//gen_all_meter();
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
			function(i) {
				var d = new Date()
				
				if (0 == i) {
					$(this).val(
							d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
									+ (d.getDate()) + "日 00:00"); 
				} else {
					$(this).val(
						d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
								+ (d.getDate()) + "日 "+ d.toString().split(' ')[4].substring(0, 5)); 
				}
				$(this).datetimepicker({
			        language:  'zh-CN',
			        weekStart: 1,
			        todayBtn:  1,
					autoclose: 1,
					todayHighlight: 1,
					startView: 2,
					forceParse: 0,
					autoclose : true,
					endDate: new Date(),
					format: 'yyyy年mm月dd日 hh:ii'
				}).on('changeDate', function(value) {
				    //var s_date = $('.input-daterange input')[0].value;
				   // var e_date = $('.input-daterange input')[1].value;
				    //console.log("s_date:" + s_date);
				    //console.log("e_date:" + e_date);

					//var table = $('#dm_table').DataTable();
					//table.columns(0).search(s_date + "," + e_date).draw();
				});
				
				
			});
	
	var s_date = $('.input-daterange input')[0].value;
    var e_date = $('.input-daterange input')[1].value;
    //console.log("s_date:" + s_date);
    //console.log("e_date:" + e_date);

	var table = $('#dm_table').DataTable();
	table.columns(0).search(s_date + "," + e_date).draw();
	
	$("#btn_refresh").click(function() {
		 var s_date = $('.input-daterange input')[0].value;
		    var e_date = $('.input-daterange input')[1].value;
		    //console.log("s_date:" + s_date);
		    //console.log("e_date:" + e_date);

			var table = $('#dm_table').DataTable();
			table.columns(0).search(s_date + "," + e_date).draw();
	})
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
			function(i) {

				var d = new Date();
				if (0 == i) {
					$(this).val(
							d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
									+ (d.getDate()) + "日 00:00"); 
				} else {
					$(this).val(
						d.getFullYear() + "年" + (d.getMonth() + 1) + "月"
								+ (d.getDate()) + "日 "+ d.toString().split(' ')[4].substring(0, 5)); 
				}
				$(this).datetimepicker({
			        language: 'zh-CN',
			        weekStart: 1,
			        todayBtn:  1,
					autoclose: 1,
					todayHighlight: 1,
					startView: 2,
					forceParse: 0,
					autoclose : true,
					endDate: new Date(),
					format: 'yyyy年mm月dd日 hh:ii'
				}).on('changeDate', function(value) {
				    //var s_date = $('.input-daterange input')[0].value;
				    //var e_date = $('.input-daterange input')[1].value;
				    //console.log("s_date:" + s_date);
				    //console.log("e_date:" + e_date);

					//var table = $('#dm_table').DataTable();
					//table.columns(0).search(s_date + "," + e_date).draw();
				});
			});
	
	var s_date = $('.input-daterange input')[0].value;
    var e_date = $('.input-daterange input')[1].value;
    //console.log("s_date:" + s_date);
    //console.log("e_date:" + e_date);

	var table = $('#dm_table').DataTable();
	table.columns(0).search(s_date + "," + e_date).draw();
	
	$("#btn_refresh").click(function() {
		var s_date = $('.input-daterange input')[0].value;
	    var e_date = $('.input-daterange input')[1].value;
	    //console.log("s_date:" + s_date);
	    //console.log("e_date:" + e_date);

		var table = $('#dm_table').DataTable();
		table.columns(0).search(s_date + "," + e_date).draw();
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
	$.get(
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
					'<div class="dataTable_wrapper" style="overflow: auto"><table class="table table-striped table-bordered table-hover" id="dm_table"><thead><tr><th>仪表名称</th><th>仪表类型</th><th>仪表通讯地址</th><th>位置</th><th>描述</th><th>采集器</th><th>安装时间</th><th>关联电支路</th><th>仪表ID</th></tr></thead></table></div>');

	$.get('/eospd_h5/mm/dcs', function(dcs_result) {
		$.get('/eospd_h5/mm/metertypes', function(metertypes_result) {
			$.get('/eospd_h5/mm/circuits', function(circuits_result) {
				

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
		
		var circuit_type_select_options = [];
		$.each(circuits_result, function(n, item) {
			if (0 === item.deviceId) {
				circuit_type_select_options.push({
					label : item.circuitUrl,
					value : item.circuitId
				});
			}
		});
		
		var editor = new $.fn.dataTable.Editor({
			ajax : "/eospd_h5/mm/meter/staff",
			table : "#dm_table",
			i18n : table_editor_chinese,
			idSrc : 'deviceId',
			fields : [ {
				label : "仪表ID:",
				name : "deviceId", 
				type:    "hidden"
			}, {
				label : "仪表名称:",
				name : "deviceUrl"
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
				label : "关联电支路:",
				name : "circuitUrl",
				type : "select",
				options : circuit_type_select_options
			}, {
				label : "仪表类型:",
				name : "typeName",
				type : "select",
				options : meter_type_select_options
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
			}, {
				"data" : "installTime"
			}, {
				"data" : "circuitUrl"
			} , {
				"data" : "deviceId",
				"visible": false
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
	"sProcessing" : "",
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