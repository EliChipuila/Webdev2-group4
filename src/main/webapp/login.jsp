<%--
  Created by IntelliJ IDEA.
  User: ticio
  Date: 28/11/2019
  Time: 23:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>login</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="resources/dist/css/icheck-bootstrap.min.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="resources/dist/css/adminlte.min.css" type="text/css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    </head>

    <body class="hold-transition login-page">
        <div class="login-box">
        <div class="login-logo">
            <a href=""><b>Elimu</b></a>
        </div>
        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">Sign in to start your session</p>

                <form action="\login" method="post">
                    <div class="input-group mb-3">
                        <input type="email" name="email" class="form-control" placeholder="Email">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" name="password" class="form-control" placeholder="Password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row text-center">
                        <!-- /.col -->
                        <div class="col">
                            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>

                <p class="mb-0">
                    <a href="/register" class="text-center">I don't have an account! <b>register</b></a>
                </p>
            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
    <!-- /.login-box -->

    <!-- jQuery -->
    <script src="resources/dist/js/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="resources/dist/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="resources/dist/js/adminlte.min.js"></script>

    </body>
</html>
