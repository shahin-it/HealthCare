<%@ page import="com.healthcare.util.AppUtil" %>
<div class="page-content">
    <div class="card-header panel-header">
        <h5 class="card-title panel-title">Create/Edit Employee Information</h5>
    </div>
    <div class="panel-body">
        <g:form class="form-horizontal create-edit-form" role="form" controller="transaction" action="pay" method="post">
            <input type="hidden" name="domainId" value="${employee.id}">
            <input type="hidden" name="note" value="Pay for employee #${employee.name}">
            <div class="form-group">
                <label>Type</label>
                <g:select name="type" class="form-control" from="['SALARY', 'BONUS']"/>
            </div>
            <div class="form-row">
                <div class="col-sm-6 form-group">
                    <label>Amount</label>
                    <input name="amount" type="number" step="0.01" class="form-control" minlength="2" maxlength="9" value="${employee.salary}">
                </div>
                <div class="col-sm-6 form-group">
                    <label>Month of</label>
                    <g:select name="title" class="form-control" from="${AppUtil.getMonth(true)}"/>
                </div>
            </div>
            <div class="form-group">
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Pay</button>
                    <button class="btn btn-danger cancel">Cancel</button>
                </div>
            </div>
        </g:form>
    </div>
</div>