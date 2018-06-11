<g:if test="${!params.ajax}">
    <meta name="layout" content="_main"/>
</g:if>
<div class="page-content global-settings">
    <div class="content-box-large">
        <div class="panel-heading">
            <div class="panel-title">Application Preference</div>
            <div class="panel-options">
                <g:link controller="setting" action="global" data-rel="collapse" title="Reload"><i class="glyphicon glyphicon-refresh"></i></g:link>
            </div>
        </div>
        <div class="panel-body">
            <g:form class="create-edit-form form-horizontal" controller="setting" action="saveGlobalConfig" role="form" method="post">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Clinic Name</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" placeholder="Clinic Name" required maxlength="250" value="">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Banner</label>
                    <div class="col-sm-10">
                        <input type="file" accept="image/*" class="form-control" placeholder="Invoice Banner" max="${2*1024*1024}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Address Line1</label>
                    <div class="col-sm-10">
                        <input type="text" name="address1" class="form-control" placeholder="Address line1" required maxlength="250" value="">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Address Line2</label>
                    <div class="col-sm-10">
                        <input type="text" name="address2" class="form-control" placeholder="Address line2" maxlength="250" value="">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">About us</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" placeholder="About us" rows="3" maxlength="500"></textarea>
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