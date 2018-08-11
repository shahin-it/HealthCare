<%@ page import="com.healthcare.DomainConstant" %>
<div class="card general-settings">
    <g:set var="type" value="general"/>
    <div class="card-header panel-header">
        <h6 class="card-title panel-title">Clinic Information</h6>
        <div class="panel-options">
            <g:link controller="setting" data-rel="collapse" title="Reload"><i class="fas fa-sync-alt"></i></g:link>
        </div>
    </div>
    <div class="card-body">
        <g:form class="create-edit-form ajax-submit" controller="setting" action="saveGeneralConfig" role="form" method="post">
            <input type="hidden" name="type" value="${type}">
            <div class="form-group">
                <label>Clinic Name</label>
                <input type="text" name="${type}.name" class="form-control" placeholder="Clinic Name" required maxlength="250" value="${config.name}">
            </div>
            <ui:imageUpload name="${type}.banner" label="Banner" max="${2*1024*1024}" value="${config.banner}"></ui:imageUpload>
            <ui:imageUpload name="${type}.logo" label="Logo" max="${2*1024*1024}" value="${config.logo}"></ui:imageUpload>
            <div class="form-group">
                <label>Address Line1</label>
                <input type="text" name="${type}.address1" class="form-control" placeholder="Address line1" required maxlength="250" value="${config.address1}">
            </div>
            <div class="form-group">
                <label>Address Line2</label>
                <input type="text" name="${type}.address2" class="form-control" placeholder="Address line2" maxlength="250" value="${config.address2}">
            </div>
            <div class="form-group">
                <label>Phone Numbers</label>
                <input type="text" name="${type}.contact" class="form-control" placeholder="Phone numbers" maxlength="250" value="${config.contact}">
            </div>
            <div class="form-row">
                <div class="col-sm-6 form-group">
                    <label>Web Address</label>
                    <input type="url" name="${type}.web" class="form-control" placeholder="Website Address" maxlength="250" value="${config.web}">
                </div>
                <div class="col-sm-6 form-group">
                    <label>Email</label>
                    <input type="text" name="${type}.email" class="form-control" placeholder="Email Address" maxlength="250" value="${config.email}">
                </div>
            </div>
            <div class="form-group">
                <label>About us</label>
                <textarea name="${type}.details" class="form-control" placeholder="About us" rows="2" maxlength="250">${config.details}</textarea>
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </g:form>
    </div>
</div>