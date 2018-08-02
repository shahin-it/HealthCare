<style>

</style>
<div class="order-print-panel">
    <div class="panel-header">
        <div class="panel-options tab-action-containert">
            <button type="button" class="d-inline btn btn-sm btn-success print-button"><i class="fas fa-print"></i> View/Print</button>
            <h5 class="p-2 d-inline">${params.title ?: 'Customer Copy'} ID#${id}</h5>
        </div>
    </div>
    <div class="panel-body">
        <iframe id="invoice-frame" width="100%" src="${app.baseUrl()}order/print/${id}?title=${params.title}" frameborder="0" onload="invoiceIframeLoaded()"></iframe>
    </div>
    <div class="panel-footer">
        <button type="button" class="btn btn-sm btn-danger cancel">Cancel</button>
        <button type="button" class="float-right btn btn-sm btn-success print-button"><i class="fas fa-print"></i> Print</button>
    </div>
</div>