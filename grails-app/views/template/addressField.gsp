<%@ page import="com.healthcare.DomainConstant" %>
<ui:fieldSet legend="Address:">
    <input type="hidden" name="${perfix.replace(".", "")}Id" value="${domain.id}">
    <div class="form-row">
        <div class="form-group col-sm-6">
            <label>Village/City</label>
            <input type="text" name="${perfix}city" class="form-control" required placeholder="village/city" maxlength="250" value="${domain.city}">
        </div>
        <div class="form-group col-sm-6">
            <label>Union Name</label>
            <input type="text" name="${perfix}unionName" class="form-control" placeholder="Union Name" maxlength="250" value="${domain.unionName}">
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-sm-6">
            <label>District</label>
            <g:select name="${perfix}district" class="form-control" from="${DomainConstant.DISTRICT}" value="${domain.district}"/>
        </div>
        <div class="form-group col-sm-6">
            <label>Upazila Name</label>
            <g:select name="${perfix}upazila" class="form-control" from="${DomainConstant.UPAZILA}" value="${domain.upazila}"/>
        </div>
    </div>
</ui:fieldSet>
