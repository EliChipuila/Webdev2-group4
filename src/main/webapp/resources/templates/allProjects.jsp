<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Operations" %>
<%@ page import="model.Project" %>

<table class="table projects table-inverse">
    <thead>
        <tr>
            <th style="width: 20%">
                Name
            </th>

            <th style="width: 30%">
                Description
            </th>

            <th style="width: 17%">
                Milestones
            </th>
            <th style="width: 16.5%">
                Deadline
            </th>
            <th style="width: 14.5%" class="text-center">
                My Date
            </th>
            <th style="width: 4%">
            </th>
        </tr>
    </thead>
    <tbody>

        <c:forEach var="project" items="${projects}">
            <tr>
                <td>
                    <p>${project.name}</p>
                </td>
                <td style="font-size: 12px">
                    ${project.description}
                </td>

                <td style="font-size: 14px">
                    <a href="#" class="d-block text-center" data-toggle="modal" data-target="#milestone-modal1-${project.id}"><i class="fa fa-plus-circle"></i> add / view</a>

                    <div class="modal fade" id="milestone-modal1-${project.id}">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title text-center"><i class="fa fa-tasks"></i> Project Milestones</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" style="padding: 0">
                                    <div class="card" style="margin-bottom: 0;">
                                        <div class="card-header p-2">
                                            <ul class="nav nav-pills">
                                                <li class="nav-item"><a class="nav-link active" href="#add-milestone1${project.id}" data-toggle="tab"><i class="fa fa-plus-circle pr-2"></i> Add</a></li>
                                                <li class="nav-item"><a class="nav-link" href="#in-progress1${project.id}" data-toggle="tab">In progress</a></li>
                                                <li class="nav-item"><a class="nav-link" href="#milestone-ended1${project.id}" data-toggle="tab">Finished</a></li>
                                            </ul>
                                        </div>

                                        <div class="card-body">
                                            <div class="tab-content">
                                                <div class="active tab-pane" id="add-milestone1${project.id}">
                                                    <form class="form-horizontal" method="post" action="/milestone">
                                                        <div class="form-group row">
                                                            <label for="inputName" class="col-sm-2 col-form-label">Milestone Name</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" required name="name" class="form-control" id="inputName" placeholder="Name">
                                                            </div>
                                                        </div>

                                                        <input type="hidden" name="operation" value="<%= Operations.CREATE.ordinal() %>" class="form-control">

                                                        <input type="hidden" name="project_id" value="${project.getId()}" class="form-control" id="inputName" placeholder="Name">

                                                        <div class="form-group row">
                                                            <label for="inputName" class="col-sm-2 col-form-label">Completion Date</label>
                                                            <div class="col-sm-10">
                                                                <input type="date" required class="form-control" id="inputName" name="completionDate">
                                                            </div>
                                                        </div>

                                                        <div class="form-group row">
                                                            <div class="offset-sm-2 col-sm-10">
                                                                <button type="submit" class="btn btn-info">Create</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>

                                                <div class="tab-pane" id="in-progress1${project.id}">
                                                    <div class="timeline timeline-inverse">
                                                        <c:forEach var="milestone" items="${milestones}">
                                                            <c:if test="${milestone.projects_id == project.getId()}">
                                                                <c:if test="${milestone.completed != 1}">
                                                                    <div class="time-label">
                                                                        <span class="bg-danger">
                                                                            ${milestone.completionDate}
                                                                        </span>
                                                                    </div>

                                                                    <div>
                                                                        <i class="fas fa-tasks bg-primary"></i>


                                                                        <div class="timeline-item">
                                                                            <form class="time" method="post" action="/milestone">
                                                                                <input type="hidden" name="milestone_id" value="${milestone.id}">
                                                                                <input type="hidden" name="operation" value="<%= Operations.REMOVE.ordinal() %>">
                                                                                <button class="btn btn-danger btn-sm">
                                                                                    <i class="fas fa-trash" style="color: #fff !important"></i>
                                                                                </button>
                                                                            </form>
                                                                            <h3 class="timeline-header">
                                                                                ${milestone.name}
                                                                            </h3>
                                                                            <div class="timeline-footer py-0 my-0">
                                                                                <div class="form-group row py-0 my-0">
                                                                                    <div class="form-group row py-0 my-0">
                                                                                        <form action="/milestone" method="post" id="mlstone-updated${milestone.id}">
                                                                                            <div class="custom-control custom-checkbox">
                                                                                                <input type="hidden" name="milestone_id" value="${milestone.id}">
                                                                                                <input type="hidden" name="operation" value="<%= Operations.UPDATE.ordinal() %>">
                                                                                                <input class="custom-control-input" required onclick="document.getElementById('mlstone-updated${milestone.id}').submit(); return false;" type="checkbox" name="completed" id="customCheckbox${milestone.id}" value="1">
                                                                                                <label style="padding-top: 3px;" for="customCheckbox${milestone.id}" class="custom-control-label">Mark as completed</label>
                                                                                            </div>
                                                                                        </form>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>


                                                                </c:if>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </div>

                                                <div class="tab-pane" id="milestone-ended1${project.id}">
                                                    <div class="timeline timeline-inverse">
                                                        <c:forEach var="milestone" items="${milestones}">
                                                            <c:if test="${milestone.projects_id == project.getId()}">
                                                                <c:if test="${milestone.completed == 1}">
                                                                    <div class="time-label">
                                                                        <span class="bg-danger">
                                                                            ${milestone.completionDate}
                                                                        </span>
                                                                    </div>

                                                                    <div>
                                                                        <i class="fas fa-tasks bg-primary"></i>

                                                                        <div class="timeline-item">
                                                                            <form class="time" method="post" action="/milestone">
                                                                                <input type="hidden" name="milestone_id" value="${milestone.id}">
                                                                                <input type="hidden" name="operation" value="<%= Operations.REMOVE.ordinal() %>">
                                                                                <button class="btn btn-danger btn-sm">
                                                                                    <i class="fas fa-trash" style="color: #fff !important"></i>
                                                                                </button>
                                                                            </form>
                                                                            <h3 class="timeline-header">${milestone.name}</h3>
                                                                        </div>
                                                                    </div>


                                                                </c:if>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.tab-content -->
                                        </div><!-- /.card-body -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>

                <td style="font-size: 12px">
                    <!-- <p class="mb-0" style="border-bottom: 1px solid rgba(0,0,0,.5)"><b>Due date:</b></p> -->
                    <p class="mt-0">${project.completionDate}</p>
                </td>

                <td style="font-size: 12px">
                    <!-- <p class="mb-0" style="border-bottom: 1px solid rgba(0,0,0,.5)"><b>Intended date:</b></p> -->
                    <p class="mt-0">${project.intendedDate}</p>
                </td>

                <td class="project-actions text-right">

                    <div class="modal fade" id="edit-modal1-sm${project.id}">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title text-center"><i class="fa fa-edit"></i> Edit Project</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal text-left" action="/project" method="post">
                                        <div class="form-group row">
                                            <label for="inputName" class="col-sm-3 col-form-label">Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" name="name" id="inputName" placeholder="Name" value="${project.name}">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Module</label>
                                            <div class="col-sm-9">
                                                <select name="modules_id" class="form-control">
                                                    <c:forEach var="module" items="${modules}">
                                                        <c:if test="${project.modules_id == module.getId()}">
                                                            <option selected value="${module.getId()}">${module.getName()}</option>
                                                        </c:if>
                                                        <c:if test="${project.modules_id != module.getId()}">
                                                            <option value="${module.getId()}">${module.getName()}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="completionDate" class="col-sm-3 col-form-label">Completion Date</label>
                                            <div class="col-sm-9">
                                                <input type="date" required class="form-control" value="${project.getCompletionDate()}" name="completionDate" id="completionDate" placeholder="completion Date">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="intendedDate" class="col-sm-3 col-form-label">Intended Date</label>
                                            <div class="col-sm-9">
                                                <input type="date" required class="form-control" value="${project.getIntendedDate()}" name="intendedDate" id="intendedDate" placeholder="Intended Completion Date">
                                            </div>
                                        </div>
                                        <input type="hidden" class="form-control" name="operation" id="operation" value="<%= Operations.UPDATE.ordinal() %>">

                                        <input type="hidden" class="form-control" name="project_id" id="operation" value="${project.id}">


                                        <div class="form-group row">
                                            <label for="inputExperience" class="col-sm-3 col-form-label">Description</label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" required name="description" id="inputExperience" placeholder="Description">${project.description}</textarea>
                                            </div>
                                        </div>


                                        <style>
                                            .custom-control-label::before {
                                                left: -33px;
                                            }

                                            .custom-control-label::after {
                                                left: -33px;
                                            }
                                        </style>
                                        <!-- checkbox -->
                                        <div class="form-group row">
                                            <div class="offset-sm-3 col-sm-9 custom-control custom-checkbox">
                                                <input class="custom-control-input" type="checkbox" name="completed" id="customCheckbox0{project.id}" value="1" checked>
                                                <label for="customCheckbox0{project.id}" class="custom-control-label">Mark as completed</label>
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
                    </div>
                    <!-- /.modal -->

                    <div class="btn-group btn-group-sm">
                        <a href="#" class="btn btn-info btn-sm" data-toggle="modal" data-target="#edit-modal1-sm${project.id}"><i class="fa fa-edit" style="color: #fff !important"></i></a>

                        <form action="/project" method="post" id="remove-pr${project.id}">
                            <input type="hidden" name="operation" value="<%= Operations.REMOVE.ordinal() %>">
                            <input type="hidden" name="project_id" value="${project.id}">
                        </form>

                        <a href="#" onclick="document.getElementById('remove-pr${project.id}').submit(); return false;" class="btn btn-danger"><i class="fas fa-trash" style="color: #fff !important"></i></a>
                    </div>
                </td>

            </tr>
        </c:forEach>
    </tbody>
</table>