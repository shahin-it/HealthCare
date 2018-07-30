<%@ page import="com.healthcare.DomainConstant; com.healthcare.util.AppUtil" %>
<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        HEALTHCARE <g:layoutTitle/>
    </title>
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
    <asset:javascript src="sui/utility.js"/>
    <asset:javascript src="sui/common-ui.js"/>
    <asset:javascript src="sui/table.js"/>
    <asset:javascript src="admin.js"/>
    <g:layoutHead/>
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<g:set var="name" value="${AppUtil.getConfig("global", "name")}"/>
<div class="header banner">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-5">
                <h2 class="store-name"><g:link controller="dashboard" action="controlPanel">${name}</g:link></h2>
            </div>
            <div class="col-sm-5">
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
            <div class="col-sm-2">
                <div class="navbar navbar-inverse" role="banner">
                    <nav class="bs-navbar-collapse navbar-right" role="navigation">
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Account <b
                                        class="caret"></b></a>
                                <ul class="dropdown-menu animated fadeInUp">
                                    <li><g:link controller="setting" action="profile">Profile [${AppUtil.currentUser.userId}]</g:link></li>
                                    <li><g:link controller="setting" action="global">Settings</g:link></li>
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
    <g:if test="${!pathology}">
        <div class="row">
        <div class="col-md-2">
            <div class="sidebar content-box" style="display: block;">
                <g:if test="${controllerName == 'setting'}">
                    <g:include view="template/settingsNav.gsp"/>
                </g:if>
                <g:else>
                    <ul class="nav">
                        <!-- Main menu -->
                        <li class="${dashboard}"><g:link controller="dashboard" action="controlPanel"><i class="fas fa-home"></i> Dashboard</g:link></li>
                        <li class="${pathology}"><g:link controller="page" action="pathology"><i class="fas fa-notes-medical"></i> Pathology</g:link></li>
                        <li class="${patient}"><g:link controller="page" action="patient"><i class="fas fa-file-prescription"></i> Patients</g:link></li>
                        <li class="${consultant}"><g:link controller="page" action="consultant"><i class="fas fa-user-md"></i> Consultants</g:link></li>
                        <li class=""><a href="#"><i class="fas fa-list-ul"></i> Bills</a></li>
                        <li class=""><a href="#"><i class="fas fa-hdd"></i> Inventory</a></li>
                    </ul>
                </g:else>

            </div>
        </div>
        <div class="loayout-body col-md-10">
            <g:layoutBody/>
        </div>
        </div>
    </g:if>
    <g:else>
        <div class="loayout-body">
            <g:layoutBody/>
        </div>
    </g:else>
</div>

<footer>
    <div class="container">
        <div class="copy text-center">
            Copyright &copy; ${AppUtil.getCurrentDate()} || <a href='https://www.fb.com/shahin31' target="_blank">${name}</a>
        </div>
    </div>
</footer>
<asset:javascript src="application.js"/>
</body>
</html>
