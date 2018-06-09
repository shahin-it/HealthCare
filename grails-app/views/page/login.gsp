<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login to HelthCare</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="vendor/bootstrap.min.css"/>
    <asset:stylesheet src="vendor/styles.css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <asset:javascript src="vendor/jquery-3.3.1.js"/>
    <asset:javascript src="vendor/bootstrap.min.js"/>
</head>

<body class="login-bg">
<div class="header">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!-- Logo -->
                <div class="logo">
                    <h1><a href="#">Helth Care</a></h1>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="page-content container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-wrapper">
                <div class="box">
                    <div class="content-wrap">
                        <h6>Sign In</h6>
                        <g:form method="post" controller="dashboard" action="doLogin">
                            <input class="form-control" type="text" name="userName" required placeholder="User name">
                            <input class="form-control" type="password" name="password" required placeholder="Password">

                            <div class="action">
                                <button type="submit" class="btn btn-primary signup">Login</button>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>