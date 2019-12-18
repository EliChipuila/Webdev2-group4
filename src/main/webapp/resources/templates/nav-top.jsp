<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="/dashboard" class="nav-link">Dashboard</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="/module" class="nav-link">Modules</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="/project" class="nav-link">Coursework Project</a>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        
        <li class="nav-item">
            <form action="/logout" method="post" id="logout">
            </form>

            <a href="#" onclick="document.getElementById('logout').submit(); return false;" class="nav-link" >
                <b>Logout</b>
                <i class="ml-1 fa fa-power-off"></i>
            </a>
        </li>
    </ul>
</nav>
<!-- /.navbar -->