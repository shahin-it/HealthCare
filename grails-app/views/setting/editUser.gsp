<%@ page import="com.healthcare.util.AppUtil" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main">
    <title>- Customer Profile</title>
</g:if>
<div class="page-content profile">
    <div class="panel-heading">
        <div class="panel-title">Customize Account Information</div>

        <div class="row panel-options tab-action-container">
            <g:if test="${users}">
                <g:select class="form-control user-selection" name="user"
                          from="${users.collect { it.userId + ' [' + it.name + ']' }}" keys="${users.collect { it.id }}"
                          value="${user.id}"/>
            </g:if>
        </div>
    </div>

    <div class="panel-body">
        <g:form class="form-horizontal create-edit-form" role="form" controller="setting" action="saveProfile"
                method="post">
            <input type="hidden" name="id" value="${user.id}">

            <div class="form-group">
                <label class="col-sm-2 control-label">Name</label>

                <div class="col-sm-4">
                    <input name="name" type="text" class="form-control" placeholder="Name" required maxlength="250"
                           minlength="3" value="${user.name}">
                </div>
                <label class="col-sm-2 control-label">Email</label>

                <div class="col-sm-4">
                    <input name="email" type="email" class="form-control" placeholder="Email" maxlength="250"
                           value="${user.email}">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">Phone/Mobile No</label>

                <div class="col-sm-4">
                    <input name="mobile" type="text" class="form-control" placeholder="Mobile/Phone Number" required
                           maxlength="20" value="${user.mobile}">
                </div>
                <label class="col-sm-2 control-label">Gender</label>

                <div class="col-sm-4">
                    <g:radioGroup name="sex" labels="['Male', 'Female']" values="['MALE', 'FEMALE']"
                                  value="${user.sex}"><span>${it.radio} ${it.label}</span></g:radioGroup>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">User Name</label>

                <div class="col-sm-4">
                    <g:if test="${AppUtil.currentUser.isAdmin}">
                        <input name="userId" type="text" class="form-control" placeholder="User Id" required
                               maxlength="20" value="${user.userId}">
                    </g:if>
                    <g:else>
                        <span class="form-control">${user.userId}</span>
                    </g:else>
                </div>
                <label class="col-md-2 control-label">Role</label>

                <div class="col-md-4">
                    <g:if test="${AppUtil.currentUser.isAdmin}">
                        <g:select name="role" class="form-control" from="['ADMIN', 'MANAGER', 'USER']"
                                  value="${user.role}"></g:select>
                    </g:if>
                    <g:else>
                        <span class="form-control">${user.role}</span>
                    </g:else>
                </div>
            </div>
            <ui:addressFieldSet prefix="address." domain="${user.address}"/>
            <div class="form-group">
                <div class="offset-sm-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </div>
        </g:form>
    </div>
</div>