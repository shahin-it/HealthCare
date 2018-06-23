<g:form class="create-edit-form form-horizontal" role="form" controller="order" action="save" method="post">
    <input type="hidden" name="id" value="${order.id}">
    <div class="panel-heading">
        <div class="panel-title">CREATE/EDIT Test Service</div>
        <div class="panel-options form-group service-select">
            <label class="col-sm-3 control-label">Select Test</label>
            <div class="col-sm-7">
                <g:select name="#" class="form-control" from="${services.collect {it.value}}" keys="${services.collect {it.key}}" noSelection="['': 'none']"/>
            </div>
            <div class="col-sm-2">
                <button type="button" class="btn btn-success add-button">Add</button>
            </div>
        </div>
    </div>
    <div class="cart-table">
        <div class="table-header">
            <div class="form-group">
                <label class="col-sm-2 control-label">Patient</label>
                <div class="col-sm-4">
                    <g:select name="patient" class="form-control" keys="${patients.collect{it.id}}" from="${patients.collect {it.name + " : " + it.mobile}}" value="${order.patientId}"/>
                </div>
                <label class="col-md-2 control-label">Consultant</label>
                <div class="col-md-4">
                    <g:select name="consultant" class="form-control" keys="${consultants.collect{it.id}}" from="${consultants.collect {it.name + " : " + it.mobile}}" value="${order.consultantId}"/>
                </div>
            </div>
        </div>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>Test Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Discount</th>
                <th>Subtotal</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${order.items}" var="item">
                <g:include view="order/itemRow.gsp" model="[item: item]"/>
            </g:each>
            <tr class="summary-row sub-total">
                <td colspan="5"></td>
                <td>Sub Total</td>
                <td><span class="value">0.0</span></td>
            </tr>
            <tr class="summary-row discount">
                <td colspan="5"></td>
                <td>Discount</td>
                <td>-<span class="value">0.0</span></td>
            </tr>
            <tr class="summary-row grand-total">
                <td colspan="5"></td>
                <td>Grand Total</td>
                <td><span class="value">0.0</span></td>
            </tr>
            </tbody>
        </table>
        <div class="tr-template" style="display: none">
            <tr>
                <td>#id#</td>
                <td>#name#</td>
                <td>#quantity#</td>
                <td><a href="#" id="basePrice" data-type="text" data-pk="1" data-title="Enter price" class="editable editable-click editable-open" data-original-title="" title="">#basePrice#</a></td>
                <td>#discount#</td>
                <td>#grandTotal#</td>
                <td>@mdo</td>
            </tr>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-primary">Save</button>
            <button class="btn btn-danger cancel">Cancel</button>
        </div>
    </div>
</g:form>