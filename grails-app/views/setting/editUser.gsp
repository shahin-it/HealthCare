<%@ page import="com.healthcare.util.AppUtil" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main">
    <title>- Customer Profile</title>
</g:if>
<div class="profile ${!params.ajax ? "card":""}">
    <div class="card-header panel-header">
        <h5 class="card-title panel-title">Customize Account Information</h5>
        <div class="panel-options tab-action-container">
            <g:if test="${users}">
                <g:select class="form-control user-selection" name="user"
                          from="${users.collect { it.userId + ' [' + it.name + ']' }}" keys="${users.collect { it.id }}"
                          value="${user.id}"/>
            </g:if>
        </div>
    </div>

    <div class="card-body">
        <g:form class="form-horizontal create-edit-form ${!params.ajax ? "ajax-submit":""}" role="form" controller="setting" action="saveProfile" method="post">
            <input type="hidden" name="id" value="${user.id}">

            <div class="form-row">
                <div class="form-group col-sm-6">
                    <label class="control-label">Name</label>
                    <input name="name" type="text" class="form-control" placeholder="Name" required maxlength="250" minlength="3" value="${user.name}">
                </div>
                <div class="col-sm-6 form-group">
                    <label class="control-label">Email</label>
                    <input name="email" type="email" class="form-control" placeholder="Email" maxlength="250" value="${user.email}">
                </div>
            </div>

            <div class="form-row">
                <div class="col-sm-6 form-group">
                    <label class="control-label">Phone/Mobile No</label>
                    <input name="mobile" type="text" class="form-control" placeholder="Mobile/Phone Number" required maxlength="20" value="${user.mobile}">
                </div>
                <div class="col-sm-6 form-group">
                    <label class="control-label">Gender</label>
                    <div class="form-control">
                        <g:radioGroup name="sex" labels="['Male', 'Female']" values="['MALE', 'FEMALE']" value="${user.sex}"><span>${it.radio} ${it.label}</span></g:radioGroup>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="col-sm-6 form-group">
                    <label class="ontrol-label">User Name</label>
                    <g:if test="${AppUtil.currentUser.isAdmin}">
                        <input name="userId" type="text" class="form-control" placeholder="User Id" required maxlength="20" value="${user.userId}">
                    </g:if>
                    <g:else>
                        <span class="form-control">${user.userId}</span>
                    </g:else>
                </div>
                <div class="col-sm-6 form-group">
                    <label class="control-label">Role</label>
                    <g:if test="${AppUtil.currentUser.isAdmin}">
                        <g:select name="role" class="form-control" from="['ADMIN', 'MANAGER', 'USER']" value="${user.role}"></g:select>
                    </g:if>
                    <g:else>
                        <span class="form-control">${user.role}</span>
                    </g:else>
                </div>
            </div>
            <ui:addressFieldSet prefix="address." domain="${user.address}"/>
            <div class="form-group">
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <button class="btn btn-danger cancel">Cancel</button>
                </div>
            </div>
        </g:form>
    </div>
</div>