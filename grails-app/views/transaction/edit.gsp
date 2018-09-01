<%@ page import="com.healthcare.DomainConstant; com.healthcare.util.AppUtil" %>
<div class="page-content">
    <div class="card-header panel-header">
        <h5 class="card-title panel-title">Create/Edit Transaction</h5>
    </div>
    <div class="panel-body">
        <g:form class="form-horizontal create-edit-form" role="form" controller="transaction" action="pay" method="post">
            <input type="hidden" name="id" value="${transaction.id}">
            <div class="form-row">
                <div class="form-group col-sm-6">
                    <label>Title</label>
                    <input name="title" type="text" class="form-control" value="${transaction.title}" required maxlength="250">
                </div>
                <div class="form-group col-sm-6">
                    <label>Type</label>
                    <g:select name="type" class="form-control" from="${DomainConstant.TRANAECTION_TYPES.values()}" value="${transaction.type}"/>
                </div>
            </div>
            <div class="form-row">
                <div class="col-sm-6 form-group">
                    <label>Tranx Quantity</label>
                    <input name="quantity" type="number" step="1" required class="form-control" minlength="1" maxlength="9" value="${transaction.quantity}">
                </div>
                <div class="col-sm-6 form-group">
                    <label>Unit Amount</label>
                    <input name="unitAmount" class="form-control" value="${transaction.unitAmount}" required step="0.01" minlength="1" maxlength="9"/>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-sm-6">
                    <label>Domain</label>
                    <input name="domainId" type="number" step="1" required class="form-control" minlength="1" maxlength="9" value="${transaction.domainId}">
                </div>
                <div class="form-group col-sm-6">
                    <label>Note</label>
                    <textarea name="note" class="form-control" maxlength="500">${transaction.note}</textarea>
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