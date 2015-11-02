
function getMyEcharts(obj) {
	// 报表标题
	var myChartTitle = obj["myChartTitle"];
	// 背景色
	var myChartBackgroundColor = obj["myChartBackgroundColor"];
	// 数据颜色
	var myChartDataColor = obj["myChartDataColor"];
	// x轴数据
	var myChartXAxisData = obj["myChartXAxisData"];
	// y轴数据
	var myChartYAxisData = obj["myChartYAxisData"];
	// 主数据
	var myChartSeriesData = obj["myChartSeriesData"];
	// 年月周日切换类型
	var myChartSwitchType = obj["myChartSwitchType"];
	// 报表类型
	var myChartType = obj["myChartType"];
	// Y轴单位格式化
	var myChartYAxisFormatter = obj["myChartYAxisFormatter"];
	// 容器id
	var myContainerId = obj["myContainerId"];
	// 图例数据
	var myChartLegendData = obj["myChartLegendData"];
	// 功率因素
	var myChartDyType = obj["myChartDyType"];
	var myChartSeries = obj["myChartSeries"];

	var myChartGrid = obj["myChartGrid"];


	if (myChartType == "barAndLine") {
		require.config({
			paths : {
				echarts : 'js/'
			}
		});
		// require begin
		require([ 'echarts', 'echarts/chart/line', 'echarts/chart/bar' ], function(ec) {
			var myChart = ec.init(document.getElementById(myContainerId));
			// myOption begin
			var myOption = {
				tooltip : {
					trigger : 'axis'
				},
				calculable : true,
				// 网格
				grid : {
					x : myChartGrid["x"],
					y : myChartGrid["y"],
					x2 : myChartGrid["x2"],
					y2 : myChartGrid["y2"],
					height : myChartGrid["height"],
					borderWidth : 0,
					borderColor : 'red'
				},
				legend : {
					data : [ '电力', '燃气', '平均每人能耗' ],
					textStyle : {
						color : '#FFFFFF'
					},
				},
				xAxis : [ {
					axisLabel : {
						show : true,
						rotate : 0,
						margin : 8,
						// formatter: null,
						textStyle : {
							color : '#ffffff'
						}
					},
					type : 'category',
					data : [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月' ]
				} ],
				yAxis : [ {
					axisLabel : {
						textStyle : {
							color : '#ffffff',
						}
					},
					type : 'value',
					name : 'CJ',
				}, {
					axisLabel : {
						textStyle : {
							color : '#ffffff',
						}
					},
					type : 'value',
					name : 'MJ',
					textStyle : {
						color : '#ffffff',
					}
				} ],
				series : [ {
					name : '电力',
					type : 'bar',
					stack : '降水量',
					data : [ 2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3 ]
				}, {
					name : '燃气',
					type : 'bar',
					stack : '降水量',
					data : [ 2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3 ]
				}, {
					name : '平均每人能耗',
					type : 'line',
					yAxisIndex : 1,
					data : [ 2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2 ]
				} ]
			};
			// myOption end
			myChart.setOption(myOption);
		});
		// require end
	}
	// 饼状图end

	// 矩形树图begin
	if (myChartType == "treemap") {
		require.config({
			paths : {
				echarts : 'js/'
			}
		});
		// require begin
		require([ 'echarts', 'echarts/chart/treemap' ], function(ec) {
			var myChart = ec.init(document.getElementById(myContainerId));
			// myOption begin
			var myOption = {
				tooltip : {
					trigger : 'item',
					formatter : "{b}: {c}"
				},
				series : [ {
					name : '矩形图',
					type : 'treemap',
					itemStyle : {
						normal : {
							label : {
								show : true,
								formatter : "{b}"
							},
							borderWidth : 1
						},
						emphasis : {
							label : {
								show : true
							}
						}
					},
					data : [ {
						name : '三星',
						value : 50
					}, {
						name : '三星',
						value : 50
					}, {
						name : '三星',
						value : 50
					}, {
						name : '三星',
						value : 50
					}, {
						name : '三星',
						value : 50
					}, {
						name : '三星',
						value : 50
					} ]
				} ]
			};
			// myOption end
			myChart.setOption(myOption);
		});
		// require end
	}
	// 矩形树图end

	// 饼状图begin
	if (myChartType == "pie") {
		require.config({
			paths : {
				echarts : 'js/'
			}
		});
		// require begin
		require([ 'echarts', 'echarts/chart/pie' ], function(ec) {
			var myChart = ec.init(document.getElementById(myContainerId));
			// myOption begin
			var myOption = {
				color : myChartDataColor,
				title : {
					x : 'center',
					text : myChartTitle,
					textStyle : {
						color : '#ffffff',
						fontSize : 12,
					},
				},
				tooltip : {
					trigger : 'item',
					formatter : "{a} <br/>{b} : {c} ({d}%)"
				},
				legend : {
					show : false,
					orient : 'vertical',
					x : 'left',
					data : myChartXAxisData,
					textStyle : {
						color : '#ffffff',
						fontSize : 12,
					},
				},
				series : myChartSeries
			};
			// myOption end
			myChart.setOption(myOption);
		});
		// require end
	}
	// 饼状图end

	// funnel type begin
	// 漏斗图
	if (myChartType == "funnel") {
		require.config({
			paths : {
				echarts : 'js/'
			}
		});
		require([ 'echarts', 'echarts/chart/funnel' ], function(ec) {
			var ecConfig = require('echarts/config');
			var myChart = ec.init(document.getElementById(myContainerId));
			myChart.on(ecConfig.EVENT.DATA_ZOOM, eConsole);
			// option begin
			myOption = {
				backgroundColor : myChartBackgroundColor,
				title : {
					text : '用能结构图',
					textStyle : {
						color : '#ffffff',
						fontSize : 12,
					},
				},
				tooltip : {
					trigger : 'item',
					formatter : "{a} <br/>{b} : {c}%"
				},
				legend : {
					data : [ '电', '燃油', '水', '燃气' ],
					textStyle : {
						color : '#ffffff'
					},
					x : 'center',
					y : 'bottom',
				},
				calculable : true,
				series : [ {
					name : '能耗比例',
					type : 'funnel',
					width : '70%',
					height : '70%',
					x : 30,
					y : 50,
					x2 : 30,
					y2 : 30,
					data : [ {
						value : 25,
						name : '水'
					}, {
						value : 50,
						name : '燃气'
					}, {
						value : 75,
						name : '燃油'
					}, {
						value : 100,
						name : '电'
					} ]
				} ]
			};
			// option end
			myChart.setOption(myOption);
			// dataZomm回调函数begin
			function eConsole(param) {
				if (myChartSwitchType == "year") {
					var startMonth = Math.round((12 / 100) * param.zoom.start);
					if (startMonth == 0) {
						startMonth = 1;
					}
					startMonth = "2012-" + startMonth + "-01";
					var endMonth = Math.round((12 / 100) * param.zoom.end);
					var endMonth = "2012-" + endMonth + "-31";
					var dataHtml = startMonth + " ~ " + endMonth;
					$("#top_data").html(dataHtml);
				}
				// 月
				else if (myChartSwitchType == "month") {
					var startDay = Math.round((30 / 100) * param.zoom.start);
					if (startDay == 0) {
						startDay = 1;
					}
					startDay = "2012-2-" + startDay
					var endDay = Math.round((30 / 100) * param.zoom.end);
					var endDay = "2012-2-" + endDay;
					var dataHtml = startDay + " ~ " + endDay;
					$("#top_data").html(dataHtml);
				}
				// 周
				else if (myChartSwitchType == "week") {

				}
				// 日
				else if (myChartSwitchType == "day") {

				}
			}
			// dataZomm回调函数end
		});
	}
	// funnel type end

	// line type begin
	if (myChartType == "line") {
		require.config({
			paths : {
				echarts : 'js/'
			}
		});
		require([ 'echarts', 'echarts/chart/line' ], function(ec) {
			var ecConfig = require('echarts/config');
			var myChart = ec.init(document.getElementById(myContainerId));
			// option begin
			var myOption = {
				backgroundColor : myChartBackgroundColor,
				color : myChartDataColor,
				title : {
					show : true,
					x : 'left',
					text : myChartTitle,
					textStyle : {
						fontSize : 20,
						fontWeight : 'bolder',
						color : '#ffffff'
					}
				},
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					data : myChartLegendData,
					textStyle : {
						color : '#ffffff'
					}
				},
				// 网格
				grid : {
					x : myChartGrid["x"],
					y : myChartGrid["y"],
					x2 : myChartGrid["x2"],
					y2 : myChartGrid["y2"],
					height : myChartGrid["height"],
					borderWidth : 0,
					borderColor : '#ccc'
				},
				xAxis : [ {
					type : 'category',
					data : myChartXAxisData,
					splitLine : false,
					axisLine : {
						show : false
					},
					axisLabel : {
						show : true,
						rotate : 0,
						margin : 8,
						// formatter: null,
						textStyle : {
							color : '#ffffff'
						}
					},
				}, ],
				yAxis : [ {
					type : 'value',
					splitArea : {
						show : false
					},
					splitLine : {
						show : true
					},
					axisLine : {
						show : false
					},
					position : 'top',
					axisLabel : {
						// 坐标轴文本标签，详见axis.axisLabel
						formatter : '{value} ' + myChartYAxisFormatter,
						show : true,
						margin : 8,
						boundaryGap : false,
						// formatter: null,
						textStyle : {
							color : '#ffffff',
						}
					},
				} ],
				series : myChartSeries,
			};
			// option end
			myChart.setOption(myOption);
		});
	}
	// line type end

	// 动态折线图
	if (myChartType == "dynamicLine") {
		require.config({
			paths : {
				echarts : 'js/'
			}
		});
		require([ 'echarts', 'echarts/chart/line', ], function(ec) {
			var myChart = ec.init(document.getElementById(myContainerId));
			var option = {
				backgroundColor : '#000000',
				color : myChartDataColor,
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					data : myChartLegendData,
					textStyle : {
						color : '#ffffff'
					}
				},
				grid : {
					x : 70,
					y : 25,
					x2 : 10,
					y2 : 25,
				},
				xAxis : [ {
					type : 'category',
					boundaryGap : true,
					splitLine : false,
					axisLine : {
						show : false
					},
					axisLabel : {
						show : true,
						textStyle : {
							color : '#ffffff'
						}
					},
					data : (function() {
						var now = new Date();
						var res = [];
						var len = 10;
						while (len--) {
							res.unshift(now.toLocaleTimeString().replace(/^\D*/, ''));
							now = new Date(now - 2000);
						}
						return res;
					})()
				} ],
				yAxis : [ {
					type : 'value',
					scale : true,
					name : myChartLegendData[0],
					axisLabel : {
						formatter : '{value} ' + myChartYAxisFormatter,
						show : true,
						margin : 8,
						boundaryGap : false,
						textStyle : {
							color : '#ffffff',
						}
					},
				} ],
				series : [ {
					name : myChartLegendData[0],
					type : 'line',
					data : (function() {
						var res = [];
						var len = 10;
						while (len--) {
							// 功率
							if (myChartDyType == 0) {
								res.push(Math.round((Math.random() + 1) * 500));
							}
							// 功率因素
							else {
								res.push(((Math.random() + 1) / 2));
							}
						}
						return res;
					})()
				} ]
			};

			myChart.setOption(option);

			clearInterval(timeTicketDynamicLine);
			timeTicket = setInterval(function() {
				// 功率
				if (myChartDyType == 0) {
					myChart.addData([ [ 0, Math.round((Math.random() + 1) * 500), false, false, (new Date()).toLocaleTimeString().replace(/^\D*/, '') ] ]);
				}
				// 功率因素
				else if (myChartDyType == 1) {
					myChart.addData([ [ 0, ((Math.random() + 1) / 2), false, false, (new Date()).toLocaleTimeString().replace(/^\D*/, '') ] ]);
				}
			}, 2100);

		});
	}

	// column type begin
	// 横向条状图
	if (myChartType == "column") {
		require.config({
			paths : {
				echarts : 'js/'
			}
		});
		require([ 'echarts', 'echarts/chart/bar' ], function(ec) {
			var ecConfig = require('echarts/config');
			var myChart = ec.init(document.getElementById(myContainerId));
			// option begin
			var myOption = {
				backgroundColor : myChartBackgroundColor,
				color : myChartDataColor,
				title : {
					y : 'center',
					text : myChartTitle,
					textStyle : {
						color : '#FFFFFF'
					}
				},
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					show : false,
					data : myChartXAxisData,
					textStyle : {
						color : '#FFFFFF'
					},
				},
				calculable : true,
				grid : {
					x : 90,
					y : 10,
					x2 : 0,
					y2 : 0,
					borderWidth : 0,
					borderColor : '#ccc'
				},
				xAxis : [ {
					type : 'value',
					boundaryGap : [ 0, 0.01 ],
					splitArea : {
						show : false
					},
					splitLine : {
						show : true
					},
					axisLine : {
						show : false
					},
					axisLabel : {
						show : true,
						rotate : 0,
						margin : 8,
						textStyle : {
							color : '#ffffff'
						}
					},
				} ],
				yAxis : [ {
					splitLine : false,
					axisLine : {
						show : false
					},
					type : 'category',
					axisLabel : {
						show : true,
						rotate : 0,
						margin : 8,
						textStyle : {
							color : '#ffffff'
						}
					},
					data : myChartYAxisData,
				} ],
				series : myChartSeries
			};
			// option end
			myChart.setOption(myOption);
		});
	}
	// column type end

	// bar type begin
	// 柱状条形图
	if (myChartType == "bar") {
		require.config({
			paths : {
				echarts : 'js/'
			}
		});
		require([ 'echarts', 'echarts/chart/bar' ], function(ec) {
			var ecConfig = require('echarts/config');
			var myChart = ec.init(document.getElementById(myContainerId));
			myChart.on(ecConfig.EVENT.DATA_ZOOM, eConsole);
			// option begin
			var myOption = {
				backgroundColor : myChartBackgroundColor,
				color : myChartDataColor,
				title : {
					show : true,
					x : '12',
					text : myChartTitle,
					textStyle : {
						fontSize : 14,
						fontWeight : 'normal',
						color : '#ffffff'
					}
				},
				tooltip : {
					trigger : 'axis'
				},
				dataZoom : {
					show : true,
					realtime : true,
					dataBackgroundColor : '#0078A8',
					start : 0,
					end : 100,
					y : 450
				},
				// 网格
				grid : {
					x : myChartGrid["x"],
					y : myChartGrid["y"],
					x2 : myChartGrid["x2"],
					y2 : myChartGrid["y2"],
					height : myChartGrid["height"],
					borderWidth : 0,
					borderColor : '#ccc'
				},
				xAxis : [ {
					type : 'category',
					data : myChartXAxisData,
					splitLine : false,
					axisLine : {
						show : false
					},
					axisLabel : {
						show : true,
						rotate : 0,
						margin : 8,
						// formatter: null,
						textStyle : {
							color : '#ffffff'
						}
					},
				}, ],
				yAxis : [ {
					type : 'value',
					splitArea : {
						show : false
					},
					splitLine : {
						show : true
					},
					axisLine : {
						show : false
					},
					position : 'top',
					axisLabel : {
						// 坐标轴文本标签，详见axis.axisLabel
						formatter : '{value} ' + myChartYAxisFormatter,
						show : true,
						margin : 8,
						boundaryGap : false,
						textStyle : {
							color : '#ffffff',
						}
					},
				} ],
				series : myChartSeries
			};
			// option end
			myChart.setOption(myOption);
			// dataZomm回调函数begin
			function eConsole(param) {
				// 逐年
				if (myChartSwitchType == "year") {
					var start = Math.round((myChartXAxisData.length / 100) * param.zoom.start);
					start = myChartXAxisData[start];

					var end = Math.round((myChartXAxisData.length / 100) * param.zoom.end);
					end = myChartXAxisData[end - 1];

					var dataHtml = start + " ~ " + end;
					$("#top_data").html(dataHtml);
				}
				// 逐月
				else if (myChartSwitchType == "month") {
					var start = Math.round((myChartXAxisData.length / 100) * param.zoom.start);
					start = "2013." + myChartXAxisData[start] + ".01";

					var end = Math.round((myChartXAxisData.length / 100) * param.zoom.end);
					end = "2013." + myChartXAxisData[end - 1] + ".31";

					var dataHtml = start + " ~ " + end;
					$("#top_data").html(dataHtml);
				}
				// 逐日
				else if (myChartSwitchType == "week") {
					var start = Math.round((myChartXAxisData.length / 100) * param.zoom.start);
					start = "2013.01." + myChartXAxisData[start];

					var end = Math.round((myChartXAxisData.length / 100) * param.zoom.end);
					end = "2013.01." + myChartXAxisData[end - 1];

					var dataHtml = start + " ~ " + end;
					$("#top_data").html(dataHtml);
				}
				// 逐时
				else if (myChartSwitchType == "day") {
					var start = Math.round((myChartXAxisData.length / 100) * param.zoom.start);
					start = "2013.01.01:" + myChartXAxisData[start];

					var end = Math.round((myChartXAxisData.length / 100) * param.zoom.end);
					end = "2013.01.31:" + myChartXAxisData[end - 1];

					var dataHtml = start + " ~ " + end;
					$("#top_data").html(dataHtml);
				}
			}
			// dataZomm回调函数end
		});
	}
	// bar type end

	// gauge type begin
	if (myChartType == "gauge") {
		require.config({
			paths : {
				echarts : 'js/'
			}
		});
		require([ 'echarts', 'echarts/chart/gauge' ], function(ec) {
			var ecConfig = require('echarts/config');
			var myChart = ec.init(document.getElementById(myContainerId));
			var myOption = {
				title : {
					text : myChartTitle,
					textStyle : {
						color : '#FFFFFF'
					}
				},
				tooltip : {
					formatter : "{a} <br/>{b} : {c}%"
				},
				series : [ {
					name : obj['myName'],
					type : 'gauge',
					splitNumber : 10, // 分割段数，默认为5
					axisLine : { // 坐标轴线
						lineStyle : { // 属性lineStyle控制线条样式
							color : [ [ 0.6, '#48b' ], [ 1, '#ff4500' ] ],
							width : 8
						}
					},
					axisTick : { // 坐标轴小标记
						splitNumber : 10, // 每份split细分多少段
						length : 12, // 属性length控制线长
						lineStyle : { // 属性lineStyle控制线条样式
							color : 'auto'
						}
					},
					axisLabel : { // 坐标轴文本标签，详见axis.axisLabel
						textStyle : { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
							color : 'auto'
						}
					},
					splitLine : { // 分隔线
						show : true, // 默认显示，属性show控制显示与否
						length : 30, // 属性length控制线长
						lineStyle : { // 属性lineStyle（详见lineStyle）控制线条样式
							color : 'auto'
						}
					},
					pointer : {
						width : 5
					},
					title : {
						show : true,
						offsetCenter : [ 0, '-40%' ], // x, y，单位px
						textStyle : { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
							fontWeight : 'bolder'
						}
					},
					detail : {
						formatter : '{value}%',
						textStyle : { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
							color : 'auto',
							fontWeight : 'bolder'
						}
					},
					data : [ {
						value : obj['myValue'],
						name :  obj['myName']
					} ]
				} ]
			};
			myChart.setOption(myOption);
		});
	}
	// gauge type end

	// 标准环状图begin
	if (myChartType == "loop") {
		require.config({
			paths : {
				echarts : 'js/'
			}
		});
		require([ 'echarts', 'echarts/chart/pie' ], function(ec) {
			var ecConfig = require('echarts/config');
			var myChart = ec.init(document.getElementById(myContainerId));
			// myOption begin
			var myOption = {
				title : {
					x : 'center',
					text : myChartTitle,
					textStyle : {
						color : '#ffffff',
						fontSize : 12,
					},
				},
				// color : myChartDataColor,
				color : [ "#F39900", "#BDCA00", "#E8361F", "#98D2CB" ],
				tooltip : {
					trigger : 'item',
					formatter : "{a} <br/>{b} : {c} ({d}%)"
				},
				calculable : false,
				series : myChartSeries,
			};
			// myOption end
			myChart.setOption(myOption);
		});
	}
	// 标准环装图end


	// 多维条形图begin
	if (myChartType == "mul_bar") {
		require.config({
			paths : {
				echarts : 'js/'
			}
		});

		var placeHoledStyle = {
		    normal:{
		        barBorderColor:'rgba(0,0,0,0)',
		        color:'rgba(0,0,0,0)'
		    },
		    emphasis:{
		        barBorderColor:'rgba(0,0,0,0)',
		        color:'rgba(0,0,0,0)'
		    }
		};
		var dataStyle = { 
		    normal: {
		        label : {
		            show: true,
		            position: 'insideLeft',
		            formatter: '{c}%'
		        }
		    }
		};

		require(['echarts', 
			'echarts/chart/line',
            'echarts/chart/bar',
            'echarts/chart/scatter',
            'echarts/chart/k',
            'echarts/chart/pie',
            'echarts/chart/radar',
            'echarts/chart/force',
            'echarts/chart/chord',
            'echarts/chart/gauge',
            'echarts/chart/funnel',
            'echarts/chart/eventRiver',
            'echarts/chart/venn',
            'echarts/chart/treemap',
            'echarts/chart/tree',
            'echarts/chart/wordCloud',
            'echarts/chart/heatmap'
            ], function(ec) {
			var ecConfig = require('echarts/config');
			var myChart = ec.init(document.getElementById(myContainerId));
			// myOption begin
			var myOption = {
			    title: {
			        text: '多维条形图',
			        subtext: 'From ExcelHome',
			        sublink: 'http://e.weibo.com/1341556070/AiEscco0H'
			    },
			    tooltip : {
			        trigger: 'axis',
			        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
			            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			        },
			        formatter : '{b}<br/>{a0}:{c0}%<br/>{a2}:{c2}%<br/>{a4}:{c4}%<br/>{a6}:{c6}%'
			    },
			    legend: {
			        y: 55,
			        itemGap : document.getElementById(myContainerId).offsetWidth / 8,
			        data:['仪表器一', '仪表器二','仪表器三', '仪表器四']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    grid: {
			        y: 80,
			        y2: 30
			    },
			    xAxis : [
			        {
			            type : 'value',
			            position: 'top',
			            splitLine: {show: false},
			            axisLabel: {show: false}
			        }
			    ],
			    yAxis : [
			        {
			            type : 'category',
			            splitLine: {show: false},
			            data : ['有效率', '在线率', '采集率']
			        }
			    ],
			    series : [
			        {
			            name:'仪表器一',
			            type:'bar',
			            stack: '总量',
			            itemStyle : dataStyle,
			            data:[38, 50, 33]
			        },
			        {
			            name:'仪表器二',
			            type:'bar',
			            stack: '总量',
			            itemStyle: placeHoledStyle,
			            data:[62, 50, 67]
			        },
			        {
			            name:'仪表器三',
			            type:'bar',
			            stack: '总量',
			            itemStyle : dataStyle,
			            data:[61, 41, 42]
			        },
			        {
			            name:'仪表器四',
			            type:'bar',
			            stack: '总量',
			            itemStyle: placeHoledStyle,
			            data:[39, 59, 58]
			        },
			        {
			            name:'仪表器五',
			            type:'bar',
			            stack: '总量',
			            itemStyle : dataStyle,
			            data:[37, 35, 44]
			        },
			        {
			            name:'仪表器六',
			            type:'bar',
			            stack: '总量',
			            itemStyle: placeHoledStyle,
			            data:[63, 65, 56]
			        },
			        {
			            name:'仪表器七',
			            type:'bar',
			            stack: '总量',
			            itemStyle : dataStyle,
			            data:[71, 50, 31]
			        },
			        {
			            name:'仪表器八',
			            type:'bar',
			            stack: '总量',
			            itemStyle: placeHoledStyle,
			            data:[29, 50, 69]
			        }
			    ]
			};
			// myOption end
			myChart.setOption(myOption);
		});
	}
	//多维条形图end
}
