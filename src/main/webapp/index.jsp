<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Operations" %>

<html lang="en">
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta http-equiv="x-ua-compatible" content="ie=edge">
	
	    <title>Elimu</title>
	
	    <!-- Font Awesome Icons -->
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
	    <!-- overlayScrollbars -->
	    <link rel="stylesheet" href="resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
	    <!-- Theme style -->
	    <link rel="stylesheet" href="resources/dist/css/adminlte.min.css">
	    <!-- Google Font: Source Sans Pro -->
	    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	</head>
	
	<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
	    <div class="wrapper">
			<jsp:include page="resources/templates/nav-top.jsp" />
	        <!-- Content Wrapper. Contains page content -->
	        
			<!-- Including n-->
			<jsp:include page="resources/templates/nav-left.jsp" />
			
	        <div class="content-wrapper">
	        <!-- Main content -->
	    		 <!-- Main content -->
    <section class="content" style="padding-top: 16px;">
      <div class="container-fluid">
        <!-- Info boxes -->
        <div class="row">
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-cog"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Nº of Modules</span>
                <span class="info-box-number">
                  10
                  <small></small>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-thumbs-up"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Nº of Finished Projects</span>
                <span class="info-box-number">41</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>
	          <div class="col-12 col-sm-6 col-md-3">
	            <div class="info-box mb-3">
	              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>
	              <div class="info-box-content">
	                <span class="info-box-text">Nº Unfinished Projects</span>
	                <span class="info-box-number">76</span>
	              </div>
	            </div>
	          </div>

	          <div class="col-12 col-sm-6 col-md-3">
	            <div class="info-box mb-3">
	              <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users"></i></span>
	
	              <div class="info-box-content">
	                <span class="info-box-text">Nº of Milestones</span>
	                <span class="info-box-number">20</span>
	              </div>
	            </div>
	          </div>
	        </div>
	
		       	<div class="row">
		          <div class="col-md-12">
		            <div class="card">
		              <div class="card-header">
		                <h5 class="card-title">Monthly Recap Report</h5>
		
		                <div class="card-tools">
		                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
		                    <i class="fas fa-minus"></i>
		                  </button>
		                  <div class="btn-group">
		                    <button type="button" class="btn btn-tool dropdown-toggle" data-toggle="dropdown">
		                      <i class="fas fa-wrench"></i>
		                    </button>
		                    <div class="dropdown-menu dropdown-menu-right" role="menu">
		                      <a href="#" class="dropdown-item">Action</a>
		                      <a href="#" class="dropdown-item">Another action</a>
		                      <a href="#" class="dropdown-item">Something else here</a>
		                      <a class="dropdown-divider"></a>
		                      <a href="#" class="dropdown-item">Separated link</a>
		                    </div>
		                  </div>
		                  <button type="button" class="btn btn-tool" data-card-widget="remove">
		                    <i class="fas fa-times"></i>
		                  </button>
		                </div>
		              </div>
		              <!-- /.card-header -->
		              <div class="card-body">
		                <div class="row">
		                  <div class="col-md-8">
		                    <p class="text-center">
		                      <strong>Sales: 1 Jan, 2014 - 30 Jul, 2014</strong>
		                    </p>
		
		                    <div class="chart">
		                      <!-- Sales Chart Canvas -->
		                      <canvas id="salesChart" height="180" style="height: 180px;"></canvas>
		                    </div>
		                    <!-- /.chart-responsive -->
		                  </div>
		                  <!-- /.col -->
		                  <div class="col-md-4">
		                    <p class="text-center">
		                      <strong>Goal Completion</strong>
		                    </p>
		
		                    <div class="progress-group">
		                      Modules
		                      <span class="float-right"><b>160</b>/200</span>
		                      <div class="progress progress-sm">
		                        <div class="progress-bar bg-primary" style="width: 80%"></div>
		                      </div>
		                    </div>
		                    <!-- /.progress-group -->
		
		                    <div class="progress-group">
		                      Projects: Comp/Total
		                      <span class="float-right"><b>310</b>/400</span>
		                      <div class="progress progress-sm">
		                        <div class="progress-bar bg-danger" style="width: 75%"></div>
		                      </div>
		                    </div>
		
		                    <!-- /.progress-group -->
		                    <div class="progress-group">
		                      <span class="progress-text">Milestones: Comp/Total</span>
		                      <span class="float-right"><b>480</b>/800</span>
		                      <div class="progress progress-sm">
		                        <div class="progress-bar bg-success" style="width: 60%"></div>
		                      </div>
		                    </div>
		
		                    <!-- /.progress-group -->
		                    
		                    <!-- /.progress-group -->
		                  </div>
		                  <!-- /.col -->
		                </div>
		                <!-- /.row -->
		              </div>
		              <!-- ./card-body -->
		              <div class="card-footer">
		                <div class="row">
		                  <div class="col-sm-3 col-6">
		                    <div class="description-block border-right">
		                      <span class="description-percentage text-success"><i class="fas fa-caret-up"></i> 17%</span>
		                      <h5 class="description-header">$35,210.43</h5>
		                      <span class="description-text">TOTAL REVENUE</span>
		                    </div>
		                    <!-- /.description-block -->
		                  </div>
		                  <!-- /.col -->
		                  <div class="col-sm-3 col-6">
		                    <div class="description-block border-right">
		                      <span class="description-percentage text-warning"><i class="fas fa-caret-left"></i> 0%</span>
		                      <h5 class="description-header">$10,390.90</h5>
		                      <span class="description-text">TOTAL COST</span>
		                    </div>
		                    <!-- /.description-block -->
		                  </div>
		                  <!-- /.col -->
		                  <div class="col-sm-3 col-6">
		                    <div class="description-block border-right">
		                      <span class="description-percentage text-success"><i class="fas fa-caret-up"></i> 20%</span>
		                      <h5 class="description-header">$24,813.53</h5>
		                      <span class="description-text">TOTAL PROFIT</span>
		                    </div>
		                    <!-- /.description-block -->
		                  </div>
		                  <!-- /.col -->
		                  <div class="col-sm-3 col-6">
		                    <div class="description-block">
		                      <span class="description-percentage text-danger"><i class="fas fa-caret-down"></i> 18%</span>
		                      <h5 class="description-header">1200</h5>
		                      <span class="description-text">GOAL COMPLETIONS</span>
		                    </div>
		                    <!-- /.description-block -->
		                  </div>
		                </div>
		                <!-- /.row -->
		              </div>
		              <!-- /.card-footer -->
		            </div>
		            <!-- /.card -->
		          </div>
	
	        </div>
	        <!-- /.row -->
	    </section class="pt-5">
    <!-- /.content -->
	        <!-- Including Footer -->
			<jsp:include page="resources/templates/footer.jsp" />
	    </div>
	    <!-- ./wrapper -->
	
	    <!-- REQUIRED SCRIPTS -->
	    <!-- jQuery -->
	    <script src="resources/plugins/jquery/jquery.min.js"></script>
	    <!-- Bootstrap -->
	    <script src="resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	    <!-- overlayScrollbars -->
	    <script src="resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	    <!-- AdminLTE App -->
	    <script src="resources/dist/js/adminlte.js"></script>
	
	    <!-- OPTIONAL SCRIPTS -->
	    <script src="resources/dist/js/demo.js"></script>
	
	    <!-- PAGE PLUGINS -->
	    <!-- jQuery Mapael -->
	    <script src="resources/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
	    <script src="resources/plugins/raphael/raphael.min.js"></script>
	    <script src="resources/plugins/jquery-mapael/jquery.mapael.min.js"></script>
	    <script src="resources/plugins/jquery-mapael/maps/usa_states.min.js"></script>
	    <!-- ChartJS -->
	    <script src="resources/plugins/chart.js/Chart.min.js"></script>
		
	    <!-- PAGE SCRIPTS -->
	    <script src="resources/dist/js/pages/dashboard2.js"></script>
	</body>

</html>