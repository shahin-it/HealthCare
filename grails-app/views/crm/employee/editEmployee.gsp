<%@ page import="com.healthcare.util.AppUtil" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main">
    <title>- Edit Employee</title>
</g:if>
<div class="page-content profile">
    <div class="content-box-large">
        <div class="panel-heading">
            <div class="panel-title">Create/Edit Employee Information</div>
        </div>
        <div class="panel-body">
            <g:form class="form-horizontal create-edit-form" role="form" controller="crud" action="saveEmployee" method="post">
                <input type="hidden" name="id" value="${employee.id}">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-4">
                        <input name="name" type="text" class="form-control" placeholder="Name" required maxlength="250" minlength="3" value="${employee.name}">
                    </div>
                    <label class="col-sm-2 control-label">Father Name</label>
                    <div class="col-sm-4">
                        <input name="fatherName" type="text" class="form-control" placeholder="Father Name" required maxlength="250" value="${employee.fatherName}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-4">
                        <input name="email" type="email" class="form-control" placeholder="Email" maxlength="250" value="${employee.email}">
                    </div>
                    <label class="col-sm-2 control-label">Gender</label>
                    <div class="col-sm-4">
                        <g:radioGroup name="sex" labels="['Male', 'Female']" values="['MALE', 'FEMALE']" value="${employee.sex}"><span>${it.radio} ${it.label}</span></g:radioGroup>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Joining Date</label>
                    <div class="col-sm-4">
                        <input name="joiningDate" readonly type="text" class="form-control date-picker" placeholder="Joining date" required value="${employee.joiningDate?.toDatePickerFormat()}">
                    </div>
                    <label class="col-sm-2 control-label">Birth Day</label>
                    <div class="col-sm-4">
                        <input name="birthDate" readonly type="text" class="form-control date-picker" placeholder="Birth date" required value="${employee.birthDate?.toDatePickerFormat()}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">National ID</label>
                    <div class="col-sm-4">
                        <input name="nId" type="text" class="form-control" placeholder="National ID" required minlength="13" maxlength="17" value="${employee.nId}">
                    </div>
                    <label class="col-sm-2 control-label">Phone/Mobile No</label>
                    <div class="col-sm-4">
                        <input name="mobile" type="text" class="form-control" placeholder="Mobile/Phone Number" required maxlength="20" value="${employee.mobile}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Monthly Salary</label>
                    <div class="col-sm-4">
                        <input name="salary" type="number" step="0.01" class="form-control" minlength="3" maxlength="9" value="${employee.salary}">
                    </div>
                    <label class="col-sm-2 control-label">Bonus</label>
                    <div class="col-sm-4">
                        <input name="bonus" type="number" step="0.01" class="form-control" minlength="3" maxlength="9" value="${employee.bonus}">
                    </div>
                </div>
                <ui:addressFieldSet prefix="address." domain="${employee.address}"/>
                <div class="form-group button-line">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">Save</button>
                        <button class="btn btn-danger cancel">Cancel</button>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>