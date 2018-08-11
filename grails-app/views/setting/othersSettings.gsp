<%@ page import="com.healthcare.DomainConstant" %>
<div class="card general-settings">
    <g:set var="type" value="others"/>
    <div class="card-header panel-header">
        <h6 class="card-title panel-title">Others Information</h6>
        <div class="panel-options">
            <g:link controller="setting" data-rel="collapse" title="Reload"><i class="fas fa-sync-alt"></i></g:link>
        </div>
    </div>
    <div class="card-body">
        <g:form class="create-edit-form ajax-submit" controller="setting" action="saveConfig" role="form" method="post">
            <input type="hidden" name="type" value="${type}">
            <div class="form-row">
                <div class="col-sm-6 form-group">
                    <label>Time Formate</label>
                    <g:select name="${type}.time_formate" class="form-control" from="${DomainConstant.TIME_FORMATE}" value="${config.time_formate}"/>
                </div>
                <div class="col-sm-6 form-group">
                    <label>Date Formate</label>
                    <g:select name="${type}.date_formate" class="form-control" from="${DomainConstant.DATE_FORMATE}" value="${config.date_formate}"/>
                </div>
            </div>
            <div class="form-group">
                <label>Display Item per Page</label>
                <input type="number" step="0.01" min="5" required name="${type}.item_per_page" class="form-control" placeholder="Item per Page" maxlength="500" value="${config.item_per_page}">
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </g:form>
    </div>
</div>