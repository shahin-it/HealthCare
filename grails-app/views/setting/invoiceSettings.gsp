<%@ page import="com.healthcare.DomainConstant" %>
<div class="card general-settings">
    <g:set var="type" value="invoice"/>
    <div class="card-header panel-header">
        <h6 class="card-title panel-title">Invoice Settings</h6>
        <div class="panel-options">
            <g:link controller="setting" data-rel="collapse" title="Reload"><i class="fas fa-sync-alt"></i></g:link>
        </div>
    </div>
    <div class="card-body">
        <g:form class="create-edit-form ajax-submit" controller="setting" action="saveConfig" role="form" method="post">
            <input type="hidden" name="type" value="${type}">
            <div class="form-group">
                <label>Order Delivery Within (Days)</label>
                <input type="number" step="0.01" name="${type}.deliver_order_within" class="form-control" placeholder="Day example 1" required maxlength="250" value="${config.deliver_order_within}">
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </g:form>
    </div>
</div>