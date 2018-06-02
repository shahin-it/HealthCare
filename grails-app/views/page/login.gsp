<!DOCTYPE html>
<html>
<head>
    <title>Login to HelthCare</title>
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
                        <g:form controller="dashboard" action="doLogin">
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