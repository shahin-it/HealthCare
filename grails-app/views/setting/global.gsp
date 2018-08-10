<%@ page import="com.healthcare.DomainConstant" %>
<meta name="layout" content="_main">
<title>- Global Settings</title>
<div class="card global-settings">
    <div class="card-header panel-header">
        <h5 class="card-title panel-title">Clinic Information</h5>
        <div class="panel-options">
            <g:link controller="setting" action="global" data-rel="collapse" title="Reload"><i class="fas fa-sync-alt"></i></g:link>
        </div>
    </div>
    <div class="card-body">
        <g:form class="create-edit-form ajax-submit form-horizontal" controller="setting" action="saveGlobalConfig" role="form" method="post">
            <input type="hidden" name="type" value="global">
            <div class="form-group">
                <label>Clinic Name</label>
                <input type="text" name="global.name" class="form-control" placeholder="Clinic Name" required maxlength="250" value="${config.name}">
            </div>
            <ui:imageUpload name="global.banner" label="Banner" max="${2*1024*1024}" value="${config.banner}"></ui:imageUpload>
            <ui:imageUpload name="global.logo" label="Logo" max="${2*1024*1024}" value="${config.logo}"></ui:imageUpload>
            <div class="form-group">
                <label>Address Line1</label>
                <input type="text" name="global.address1" class="form-control" placeholder="Address line1" required maxlength="250" value="${config.address1}">
            </div>
            <div class="form-group">
                <label>Address Line2</label>
                <input type="text" name="global.address2" class="form-control" placeholder="Address line2" maxlength="250" value="${config.address2}">
            </div>
            <div class="form-row">
                <div class="col-sm-6 form-group">
                    <label>Phone Numbers</label>
                    <input type="text" name="global.contact" class="form-control" placeholder="Phone numbers" maxlength="250" value="${config.contact}">
                </div>
                <div class="col-sm-6 form-group">
                    <label>Order Delivery Within (Days)</label>
                    <input type="number" step="0.01" name="global.deliver_order_within" class="form-control" placeholder="Day example 1" required maxlength="250" value="${config.deliver_order_within}">
                </div>
            </div>
            <div class="form-row">
                <div class="col-sm-6 form-group">
                    <label>Web Address</label>
                    <input type="url" name="global.web" class="form-control" placeholder="Website Address" maxlength="250" value="${config.web}">
                </div>
                <div class="col-sm-6 form-group">
                    <label>Email</label>
                    <input type="text" name="global.email" class="form-control" placeholder="Email Address" maxlength="250" value="${config.email}">
                </div>
            </div>
            <div class="form-row">
                <div class="col-sm-6 form-group">
                    <label>Time Formate</label>
                    <g:select name="global.time_formate" class="form-control" from="${DomainConstant.TIME_FORMATE}" value="${config.time_formate}"/>
                </div>
                <div class="col-sm-6 form-group">
                    <label>Date Formate</label>
                    <g:select name="global.date_formate" class="form-control" from="${DomainConstant.DATE_FORMATE}" value="${config.date_formate}"/>
                </div>
            </div>
            <div class="form-row">
                <div class="col-sm-6 form-group">
                    <label>Display Item per Page</label>
                    <input type="number" step="0.01" min="5" required name="global.item_per_page" class="form-control" placeholder="Item per Page" maxlength="500" value="${config.item_per_page}">
                </div>
                <div class="col-sm-6 form-group">
                    <label>About us</label>
                    <textarea name="global.details" class="form-control" placeholder="About us" rows="2" maxlength="250">${config.details}</textarea>
                </div>
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </g:form>
    </div>
</div>