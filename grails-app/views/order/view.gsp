<div class="order-print-panel">
    <div class="panel-heading">
        <div class="panel-title">View/Print Order #${id}</div>
        <div class="panel-options tab-action-container">
            <button type="button" class="btn btn-success print-button"><i class="glyphicon glyphicon-print"></i> Print</button>
        </div>
    </div>
    <div class="panel-body">
        <iframe id="invoice-frame" width="100%" src="${app.baseUrl()}order/print/${id}" frameborder="1" onload="invoiceIframeLoaded()"></iframe>
    </div>
    <div class="panel-footer">
        <button type="button" class="btn btn-success print-button"><i class="glyphicon glyphicon-print"></i> Print</button>
    </div>
</div>

