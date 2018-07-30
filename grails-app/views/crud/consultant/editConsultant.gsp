<%@ page import="com.healthcare.Address" %>
<g:form class="create-edit-form form-horizontal" role="form" controller="crud" action="saveConsultant" method="post">
    <input type="hidden" name="id" value="${consultant.id}">
    <div class="panel-heading">
        <div class="panel-title">Create/Edit Consultant Info</div>
        <div class="panel-options"></div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Name</label>
        <div class="col-sm-4">
            <input type="text" name="name" class="form-control" placeholder="Name" required maxlength="250" value="${consultant.name}">
        </div>
        <label class="col-sm-2 control-label">Qualification</label>
        <div class="col-sm-4">
            <input type="text" name="qualification" class="form-control" placeholder="Qualification" maxlength="250" required value="${consultant.qualification}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Designation</label>
        <div class="col-sm-4">
            <input type="text" name="designation" class="form-control" placeholder="Designation" maxlength="250" required value="${consultant.designation}">
        </div>
        <label class="col-sm-2 control-label">Last Institute</label>
        <div class="col-sm-4">
            <input type="text" name="lastInstitute" class="form-control" placeholder="Last Institute" maxlength="250" required value="${consultant.lastInstitute}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Works At</label>
        <div class="col-sm-4">
            <input type="text" name="worksAt" class="form-control" placeholder="Works at" maxlength="250" value="${consultant.worksAt}">
        </div>
        <label class="col-md-2 control-label">Gender</label>
        <div class="col-md-4">
            <g:select name="sex" class="form-control" from="['MALE', 'FEMALE']" value="${consultant.sex}"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Email</label>
        <div class="col-sm-4">
            <input type="email" name="email" class="form-control" placeholder="Email" value="${consultant.email}">
        </div>
        <label class="col-sm-2 control-label">Mobile Number</label>
        <div class="col-sm-4">
            <input type="text" name="mobile" class="form-control" placeholder="Mobile Number" value="${consultant.mobile}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Visiting Fee</label>
        <div class="col-sm-10">
            <input type="number" step="0.01" name="visitingFee" class="form-control" placeholder="Visiting Fee" max="5000" required maxlength="9" value="${consultant.visitingFee}">
        </div>
    </div>
    <div class="form-group button-line">
        <div class="offset-sm-2 col-sm-10">
            <button type="submit" class="btn btn-primary">Save</button>
            <button class="btn btn-danger cancel">Cancel</button>
        </div>
    </div>
</g:form>