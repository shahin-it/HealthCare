<g:form class="create-edit-form form-horizontal" role="form" controller="order" action="save" method="post">
    <input type="hidden" name="id" value="${order.id}">
    <div class="panel-header row">
        <h5 class="panel-title col-sm-4">Create/Edit Test Service #${order.id}</h5>
        <div class="panel-options service-select col-sm-8">
            <div action="#" class="form-inline justify-content-end">
                <label class="mr-1">Select Test</label>
                <g:select name="#" class="form-control form-control-sm" from="${services.collect {it.value}}" keys="${services.collect {it.key}}" noSelection="['': 'None']"/>
                <button type="button" class="btn btn-sm btn-success add-button"><i class="fas fa-plus-circle"></i> Add</button>
            </div>
        </div>
    </div>
    <div class="cart-table">
        <div class="row">
            <div class="additional-info col-lg-4">
                <ui:fieldSet legend="Patient Info">
                    <g:set var="patient" value="${order.patient ?: [:]}"/>
                    <div class="form-group">
                        <label>Patient</label>
                        <g:select name="patientId" data-toggle-target="patient-info" class="form-control form-control-sm" keys="${patients.collect{it.id}}" from="${patients.collect {it.name + " : " + it.mobile}}" value="${order.patientId}" noSelection="['': 'None']"/>
                    </div>
                    <div class="patient-info-">
                        <div class="form-row">
                            <div class="form-group col-sm-6">
                                <label>Name</label>
                                <input type="text" name="patient.name" class="form-control form-control-sm" placeholder="Name" required maxlength="250">
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Father Name</label>
                                <input type="text" name="patient.fatherName" class="form-control form-control-sm" placeholder="Father Name" maxlength="250">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Gender</label>
                                <g:select name="patient.sex" class="form-control form-control-sm" from="['MALE', 'FEMALE']"/>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Mobile Number</label>
                                <input type="text" name="patient.mobile" class="form-control form-control-sm" required placeholder="Mobile Number">
                            </div>
                        </div>
                    </div>
                </ui:fieldSet>
                <ui:fieldSet legend="Consultant Info">
                    <g:set var="consultant" value="${order.consultant ?: [:]}"/>
                    <div class="form-group">
                        <label>Consultant</label>
                        <g:select name="consultantId" data-toggle-target="consultant-info" class="form-control form-control-sm" keys="${consultants.collect{it.id}}" from="${consultants.collect {it.name + " : " + it.mobile}}" value="${order.consultantId}" noSelection="['': 'None']"/>
                    </div>
                    <div class="consultant-info-">
                        <div class="form-row">
                            <div class="form-group col-sm-6">
                                <label>Name</label>
                                <input type="text" name="consultant.name" class="form-control form-control-sm" placeholder="Name" required maxlength="250">
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Designation</label>
                                <input type="text" name="consultant.designation" class="form-control form-control-sm" placeholder="Designation" maxlength="250" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-sm-6">
                                <label>Gender</label>
                                <g:select name="consultant.sex" class="form-control form-control-sm" from="['MALE', 'FEMALE']"/>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Mobile Number</label>
                                <input type="text" name="consultant.mobile" class="form-control form-control-sm" placeholder="Mobile Number">
                            </div>
                        </div>
                    </div>
                </ui:fieldSet>
            </div>
            <div class="col-lg-8">
                <table class="table table-striped order-items">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Test Name</th>
                        <th>Quantity</th>
                        <th>Rate</th>
                        <th>Discount(-)</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${order.items}" var="item" status="idx">
                        <g:include view="order/itemRow.gsp" model="[item: item, idx: idx]"/>
                    </g:each>
                    <tr class="summary-row sub-total">
                        <td colspan="4"></td>
                        <td colspan="2">Sub Total</td>
                        <td><span class="value">${order.total.toPrice()}</span><input type="hidden" name="subTotal" value="${order.total}"></td>
                    </tr>
                    <tr class="summary-row discount">
                        <td colspan="4"></td>
                        <td colspan="2">Discount(-)</td>
                        <td><span class="value">${order.discount.toPrice()}</span><input type="hidden" name="discount" value="${order.discount}"></td>
                    </tr>
                    <tr class="summary-row grand-total">
                        <td colspan="4"></td>
                        <td colspan="2">Grand Total</td>
                        <td><span class="value">${order.grandTotal.toPrice()}</span><input type="hidden" name="grandTotal" value="${order.grandTotal}"></td>
                    </tr>
                    <tr class="summary-row paid-total">
                        <td colspan="4"></td>
                        <td colspan="2">Paid Total(-)</td>
                        <td><input type="hidden" value="${order.paid}"><span class="value">${order.paid.toPrice()}</span></td>
                    </tr>
                    <tr class="summary-row new-payment">
                        <td colspan="4"></td>
                        <td colspan="2">Add Payment</td>
                        <td><input type="number" step="0.01" min="0" max="999999999" required name="newPayment" value="0.0"></td>
                    </tr>
                    <tr class="summary-row due-total ${order.due > 0 ? '' : 'paid'}">
                        <td colspan="4"></td>
                        <td colspan="2">Due Total</td>
                        <td><span class="value">${order.due.toPrice()}</span></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="form-group">
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Save</button>
                <button class="btn btn-danger cancel">Cancel</button>
            </div>
        </div>
    </div>
</g:form>