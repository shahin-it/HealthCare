<g:form class="create-edit-form form-horizontal" role="form" controller="order" action="save" method="post">
    <input type="hidden" name="id" value="${order.id}">
    <div class="panel-heading">
        <div class="panel-title">Create/Edit Test Service</div>
        <div class="panel-options form-group service-select">
            <label class="col-sm-3 control-label">Select Test</label>
            <div class="col-sm-6">
                <g:select name="#" class="form-control" from="${services.collect {it.value}}" keys="${services.collect {it.key}}" noSelection="['': 'None']"/>
            </div>
            <div class="col-sm-2">
                <button type="button" class="btn btn-success add-button">Add</button>
            </div>
        </div>
    </div>
    <div class="cart-table">
        <div class="row">
            <div class="additional-info col-md-4">
                <ui:fieldSet legend="Patient Info">
                    <g:set var="patient" value="${order.patient ?: [:]}"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Patient</label>
                        <div class="col-sm-10">
                            <g:select name="patientId" data-toggle-target="patient-info" class="form-control" keys="${patients.collect{it.id}}" from="${patients.collect {it.name + " : " + it.mobile}}" value="${order.patientId}" noSelection="['': 'None']"/>
                        </div>
                    </div>
                    <div class="patient-info-">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Name</label>
                            <div class="col-sm-4">
                                <input type="text" name="patient.name" class="form-control" placeholder="Name" required maxlength="250">
                            </div>
                            <label class="col-sm-2 control-label">Father Name</label>
                            <div class="col-sm-4">
                                <input type="text" name="patient.fatherName" class="form-control" placeholder="Father Name" maxlength="250" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Gender</label>
                            <div class="col-md-4">
                                <g:select name="patient.sex" class="form-control" from="['MALE', 'FEMALE']"/>
                            </div>
                            <label class="col-sm-2 control-label">Mobile Number</label>
                            <div class="col-sm-4">
                                <input type="text" name="patient.mobile" class="form-control" placeholder="Mobile Number">
                            </div>
                        </div>
                    </div>
                </ui:fieldSet>
                <ui:fieldSet legend="Consultant Info">
                    <g:set var="consultant" value="${order.consultant ?: [:]}"/>
                    <div class="form-group">
                        <label class="col-md-2 control-label">Consultant</label>
                        <div class="col-md-10">
                            <g:select name="consultantId" data-toggle-target="consultant-info" class="form-control" keys="${consultants.collect{it.id}}" from="${consultants.collect {it.name + " : " + it.mobile}}" value="${order.consultantId}" noSelection="['': 'None']"/>
                        </div>
                    </div>
                    <div class="consultant-info-">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Name</label>
                            <div class="col-sm-4">
                                <input type="text" name="consultant.name" class="form-control" placeholder="Name" required maxlength="250">
                            </div>
                            <label class="col-sm-2 control-label">Designation</label>
                            <div class="col-sm-4">
                                <input type="text" name="consultant.designation" class="form-control" placeholder="Designation" maxlength="250" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Gender</label>
                            <div class="col-md-4">
                                <g:select name="consultant.sex" class="form-control" from="['MALE', 'FEMALE']"/>
                            </div>
                            <label class="col-sm-2 control-label">Mobile Number</label>
                            <div class="col-sm-4">
                                <input type="text" name="consultant.mobile" class="form-control" placeholder="Mobile Number">
                            </div>
                        </div>
                    </div>
                </ui:fieldSet>
            </div>
            <div class="col-md-8">
                <table class="table table-striped">
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
                    <g:each in="${order.items}" var="item">
                        <g:include view="order/itemRow.gsp" model="[item: item]"/>
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
                        <td><input type="text" min="0" maxlength="9" required name="paid" value="${order.paid.toPrice()}"></td>
                    </tr>
                    <tr class="summary-row due-total ${order.due > 0 ? '' : 'paid'}">
                        <td colspan="4"></td>
                        <td colspan="2">Total Due</td>
                        <td><span class="value">${order.due.toPrice()}</span></td>
                    </tr>
                    </tbody>
                </table>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">Save</button>
                        <button class="btn btn-danger cancel">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:form>