<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Operations" %>
<%@ page import="model.Module" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Project" %>

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
	
	        <div class="content-wrapper pt-5">
	            <!-- Main content -->
	            <section class="content pt-2">
	                <div class="container-fluid mt-4">
	                    <div class="row">
	
	                        <!-- Start Listing modules -->
	                        <div class="col-md-4">
	                            <div class="card card-default">
	                                <div class="card-header mb-1">
	                                    <h3 class="card-title">
	                                        <i class="fa fa-book"></i>
	                                        Modules
	                                    </h3>
	                                </div>
	                                <% ArrayList<Module> modules = (ArrayList<Module>) session.getAttribute("modules"); %>
	
	                                <br>
	                                <c:forEach var="module" items="${modules}">
	                                    <div class="card-body pb-0 pt-1">
	                                        <div class="callout callout-info" style="padding-bottom: 6px;">
	                                            <form class="time" id="form-${module.id}" method="get" action="/project">
                                                    <input type="hidden" name="modules_id" value="${module.id}">
                                                    <input type="hidden" name="operation" value="<%= Operations.PROJECTS_BY_MODULE.ordinal() %>">
                                                    
                                                    <a href="#" class="text-primary" onclick="document.getElementById('form-${module.id}').submit(); return false;">
                                                        <h5><b>${module.name}</b></h5>
                                                    </a>
                                                </form>
	                                        </div>
	                                    </div>

                                        
	                                </c:forEach>
	                            </div>
	                        </div>
	                        <!-- End Listing modules -->
	
	
	
	                        <div class="col-md-8">
	                            <div class="card">
	                                <!-- Start Button for adding a project-->
	                                <button class="btn btn-default btn-lg" data-toggle="modal" data-target="#add-project"><i class="fa fa-plus-circle pr-2"></i><b>Add Project</b></button>
	                                <div class="modal fade" id="add-project">
	                                    <div class="modal-dialog modal-lg">
	                                        <div class="modal-content">
	                                            <div class="modal-header">
	                                                <h4 class="modal-title text-center"><i class="fa fa-plus-circle"></i> Add Project</h4>
	                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                                    <span aria-hidden="true">&times;</span>
	                                                </button>
	                                            </div>
	
	                                            <div class="modal-body">
	                                                <form class="form-horizontal" action="/project" method="post">
	                                                    <div class="form-group row">
	                                                        <label for="inputName" class="col-sm-3 col-form-label">Name</label>
	                                                        <div class="col-sm-9">
	                                                            <input type="text" required class="form-control" name="name" id="inputName" placeholder="Name">
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="form-group row">
	                                                        <label class="col-sm-3 col-form-label">Module</label>
	                                                        <div class="col-sm-9">
	                                                            <select name="modules_id" required class="form-control">
	                                                                <c:forEach var="module" items="${modules}">
	                                                                    <option value="${module.getId()}">${module.getName()}</option>
	                                                                </c:forEach>
	                                                            </select>
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="form-group row">
	                                                        <label for="completionDate" class="col-sm-3 col-form-label">Completion Date</label>
	                                                        <div class="col-sm-9">
	                                                            <input type="date" required class="form-control" name="completionDate" id="completionDate" placeholder="completion Date">
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="form-group row">
	                                                        <label for="intendedDate" class="col-sm-3 col-form-label">Intended Date</label>
	                                                        <div class="col-sm-9">
	                                                            <input type="date" required class="form-control" name="intendedDate" id="intendedDate" placeholder="Intended Completion Date">
	                                                        </div>
	                                                    </div>
	                                                    <input type="hidden" class="form-control" name="operation" id="operation" value="<%= Operations.CREATE.ordinal() %>">
	
	                                                    <div class="form-group row">
	                                                        <label for="inputExperience" class="col-sm-3 col-form-label">Description</label>
	                                                        <div class="col-sm-9">
	                                                            <textarea class="form-control" required name="description" id="inputExperience" placeholder="Description"></textarea>
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="mt-3 form-group row text-center">
	                                                        <div class="col-sm-12">
	                                                            <button type="submit" class="btn btn-info">Add</button>
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
	                                <!-- End Button for adding a project-->
	                            </div>
	                            <div class="card">
	
	                                <div class="card-header p-2">
	                                    <ul class="nav nav-pills">
	                                        <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">All Projects</a></li>
	                                        <li class="nav-item"><a class="nav-link" href="#timeline" data-toggle="tab">In Progress</a></li>
	                                        <li class="nav-item"><a class="nav-link" href="#settings" data-toggle="tab">Completed</a></li>
	                                    </ul>
	                                </div><!-- /.card-header -->
	
	                                <div class="card-body" style="padding-top: 0px; padding-left: 5px; padding-right: 5px;">
	                                    <div class="tab-content">
	                                        <div class="active tab-pane" id="activity">
	                                            <jsp:include page="resources/templates/allProjects.jsp" />
	                                        </div>
	                                        <!-- /.tab-pane -->
	                                        <div class="tab-pane" id="timeline">
	                                            <jsp:include page="resources/templates/uncompleteProjects.jsp" />
	                                        </div>
	                                        <!-- /.tab-pane -->
	
	                                        <div class="tab-pane" id="settings">
	                                            <jsp:include page="resources/templates/completeProjects.jsp" />
	                                        </div>
	                                        <!-- /.tab-pane -->
	                                    </div>
	                                    <!-- /.tab-content -->
	                                </div><!-- /.card-body -->
	
	                            </div>
	                        </div>
	
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