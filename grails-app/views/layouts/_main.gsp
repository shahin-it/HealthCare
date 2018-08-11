<%@ page import="com.healthcare.DomainConstant; com.healthcare.util.AppUtil" %>
<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>HEALTHCARE <g:layoutTitle/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="vendor/fontawesome/all.min.css"/>
    <asset:stylesheet src="vendor/jquery-ui.css"/>
    <asset:stylesheet src="vendor/bootstrap.min.css"/>
    <asset:stylesheet src="vendor/bootstrap-datepicker3.standalone.min.css"/>
    <asset:stylesheet src="vendor/styles.css"/>
    <asset:stylesheet src="admin.css"/>
    %{--<asset:stylesheet src="application.css"/>--}%

    <script type="text/javascript">
        var app = {
            base: '${AppUtil.baseUrl}',
            maxResult: ${DomainConstant.MAX_RESULT},
            tab: {},
            dateFormat: 'dd-mm-yyyy',
            timeFormat: 'hh:mm:ss a',
        }
    </script>

    <asset:javascript src="vendor/jquery-3.3.1.min.js"/>
    <asset:javascript src="vendor/jquery.form.min.js"/>
    <asset:javascript src="vendor/jquery-ui.js"/>
    <asset:javascript src="vendor/bootstrap.min.js"/>
    <asset:javascript src="vendor/bootstrap-notify.min.js"/>
    <asset:javascript src="vendor/bootstrap-datepicker.min.js"/>
    <asset:javascript src="vendor/sweetalert2.js"/>
    <asset:javascript src="vendor/jquery.twbsPagination.min.js"/>
    <asset:javascript src="skui/utility.js"/>
    <asset:javascript src="skui/common-ui.js"/>
    <asset:javascript src="skui/table.js"/>
    <asset:javascript src="admin.js"/>
    <g:layoutHead/>
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<g:set var="name" value="${AppUtil.getConfig("general", "name")}"/>
<body>
<header class="sticky-top">
    <nav class="navbar navbar-expand-lg navbar-dark flex-md-row py-0">
        <a class="navbar-brand mr-0 mr-md-2" href="/" aria-label="Bootstrap"><i class="fas fa-home logo"></i> ${name}</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item ${pathology}"><g:link class="nav-link" controller="page" action="pathology"><i class="fas fa-notes-medical"></i> Pathology</g:link></li>
                <li class="nav-item ${patient}"><g:link class="nav-link" controller="page" action="patient"><i class="fas fa-file-prescription"></i> Patients</g:link></li>
                <li class="nav-item ${consultant}"><g:link class="nav-link" controller="page" action="consultant"><i class="fas fa-user-md"></i> Consultants</g:link></li>
                <li class="nav-item ${users}"><g:link class="nav-link" controller="setting" action="userManager"><i class="fas fa-user-lock"></i> Manage User</g:link></li>
                <li class="nav-item ${service}"><g:link class="nav-link" controller="setting" action="services"><i class="fas fa-vials"></i> Service Manager</g:link></li>
                <li class="nav-item ${employee}"><g:link class="nav-link" controller="setting" action="employee"><i class="fas fa-people-carry"></i> Employee</g:link></li>
                <li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-list-ul"></i> Bills</a></li>
                <li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-hdd"></i> Inventory</a></li>
            </ul>
            <ul class="navbar-nav d-lg-none d-md-flex">
                <li class="nav-item ${profile}"><g:link class="nav-link" controller="setting" action="profile"><i class="fas fa-user"></i> Profile</g:link></li>
                <li class="nav-item ${settings}"><g:link class="nav-link" controller="setting"><i class="fas fa-cogs"></i> Preferences</g:link></li>
                <li class="nav-item"><g:link class="nav-link" controller="dashboard" action="doLogout"><i class="fas fa-power-off"></i> Logout</g:link></li>
            </ul>
            <ul class="navbar-nav flex-row ml-md-auto d-none d-sm-none d-md-none d-lg-block d-xl-block">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <b>My Account</b>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                        <g:link class="dropdown-item ${profile}" controller="setting" action="profile"><i class="fas fa-user"></i> Profile [${AppUtil.currentUser.userId}]</g:link>
                        <g:link class="dropdown-item ${settings}" controller="setting"><i class="fas fa-cogs"></i> Preferences</g:link>
                        <div class="dropdown-divider"></div>
                        <g:link class="dropdown-item" controller="dashboard" action="doLogout"><i class="fas fa-power-off"></i> Logout</g:link>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</header>

<div class="layout-body container-fluid">
    <g:layoutBody class="page-content"/>
</div>

<footer class="position-absolute">
    <div class="container">
        <div class="copy text-center">
            Copyright &copy; ${AppUtil.getCurrentDate()} || <a href='https://www.fb.com/shahin31' target="_blank">${name}</a>
        </div>
    </div>
</footer>
<asset:javascript src="application.js"/>
</body>
</html>
