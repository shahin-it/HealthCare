<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Welcome to HELTH::CARE"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="vendor/jquery-ui.css"/>
    <asset:stylesheet src="vendor/bootstrap.min.css"/>
    <asset:stylesheet src="vendor/styles.css"/>
    <asset:stylesheet src="vendor/dataTables.bootstrap.css"/>
    %{--<asset:stylesheet src="application.css"/>--}%
    <asset:javascript src="vendor/jquery-2.2.0.min.js"/>
    <asset:javascript src="vendor/jquery-ui.js"/>
    <asset:javascript src="vendor/bootstrap.min.js"/>
    <asset:javascript src="vendor/jquery.dataTables.min.js"/>
    <asset:javascript src="vendor/dataTables.bootstrap.js"/>
    <asset:javascript src="custom.js"/>
    <g:layoutHead/>
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="header">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <!-- Logo -->
                <div class="logo">
                    <h1><a href="index.html">Bootstrap Admin Theme</a></h1>
                </div>
            </div>

            <div class="col-md-5">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="input-group form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-primary" type="button">Search</button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-2">
                <div class="navbar navbar-inverse" role="banner">
                    <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Account <b
                                        class="caret"></b></a>
                                <ul class="dropdown-menu animated fadeInUp">
                                    <li><a href="profile.html">Profile</a></li>
                                    <li><g:link controller="dashboard" action="doLogout">Logout</g:link></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="page-content">
    <div class="row">
        <div class="col-md-2">
            <div class="sidebar content-box" style="display: block;">
                <ul class="nav">
                    <!-- Main menu -->
                    <li class="${dashboard}"><g:link controller="dashboard" action="controlPanel"><i class="glyphicon glyphicon-home"></i> Dashboard</g:link></li>
                    <li class="${pathology}"><g:link controller="page" action="pathology"><i class="glyphicon glyphicon-calendar"></i> Pathology</g:link></li>
                    <li class=""><a href="stats.html"><i class="glyphicon glyphicon-stats"></i> Statistics (Charts)</a></li>
                    <li class=""><a href="tables.html"><i class="glyphicon glyphicon-list"></i> Tables</a></li>
                    <li class=""><a href="buttons.html"><i class="glyphicon glyphicon-record"></i> Buttons</a></li>
                    <li class=""><a href="editors.html"><i class="glyphicon glyphicon-pencil"></i> Editors</a></li>
                    <li class=""><a href="forms.html"><i class="glyphicon glyphicon-tasks"></i> Forms</a></li>
                    <li class="submenu">
                        <a href="#">
                            <i class="glyphicon glyphicon-list"></i> Pages
                            <span class="caret pull-right"></span>
                        </a>
                        <!-- Sub menu -->
                        <ul>
                            <li><a href="login.html">Login</a></li>
                            <li><a href="signup.html">Signup</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <g:layoutBody/>
    </div>
</div>

<footer>
    <div class="container">

        <div class="copy text-center">
            Copyright &copy; 2018 <a href='https://www.fb.com/shahin31' target="_blank">Shahin</a>
        </div>

    </div>
</footer>
</body>
</html>
