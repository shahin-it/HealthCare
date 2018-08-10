<%@ page import="com.healthcare.Address" %>
<g:form class="create-edit-form form-horizontal" role="form" controller="crud" action="saveConsultant" method="post">
    <input type="hidden" name="id" value="${consultant.id}">
    <div class="card-header panel-header">
        <h5 class="card-title panel-title">Create/Edit Consultant Info</h5>
    </div>
    <div class="form-row">
        <div class="form-group col-sm-6">
            <label class="control-label">Name</label>
            <input type="text" name="name" class="form-control" placeholder="Name" required maxlength="250" value="${consultant.name}">
        </div>
        <div class="form-group col-sm-6">
            <label class="control-label">Qualification</label>
            <input type="text" name="qualification" class="form-control" placeholder="Qualification" maxlength="250" required value="${consultant.qualification}">
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-sm-6">
            <label class="control-label">Designation</label>
            <input type="text" name="designation" class="form-control" placeholder="Designation" maxlength="250" required value="${consultant.designation}">
        </div>
        <div class="form-group col-sm-6">
            <label class="control-label">Last Institute</label>
            <input type="text" name="lastInstitute" class="form-control" placeholder="Last Institute" maxlength="250" required value="${consultant.lastInstitute}">
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-sm-6">
            <label class="control-label">Works At</label>
            <input type="text" name="worksAt" class="form-control" placeholder="Works at" maxlength="250" value="${consultant.worksAt}">
        </div>
        <div class="form-group col-md-6">
            <label class="control-label">Gender</label>
            <g:select name="sex" class="form-control" from="['MALE', 'FEMALE']" value="${consultant.sex}"/>
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-sm-6">
            <label class="control-label">Email</label>
            <input type="email" name="email" class="form-control" placeholder="Email" value="${consultant.email}">
        </div>
        <div class="form-group col-sm-6">
            <label class="control-label">Mobile Number</label>
            <input type="text" name="mobile" class="form-control" placeholder="Mobile Number" value="${consultant.mobile}">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label">Visiting Fee</label>
        <input type="number" step="0.01" name="visitingFee" class="form-control" placeholder="Visiting Fee" max="5000" required maxlength="9" value="${consultant.visitingFee}">
    </div>
    <div class="form-group">
        <div class="offset-sm-2 col-sm-10">
            <button type="submit" class="btn btn-primary">Save</button>
            <button class="btn btn-danger cancel">Cancel</button>
        </div>
    </div>
</g:form>