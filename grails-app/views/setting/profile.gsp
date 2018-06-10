<g:if test="${!params.ajax}">
    <meta name="layout" content="_main"/>
</g:if>
<div class="page-content profile">
    <div class="content-box-large">
        <div class="panel-heading">
            <div class="panel-title">Customize Account Information</div>
        </div>
        <div class="panel-body">
            <g:form class="form-horizontal create-edit-form" role="form" controller="setting" action="saveProfile" method="post">
                <input type="hidden" name="id" value="${user.id}">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-10">
                        <input name="name" type="text" class="form-control" placeholder="Name" required maxlength="250" minlength="3" value="${user.name}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <input name="email" type="email" class="form-control" placeholder="Email" maxlength="250" value="${user.email}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Phone/Mobile No</label>
                    <div class="col-sm-10">
                        <input name="phone" type="text" class="form-control" placeholder="Mobile/Phone Number" required maxlength="20" value="${user.phone}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Gender</label>
                    <div class="col-sm-10">
                        <g:radioGroup name="sex" labels="['Male', 'Female']" values="['M', 'F']" value="${user.sex}"><span>${it.radio} ${it.label}</span></g:radioGroup>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">User Name</label>
                    <div class="col-sm-10">
                        <span class="form-control">${user.userName}</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">Role</label>
                    <div class="col-md-4">
                        <g:select name="discountType" class="form-control" from="['ADMIN', 'MANAGER', 'USER']" value="${user.role}"></g:select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Address</label>
                    <div class="col-sm-10">

                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>