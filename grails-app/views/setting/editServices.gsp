<g:form class="create-edit-form form-horizontal" role="form" controller="setting" action="saveService" method="post">
    <input type="hidden" name="id" value="${service.id}">
    <div class="card-header panel-header">
        <div class="card-title panel-title">EDIT PATHOLOGY SERVICE</div>
    </div>
    <div class="form-group">
        <label class="control-label">Name</label>
        <input type="text" name="name" class="form-control" placeholder="Name" required maxlength="250" value="${service.name}">
    </div>
    <div class="form-group">
        <label class="control-label">Instruction</label>
        <input type="text" name="instruction" class="form-control" placeholder="Instruction" maxlength="250" value="${service.instruction}">
    </div>
    <div class="form-group">
        <label class="control-label">Description</label>
        <textarea class="form-control" name="description" placeholder="Description" rows="3" maxlength="1000">${service.description}</textarea>
    </div>
    <div class="form-row">
        <div class="form-group col-sm-6">
            <label class="control-label">Base Price</label>
            <input type="number" step="0.01" name="basePrice" class="form-control" placeholder="Base Price" min="0" max="999999999" required value="${service.basePrice}">
        </div>
        <div class="col-sm-6 form-group">
            <label class="control-label">Cost Price</label>
            <input type="number" step="0.01" name="costPrice" class="form-control" placeholder="Cost Price" min="0" max="999999999" value="${service.costPrice}">
        </div>
    </div>
    <div class="form-row">
        <div class="col-sm-6 form-group">
            <label class="control-label">Discount</label>
            <input type="number" step="0.01" name="discount" class="form-control" placeholder="Discount" min="0" max="999999999" value="${service.discount}">
        </div>
        <div class="col-sm-6 form-group">
            <label class="control-label">Discount Type</label>
            <g:select name="discountType" class="form-control" from="['%', 'TK']" value="${service.discountType}"/>
        </div>
    </div>
    <div class="form-group">
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Save</button>
            <button class="btn btn-danger cancel">Cancel</button>
        </div>
    </div>
</g:form>