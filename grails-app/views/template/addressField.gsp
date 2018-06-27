<%@ page import="com.healthcare.DomainConstant" %>
<ui:fieldSet legend="Address:">
    <input type="hidden" name="${perfix}.id" value="${domain.id}">
    <div class="form-group">
        <label class="col-sm-2 control-label">Village/City</label>
        <div class="col-sm-4">
            <input type="text" name="${perfix}.city" class="form-control" required placeholder="village/city" maxlength="250" value="${domain.city}">
        </div>
        <label class="col-sm-2 control-label">Union Name</label>
        <div class="col-sm-4">
            <input type="text" name="${perfix}.unionName" class="form-control" placeholder="Union Name" maxlength="250" value="${domain.unionName}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">District</label>
        <div class="col-sm-4">
            <g:select name="${perfix}.district" class="form-control" from="${DomainConstant.DISTRICT}" value="${domain.district}"/>
        </div>
        <label class="col-sm-2 control-label">Upazila Name</label>
        <div class="col-sm-4">
            <g:select name="${prefix}.upazila" class="form-control" from="${DomainConstant.UPAZILA}" value="${domain.upazila}"/>
        </div>
    </div>
</ui:fieldSet>
