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
                <li class="nav-item has-treeview menu-closed">
			        <a href="#" class="nav-link active">
			          <i class="nav-icon fas fa-tachometer-alt"></i>
			          <p>
			            Dashboard
			          </p>
			        </a>
			        <ul class="nav nav-treeview">
			        </ul>
			    </li>
			    
                <li class="nav-item has-treeview menu-closed">
		        <a href="#" class="nav-link">
		          <i class="nav-icon fas fa-th-large"></i>
		          <p>
		            Module
		            <i class="right fas fa-angle-left"></i>
		          </p>
		        </a>
        <ul class="nav nav-treeview">
          <li class="nav-item pt-2">
          	<form action="/module" method="get" id="my_form">
				<!-- Your Form --> 

				
				<input type="hidden" name="operation" value="<%= Operations.CREATE.ordinal() %>"> 
				<a class="pl-3" href="javascript:{}" onclick="document.getElementById('my_form').submit(); return false;"><i class="far fa-circle nav-icon"></i>
              		<p class="d-inline">add module</p>
              	</a>
			</form>
          </li>
          <li class="nav-item pt-2">
          	<form action="/module" method="post" id="">
				<!-- Your Form --> 
				
				<input type="hidden" name="operation" value="<%= Operations.VIEW.ordinal() %>"> 
				<a class="pl-3" href="javascript:{}" onclick="document.getElementById('my_form').submit(); return false;"><i class="far fa-circle nav-icon"></i>
              		<p class="d-inline">view module</p>
              	</a>
			</form>
          </li>
        </ul>
    </li>
    
    <li class="nav-item has-treeview menu-closed">
        <a href="#" class="nav-link">
          <i class="nav-icon fa fa-book"></i>
          <p>
            Coursework Project
            <i class="right fa fa-angle-left"></i>
          </p>
        </a>
        <ul class="nav nav-treeview ">
          <li class="nav-item pt-2">
            <form action="/project" method="get" id="add_project">
				<!-- Your Form --> 
				
				<input type="hidden" name="operation" value="<%= Operations.CREATE.ordinal() %>"> 
				<a class="pl-3" href="javascript:{}" onclick="document.getElementById('add_project').submit(); return false;"><i class="far fa-circle nav-icon"></i>
              		<p class="d-inline">add coursework project <%= Operations.CREATE.ordinal() %></p>
              	</a>
			</form>
          </li>
          <li class="nav-item pt-2">
            <form action="/project" method="get" id="view_project">
				<!-- Your Form --> 
				
				<input type="hidden" name="operation" value="<%= Operations.VIEW.ordinal() %>"> 
				<a class="pl-3" href="javascript:{}" onclick="document.getElementById('view_project').submit(); return false;"><i class="far fa-circle nav-icon"></i>
              		<p class="d-inline">view coursework project</p>
              	</a>
			</form>
          </li>
        </ul>
      </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
