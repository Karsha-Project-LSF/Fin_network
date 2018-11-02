<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Fin network</title>
<!-- Bootstrap -->
<link href="vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="build/css/custom.min.css" rel="stylesheet">
<link href="css/jquery.auto-complete.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/tabs.css">

<link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
<link
	href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
	rel="stylesheet">
<link
	href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
	rel="stylesheet">

<style type="text/css">
#container {
	position: relative;
	overflow: hidden;
}

.active1 {
	background-color: #52B9FA;
	color: white;
}

.axis {
	font: 10px sans-serif;
}

.axis path, .axis line {
	fill: none;
	stroke: #000;
	shape-rendering: crispEdges;
}
</style>
<link href="c3_js/c3.css" rel="stylesheet">

<!-- Load d3.js and c3.js -->
<script src="https://d3js.org/d3.v5.min.js" charset="utf-8"></script>
<script src="c3_js/c3.min.js"></script>


</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<jsp:include page="menu.jsp" />
					<div class="clearfix"></div>
				</div>
			</div>
			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<div class="nav toggle">
						<a id="menu_toggle"><i class="fa fa-bars"></i></a>
					</div>
				</div>
			</div>
			<!-- /top navigation -->
			<!-- page content -->
			<div class="right_col" role="main">
				<div class="row">

					<div class="x_panel">
						<div class="x_title">
							<h2>
								Annual Prospectus Count <span id="cmp_header"></span>
							</h2>
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"><i
										class="fa fa-chevron-up"></i></a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<div id="chart"></div>


							<div style="display: none;" class="x_content" id="Graph_for_specific_topic">
								<h1>test</h1>
							</div>


						</div>
					</div>

				</div>
			</div>
		</div>




		<!-- footer content -->
		<footer> </footer>
		<!-- /footer content -->
	</div>
	</div>

	<!-- jQuery -->
	<script src="vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>

	<script src="build/js/custom.min.js"></script>
	<script src="js/d3.v4.min.js"></script>
	<script src="js/d3-selection-multi.v1.js"></script>
	<script src="js/TRDF_gt_vizSec51.js"></script>
	<script src="js/TNIC2_viz.js"></script>
	<script src="js/APP_viz.js"></script>

	<script src="js/jquery.auto-complete.min.js"></script>

	<script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script
		src="vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script
		src="vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>




</body>

<script>
	function sortNumber(a, b) {
		return a - b;
	}

	d3.json("rest/topic/prospectus/", function(error, data) {

		var topic = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];

		var new_arr = [];
		data.forEach(function(d) {
			//console.log(d);
			if (d[1] == '2002') {
				if (d[4] == 'w1') {
					topic[0] = topic[0] + parseFloat(d[3]);
					//console.log('d[1]=',d[1],'d[4]=',d[4],'d[3]=',d[3],'	topic[0]=',	topic[0]);
				} else if (d[4] == 'w2') {
					topic[1] = topic[1] + parseFloat(d[3]);
				} else if (d[4] == 'w3') {
					topic[2] = topic[2] + parseFloat(d[3]);
				} else if (d[4] == 'w4') {
					topic[3] = topic[3] + parseFloat(d[3]);
				} else if (d[4] == 'w5') {
					topic[4] = topic[4] + parseFloat(d[3]);
				}

				else if (d[4] == 'w6') {
					topic[5] = topic[5] + parseFloat(d[3]);
				} else if (d[4] == 'w7') {
					topic[6] = topic[6] + parseFloat(d[3]);
				} else if (d[4] == 'w8') {
					topic[7] = topic[7] + parseFloat(d[3]);
				} else if (d[4] == 'w9') {
					topic[8] = topic[8] + parseFloat(d[3]);
				} else if (d[4] == 'w10') {
					topic[9] = topic[9] + parseFloat(d[3]);
				} else if (d[4] == 'w11') {
					topic[10] = topic[10] + parseFloat(d[3]);
				} else if (d[4] == 'w12') {
					topic[11] = topic[11] + parseFloat(d[3]);
				} else if (d[4] == 'w13') {
					topic[12] = topic[12] + parseFloat(d[3]);
				} else if (d[4] == 'w14') {
					topic[13] = topic[13] + parseFloat(d[3]);
				} else if (d[4] == 'w15') {
					topic[14] = topic[14] + parseFloat(d[3]);
				} else if (d[4] == 'w16') {
					topic[15] = topic[15] + parseFloat(d[3]);
				} else if (d[4] == 'w17') {
					topic[16] = topic[16] + parseFloat(d[3]);
				} else if (d[4] == 'w18') {
					topic[17] = topic[17] + parseFloat(d[3]);
				} else if (d[4] == 'w19') {
					topic[18] = topic[18] + parseFloat(d[3]);
				} else if (d[4] == 'w20') {
					topic[19] = topic[19] + parseFloat(d[3]);
				} else if (d[4] == 'w21') {
					topic[20] = topic[20] + parseFloat(d[3]);
				} else if (d[4] == 'w22') {
					topic[21] = topic[21] + parseFloat(d[3]);
				} else if (d[4] == 'w23') {
					topic[22] = topic[22] + parseFloat(d[3]);
				} else if (d[4] == 'w24') {
					topic[23] = topic[23] + parseFloat(d[3]);
				} else if (d[4] == 'w25') {
					topic[24] = topic[24] + parseFloat(d[3]);
				} else if (d[4] == 'w26') {
					topic[25] = topic[25] + parseFloat(d[3]);
				} else if (d[4] == 'w27') {
					topic[26] = topic[26] + parseFloat(d[3]);
				} else if (d[4] == 'w28') {
					topic[27] = topic[27] + parseFloat(d[3]);
				} else if (d[4] == 'w29') {
					topic[28] = topic[28] + parseFloat(d[3]);
				} else if (d[4] == 'w30') {
					topic[29] = topic[29] + parseFloat(d[3]);
				}
			}

		});

		var chart = c3.generate({
			data : {
				columns : [
						[ '2002', topic[0], topic[1], topic[2], topic[3],
								topic[4], topic[5], topic[6], topic[7],
								topic[8], topic[9], topic[10], topic[11],
								topic[12], topic[13], topic[14], topic[15],
								topic[16], topic[17], topic[18], topic[19],
								topic[20], topic[21], topic[22], topic[23],
								topic[24], topic[25], topic[26], topic[27],
								topic[28], topic[29] ],

				],
				type : 'bar',
				groups : [ [ '2002' ] ],
				onclick : function(d, element) { //console.log("supun");
					showPidWhenGivenTopicAndYear(d, data);
				}
			},
			bindto : '#chart',
			grid : {
				y : {
					lines : [ {
						value : 0
					} ]
				}
			},
			axis : {
				x : {
					label : {
						text : 'topics',
						position : 'outer-middle',
					},
					type : 'category',
					categories : [ 'w1', 'w2', 'w3', 'w4', 'w5', 'w6', 'w7',
							'w8', 'w9', 'w10', 'w11', 'w12', 'w13', 'w14',
							'w15', 'w16', 'w17', 'w18', 'w19', 'w20', 'w21',
							'w22', 'w23', 'w24', 'w25', 'w26', 'w27', 'w28',
							'w29', 'w30' ]
				},
				tick : {
					x : {

						multiline : false,
						culling : {
							max : 1
						},
					},
					label : {
						text : 'topics',
						position : 'center-bottom',

					},
				},
				y : {
					label : {
						text : ' Sum of weights',
						position : 'outer-middle',
					},
					max : 33,
					min : 0,
					padding : {
						top : 0,
						bottom : 0
					}
				}
			}
		});

	});
	function showPidWhenGivenTopicAndYear(event_data, data) {

		var PidArray = [];
		var WeightAray = [ 'Weight-PID' ];
		var countPid = 0;
		console.log(data[0]);
		//console.log(event_data);
		data.forEach(function(d) {
			if (d[1] == event_data.id) {//compare year
				if (d[4] == 'w' + (event_data.index + 1)) {
					//console.log(d);
					PidArray[countPid] = d[4];
					WeightAray[countPid + 1] = parseFloat(d[3]);
					countPid++;

				}
			}
		})
		array = WeightAray.slice(1,WeightAray.length).sort();
console.log(array);
		var chart = c3.generate({
			data : {
				columns : [
					WeightAray,

				],
				type : 'bar',
				groups : [ [ 'Weight-PID' ] ]
			},
			bindto : '#Graph_for_specific_topic',
			grid : {
				y : {
					lines : [ {
						value : 0
					} ]
				}
			},
			axis : {
				x : {
					label : {
						text : 'topics',
						position : 'outer-middle',
					},
					type : 'category',
					categories : PidArray
				},
				tick : {
					x : {

						multiline : false,
						culling : {
							max : 1
						},
					},
					label : {
						text : 'PID',
						position : 'center-bottom',

					},
				},
				y : {
					label : {
						text : 'Weights',
						position : 'outer-middle',
					},
					max : array[array.length],
					min : 0,
					padding : {
						top : 0,
						bottom : 0
					}
				}
			}
		});

		var x = document.getElementById("Graph_for_specific_topic");
		if (x.style.display === "none") {
			x.style.display = "block";
		} else {
			x.style.display = "none";
		}

	}
</script>

</html>