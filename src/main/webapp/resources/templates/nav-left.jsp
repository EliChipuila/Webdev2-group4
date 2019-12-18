<%@page import="java.rmi.server.Operation"%>
<%@ page import="model.User" %>
<%@ page import="model.Operations" %>

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" style="color: white" class="text-center brand-link">
        <span class="brand-text font-weight-light"><b>Elimu</b></span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img style="border: 2px solid rgb(90,90,90); padding: 3px; border-radius: 50%;" src="https://img.icons8.com/plasticine/100/000000/user-male.png">
            </div>
            <div class="info">
            	<% User user = (User) session.getAttribute("user"); %>
                <a href="#" class="d-block">${user.name}</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false"> 
                <li class="nav-item">
			        <a href="dashboard" class="nav-link">
			          <i class="nav-icon fas fa-tachometer-alt"></i>
			          <p>
			            Dashboard
			          </p>
			        </a>
			    </li>
			    
			    <li class="nav-item">
			        <a href="module" class="nav-link">
			          <i class="nav-icon fas fa-th-large"></i>
			          <p>
			            Modules
			          </p>
			        </a>
			    </li>
			    
			    <li class="nav-item">
			        <a href="project" class="nav-link">
			          <i class="nav-icon fa fa-bookmark"></i>
			          <p>
			            Coursework Project
			          </p>
			        </a>
			    </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
