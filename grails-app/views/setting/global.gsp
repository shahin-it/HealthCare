<%@ page import="com.healthcare.DomainConstant" %>
<meta name="layout" content="_main">
<title>- Global Settings</title>
<div class="page-content global-settings">
    <div class="content-box-large">
        <div class="panel-heading">
            <div class="panel-title">Clinic Information</div>
            <div class="panel-options">
                <g:link controller="setting" action="global" data-rel="collapse" title="Reload"><i class="glyphicon glyphicon-refresh"></i></g:link>
            </div>
        </div>
        <div class="panel-body">
            <g:form class="create-edit-form form-horizontal" controller="setting" action="saveGlobalConfig" role="form" method="post">
                <input type="hidden" name="type" value="global">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Clinic Name</label>
                    <div class="col-sm-10">
                        <input type="text" name="global.name" class="form-control" placeholder="Clinic Name" required maxlength="250" value="${config.name}">
                    </div>
                </div>
                <ui:imageUpload name="global.banner" label="Banner" max="${2*1024*1024}" value="${config.banner}"></ui:imageUpload>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Address Line1</label>
                    <div class="col-sm-10">
                        <input type="text" name="global.address1" class="form-control" placeholder="Address line1" required maxlength="250" value="${config.address1}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Address Line2</label>
                    <div class="col-sm-10">
                        <input type="text" name="global.address2" class="form-control" placeholder="Address line2" maxlength="250" value="${config.address2}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Phone Numbers</label>
                    <div class="col-sm-10">
                        <input type="text" name="global.contact" class="form-control" placeholder="Phone numbers" maxlength="250" value="${config.contact}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Time Formate</label>
                    <div class="col-sm-4">
                        <g:select name="global.timeFormate" class="form-control" from="${DomainConstant.TIME_FORMATE}" value="${config.timeFormate}"/>
                    </div>
                    <label class="col-sm-2 control-label">Date Formate</label>
                    <div class="col-sm-4">
                        <g:select name="global.dateFormate" class="form-control" from="${DomainConstant.DATE_FORMATE}" value="${config.dateFormate}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">About us</label>
                    <div class="col-sm-10">
                        <textarea name="global.details" class="form-control" placeholder="About us" rows="3" maxlength="500">${config.details}</textarea>
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