/*绘制折线图*/
function drawLineCharts(data, isSorted){
	var arrData = new Array();
	var vals = data.split(",");
	var len = vals.length;
	
	for(var i = 0; i<len-1; i++) {
		arrData.push(parseFloat(vals[i]));
	}
	if(isSorted) {
		arrData.sort(sortSmall2Big);
	}
	
	var chart = new Highcharts.Chart({
		chart: {
			width:'800',
			height:'450',
			zoomType:'x',
			renderTo: 'container',
			type:'spline',
			defaultSeriesType: 'line',
			marginBottom: 25
		},
		title: {
			text: '表头标题',
			x: -20
		},
		subtitle: {
			text: '这里是副标题',
			x: -20
		},
		xAxis: {
			//type:'datetime',
			//maxZoom:24*3600*1000
		},
		yAxis: {
			title: {
				text: '单位：'	
			},
			plotLines: [{
				value: 0,
				width: 1,
				color: '#808080'
			}]
		},
		tooltip: {
			crosshairs:true,
			shared:true
		},
		legend: {
			layout: 'vertical',
			align: 'right',
			verticalAlign: 'top',
			x: -10,
			y: 100,
			borderWidth: 0
		},
		series: [{
			pointInterval:1,
			pointStart:0,
			name: 'series',
			data: arrData
		}]
		//eval('('+seriesCharts+')');
	});
}

/*排序函数*/
function sortSmall2Big(a,b) {
	return a-b;
}

