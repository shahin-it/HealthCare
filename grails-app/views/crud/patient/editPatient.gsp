<%@ page import="com.healthcare.Address" %>
<g:form class="create-edit-form form-horizontal" role="form" controller="crud" action="savePatient" method="post">
    <input type="hidden" name="id" value="${patient.id}">
    <div class="panel-header">
        <h5 class="panel-title">Create/Edit Patient Info</h5>
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
    <div class="form-row">
        <div class="form-group col-sm-6">
            <label>Is Married</label>
            <g:select name="isMarried" class="form-control" from="['YES', 'NO']" keys="[true, false]" value="${patient.isMarried}" data-toggle-target="is-married"/>
        </div>
        <div class="form-group col-sm-6 is-married-true">
            <label>Spouse Name</label>
            <input type="text" name="spouseName" class="form-control" placeholder="Spouse Name" maxlength="250" value="${patient.spouseName}">
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-sm-6">
            <label>Email</label>
            <input type="email" name="email" class="form-control" placeholder="Email" value="${patient.email}">
        </div>
        <div class="form-group col-sm-6">
            <label>Mobile Number</label>
            <input type="text" name="mobile" class="form-control" placeholder="Mobile Number" value="${patient.mobile}">
        </div>
    </div>
    <div class="form-group">
        <label>Gender</label>
        <g:select name="sex" class="form-control" from="['MALE', 'FEMALE']" value="${patient.sex}"/>
    </div>
    <ui:addressFieldSet domain="${patient.address ?: [:]}" prefix="address."/>
    <div class="form-group button-line">
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Save</button>
            <button class="btn btn-danger cancel">Cancel</button>
        </div>
    </div>
</g:form>