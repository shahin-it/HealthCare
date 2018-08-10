<%@ page import="com.healthcare.util.AppUtil" %>
<div class="page-content">
    <div class="card-header panel-header">
        <h5 class="card-title panel-title">Create/Edit Employee Information</h5>
    </div>
    <div class="panel-body">
        <g:form class="form-horizontal create-edit-form" role="form" controller="crud" action="saveEmployee" method="post">
            <input type="hidden" name="id" value="${employee.id}">
            <div class="form-row">
                <div class="col-sm-6 form-group">
                    <label>Name</label>
                    <input name="name" type="text" class="form-control" placeholder="Name" required maxlength="250" minlength="3" value="${employee.name}">
                </div>
                <div class="col-sm-6 form-group">
                    <label>Father Name</label>
                    <input name="fatherName" type="text" class="form-control" placeholder="Father Name" required maxlength="250" value="${employee.fatherName}">
                </div>
            </div>
            <div class="form-row">
                <div class="col-sm-6 form-group">
                    <label>Email</label>
                    <input name="email" type="email" class="form-control" placeholder="Email" maxlength="250" value="${employee.email}">
                </div>
                <div class="col-sm-6 form-group">
                    <label>Gender</label>
                    <div class="form-control">
                        <g:radioGroup name="sex" labels="['Male', 'Female']" values="['MALE', 'FEMALE']" value="${employee.sex}"><span>${it.radio} ${it.label}</span></g:radioGroup>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-sm-6 form-group">
                    <label>Joining Date</label>
                    <input name="joiningDate" readonly type="text" class="form-control date-picker" placeholder="Joining date" required value="${employee.joiningDate?.toDatePickerFormat()}">
                </div>
                <div class="col-sm-6 form-group">
                    <label>Birth Day</label>
                    <input name="birthDate" readonly type="text" class="form-control date-picker" placeholder="Birth date" required value="${employee.birthDate?.toDatePickerFormat()}">
                </div>
            </div>
            <div class="form-row">
                <div class="col-sm-6 form-group">
                    <label>National ID</label>
                    <input name="nId" type="text" class="form-control" placeholder="National ID" required minlength="13" maxlength="17" value="${employee.nId}">
                </div>
                <div class="col-sm-6 form-group">
                    <label>Phone/Mobile No</label>
                    <input name="mobile" type="text" class="form-control" placeholder="Mobile/Phone Number" required maxlength="20" value="${employee.mobile}">
                </div>
            </div>
            <div class="form-row">
                <div class="col-sm-6 form-group">
                    <label>Monthly Salary</label>
                    <input name="salary" type="number" step="0.01" class="form-control" minlength="3" maxlength="9" value="${employee.salary}">
                </div>
                <div class="col-sm-6 form-group">
                    <label>Bonus</label>
                    <input name="bonus" type="number" step="0.01" class="form-control" minlength="3" maxlength="9" value="${employee.bonus}">
                </div>
            </div>
            <ui:addressFieldSet prefix="address." domain="${employee.address}"/>
            <div class="form-group">
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <button class="btn btn-danger cancel">Cancel</button>
                </div>
            </div>
        </g:form>
    </div>
</div>