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

        .axis path,
        .axis line {
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
							<h2>Annual Prospectus Count <span id="cmp_header"></span></h2>
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"><i
										class="fa fa-chevron-up"></i></a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<div id="chart" > </div>
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
function sortNumber(a,b) {
    return a - b;
}


    d3.json("rest/topic/prospectus/", function(error, data) {
    	//y axis
        var y_2002=['2002'];
        var y_2003=['2003'];
        var y_2004=['2004'];
        var y_2005=['2005'];
        var y_2006=['2006'];
        var y_2007=['2007'];
        var y_2008=['2008'];
        
        //x axis
        var x_2002=['x_2002'];
        var x_2003=['x_2003'];
        var x_2004=['x_2004'];
        var x_2005=['x_2005'];
        var x_2006=['x_2006'];
        var x_2007=['x_2007'];
        var x_2008=['x_2008'];
        //x index count
        var x_index_2002=1;
        var x_index_2003=1;
        var x_index_2004=1;
        var x_index_2005=1;
        var x_index_2006=1;
	    var x_index_2007=1;
	    var x_index_2008=1; 
        var new_arr=[];
        data.forEach(function(d) {
        	console.log(d);
        	if(d[1]=='2002'){
        		x_2002[x_index_2002]=d[4];
        		y_2002[x_index_2002]=d[3];
        		x_index_2002++;
            	}
        	else if(d[1]=='2003'){
        		x_2003[x_index_2003]=d[4];
        		y_2003[x_index_2003]=d[3];
        		x_index_2003++;
            	}
        	else if(d[1]=='2004'){
        		x_2004[x_index_2004]=d[4];
        		y_2004[x_index_2004]=d[3];
        		x_index_2004++;
        		}
        	else if(d[1]=='2005'){
        		x_2005[x_index_2005]=d[4];
        		y_2005[x_index_2005]=d[3];
        		x_index_2005++;
            	}
        	else if(d[1]=='2006'){
        		x_2006[x_index_2006]=d[4];
        		y_2006[x_index_2006]=d[3];
        		x_index_2006++;
            	}
        	else if(d[1]=='2007'){
        		x_2007[x_index_2007]=d[4];
        		y_2007[x_index_2007]=d[3];
        		x_index_2007++;
            	}
        	else if(d[1]=='2008'){
        		x_2008[x_index_2008]=d[4];
        		y_2008[x_index_2008]=d[3];
        		x_index_2008++;
            	}
        	
        });
        console.log('y_2002',y_2002.length);
        console.log('x_2002',x_2002);
        array = y_2002.slice(1,y_2002.length).sort();
        console.log('array',array);
    var x=['supun',50,40,30,30,30,40,50]
    var y=['nadun',50,40,30,30,30,40,50]
        var chart = c3.generate({
            data: {
                xs :{
                	'data1': 'x1',
                    'data2': 'x2',
                    },
                columns: [
                	['x1', 'a', 'b', 'c', 'd', 'e', 'f'],
                    ['x2', 'g', 'h', 'i', 'j', 'k'],
                    ['data1', 30, 200, 100, 400, 150, 250],
                    ['data2', 20, 180, 240, 100, 190]
              
                ],
                type: 'bar'
            },
            bar: {
                width: {
                    ratio: 0.5 // this makes bar width 50% of length between ticks
                }
                // or
                //width: 100 // this makes bar width 100px
            }
          
        });


        

    });
    
</script>

</html>