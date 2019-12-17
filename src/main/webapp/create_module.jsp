<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Operations" %>
<%@ page import="model.Module" %>
<%@ page import="java.util.ArrayList" %>

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
	    <section class="content pt-3">
	      <div class="container-fluid pt-5">
	          <div class="row">
	        	<div class="col-md-8">
	            	<div class="card">
				    	<div class="card-header p-2">
				        	<ul class="nav nav-pills">
				            	<li class="nav-item"><a class="nav-link" style="    float: left;font-size: 1.1rem;font-weight: 400;margin: 0;" href="#settings" data-toggle="tab">Add module</a></li>
				        	</ul>
				    	</div><!-- /.card-header -->
				    	<div class="card-body">
				        	<div class="tab-content">
				            	<div class="active tab-pane" id="settings">
				                	<form class="form-horizontal" action="/module" method="post">
				                    	<div class="form-group row">
				                        	<label for="inputName" class="col-sm-2 col-form-label">Name</label>
				                        	<div class="col-sm-10">
				                            	<input type="text" class="form-control" name="name" id="inputName" placeholder="Name" required>
				                        	</div>
				                    	</div>
				                    	
				                    	<%! Operations operation = Operations.CREATE; %>
				                    	
				                    	<input type="hidden" class="form-control" name="operation" id="operation" value="<%= operation.ordinal() %>">
				                  		
				                    	<div class="form-group row">
				                        	<label for="inputExperience" class="col-sm-2 col-form-label">Description</label>
				                        	<div class="col-sm-10">
				                            	<textarea class="form-control" name="description" id="inputExperience" placeholder="Description" required></textarea>
				                        	</div>
				                   	 	</div>
				                   
				                    <div class="form-group row">
				                        <div class="offset-sm-2 col-sm-10">
				                         	<button type="submit" class="btn btn-info">Submit</button>
				                        	<button type="reset" class="btn btn-danger">Cancel</button>
				                        </div>
				                    </div>
				                </form>
				            </div>
				            <!-- /.tab-pane -->
				        </div>
				        <!-- /.tab-content -->
				    </div><!-- /.card-body -->
				</div>
	          </div>

	          <div class="col-md-4">
	          	<div class="card card-default">
                    	<div class="card-header mb-1">
					        <h3 class="card-title">
					            <i class="fa fa-bookmark"></i>
					            Modules
					        </h3>
					    </div>
				    	
				    	<% ArrayList<Module> modules = (ArrayList<Module>) session.getAttribute("modules"); %>
										    	
				    	<c:forEach var="module" items="${modules}">
				    		<div class="card-body pb-0 pt-1">
					    		<div class="callout callout-danger">
					    			<form class="time" id="form-${module.id}" method="get" action="/project">
				                        <input type="hidden" name="modules_id" value="${module.id}">
				                        <input type="hidden" name="operation" value="<%= Operations.PROJECTS_BY_MODULE.ordinal() %>">
				                        
				                        <a href="#" class="text-primary" onclick="document.getElementById('form-${module.id}').submit(); return false;">
						            		<h5><b>${module.name}</b></h5>
									    </a>
				                    </form>

						            <p>${module.description}</p>
						            
						            <div style="display: block; position: relative;">
							            <div class="btn-group btn-group-sm pull-right" style="float: right; clear: both; bottom: 16px;">
					                        
					                        <div class="modal fade" id="edit-modal-sm${module.id}">
										        <div class="modal-dialog">
										          <div class="modal-content">
										            <div class="modal-header">
										              <h4 class="modal-title text-center"><i class="fa fa-edit"></i> Edit Module</h4>
										              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
										                <span aria-hidden="true">&times;</span>
										              </button>
										            </div>
										            <div class="modal-body">
										              <form class="form-horizontal" action="/module" method="post">
									                    	<div class="form-group row">
									                        	<label for="inputName" class="col-sm-3 col-form-label">Name</label>
									                        	<div class="col-sm-9">
									                            	<input type="text" class="form-control" name="name" id="inputName" placeholder="Name" value="${module.name}">
									                        	</div>
									                    	</div>
									                    	
									                    	<input type="hidden" class="form-control" name="id" id="id" value="${module.id}">
									                    	<input type="hidden" class="form-control" name="operation" id="operation" value="<%= Operations.UPDATE.ordinal() %>">
									                  		
									                    	<div class="form-group row">
									                        	<label for="inputExperience" class="col-sm-3 col-form-label">Description</label>
									                        	<div class="col-sm-9">
									                            	<textarea class="form-control" name="description" id="inputExperience" placeholder="Description">${module.description}</textarea>
									                        	</div>
									                   	 	</div>
									                   
									                    <div class="mt-3 form-group row text-center">
									                        <div class="col-sm-12">
									                         	<button type="submit" class="btn btn-info">Update</button>
									                        	 <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
									                        </div>
									                    </div>
									                </form>
										            </div>
										          </div>
										          <!-- /.modal-content -->
										        </div>
										        <!-- /.modal-dialog -->
										      </div>
										      <!-- /.modal -->
										      
					                        <a href="#" class="btn btn-info" data-toggle="modal" data-target="#edit-modal-sm${module.id}"><i class="fa fa-edit" style="color: #fff !important"></i></a>
					                        
					                        <form action="/module" method="post" id="remove-pr${module.id}">
	                                            <input type="hidden" name="operation" value="<%= Operations.REMOVE.ordinal() %>">
	                                            <input type="hidden" name="module_id" value="${module.id}">
	                                        </form>

					                        <a href="#" onclick="document.getElementById('remove-pr${module.id}').submit(); return false;" class="btn btn-danger" ><i class="fas fa-trash" style="color: #fff !important"></i></a>
					                    </div>
				                    </div>
						        </div>
					        </div>
				    	</c:forEach>

				    	
				    <!-- /.card-body -->
				</div>
	          </div>
	          <!-- /.col -->
	        </div>
	        <!-- /.row -->
	      </div><!-- /.container-fluid -->
	    </section>
	    <!-- /.content -->
	        </div>
	        <!-- /.content-wrapper -->
			
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