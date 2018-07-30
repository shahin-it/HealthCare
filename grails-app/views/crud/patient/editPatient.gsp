<%@ page import="com.healthcare.Address" %>
<g:form class="create-edit-form form-horizontal" role="form" controller="crud" action="savePatient" method="post">
    <input type="hidden" name="id" value="${patient.id}">
    <div class="panel-heading">
        <div class="panel-title">Create/Edit Patient Info</div>
        <div class="panel-options"></div>
    </div>
    <div class="form-row">
        <div class="form-group col-sm-6">
            <label>Name</label>
            <input type="text" name="name" class="form-control" placeholder="Name" required maxlength="250" value="${patient.name}">
        </div>
        <div class="form-group col-sm-6">
            <label>Father Name</label>
            <input type="text" name="fatherName" class="form-control" placeholder="Father Name" maxlength="250" required value="${patient.fatherName}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Is Married</label>
        <div class="col-sm-4">
            <g:select name="isMarried" class="form-control" from="['YES', 'NO']" keys="[true, false]" value="${patient.isMarried}" data-toggle-target="is-married"/>
        </div>
        <div class="is-married-true">
            <label class="col-sm-2 control-label">Spouse Name</label>
            <div class="col-sm-4">
                <input type="text" name="spouseName" class="form-control" placeholder="Spouse Name" maxlength="250" value="${patient.spouseName}">
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Email</label>
        <div class="col-sm-4">
            <input type="email" name="email" class="form-control" placeholder="Email" value="${patient.email}">
        </div>
        <label class="col-sm-2 control-label">Mobile Number</label>
        <div class="col-sm-4">
            <input type="text" name="mobile" class="form-control" placeholder="Mobile Number" value="${patient.mobile}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-2 control-label">Gender</label>
        <div class="col-md-10">
            <g:select name="sex" class="form-control" from="['MALE', 'FEMALE']" value="${patient.sex}"/>
        </div>
    </div>
    <ui:addressFieldSet domain="${patient.address ?: [:]}" prefix="address."/>
    <div class="form-group button-line">
        <div class="offset-sm-2 col-sm-10">
            <button type="submit" class="btn btn-primary">Save</button>
            <button class="btn btn-danger cancel">Cancel</button>
        </div>
    </div>
</g:form>