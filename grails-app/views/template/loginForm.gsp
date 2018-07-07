<div class="content-wrap">
    <h6>Sign In</h6>
    <g:form method="post" class="${params.ajax == "true" ? "ajax-submit" : ""}" controller="dashboard" action="doLogin">
        <input type="hidden" name="referrer" value="${params.referrer}">
        <input class="form-control" type="text" name="userName" required placeholder="User name">
        <input class="form-control" type="password" name="password" required placeholder="Password">

        <div class="action">
            <button type="submit" class="btn btn-primary signup">Login</button>
        </div>
    </g:form>
</div>