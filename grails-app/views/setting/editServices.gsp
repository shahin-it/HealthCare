<g:form class="create-edit-form form-horizontal" role="form" controller="setting" action="saveService" method="post">
    <input type="hidden" name="id" value="${service.id}">
    <div class="panel-heading">
        <div class="panel-title">EDIT PATHOLOGY SERVICE</div>
        <div class="panel-options"></div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Name</label>
        <div class="col-sm-10">
            <input type="text" name="name" class="form-control" placeholder="Name" required maxlength="250" value="${service.name}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Instruction</label>
        <div class="col-sm-10">
            <input type="text" name="instruction" class="form-control" placeholder="Instruction" maxlength="250" value="${service.instruction}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Description</label>
        <div class="col-sm-10">
            <textarea class="form-control" name="description" placeholder="Description" rows="3" maxlength="1000">${service.description}</textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Base Price</label>
        <div class="col-sm-4">
            <input type="number" step="0.01" name="basePrice" class="form-control" placeholder="Base Price" min="0" max="999999999" required value="${service.basePrice}">
        </div>
        <label class="col-sm-2 control-label">Cost Price</label>
        <div class="col-sm-4">
            <input type="number" step="0.01" name="costPrice" class="form-control" placeholder="Cost Price" min="0" max="999999999" value="${service.costPrice}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Discount</label>
        <div class="col-sm-4">
            <input type="number" step="0.01" name="discount" class="form-control" placeholder="Discount" min="0" max="999999999" value="${service.discount}">
        </div>
        <label class="col-md-2 control-label">Discount Type</label>
        <div class="col-md-4">
            <g:select name="discountType" class="form-control" from="['%', 'TK']" value="${service.discountType}"/>
        </div>
    </div>
    <div class="form-group">
        <div class="offset-sm-2 col-sm-10">
            <button type="submit" class="btn btn-primary">Save</button>
            <button class="btn btn-danger cancel">Cancel</button>
        </div>
    </div>
</g:form>