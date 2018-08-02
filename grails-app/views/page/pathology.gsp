<%@ page import="com.healthcare.DomainConstant; com.healthcare.util.AppUtil" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main"/>
    <title>- Manage Test</title>
    <asset:javascript src="feature/feature.order.js"/>
</g:if>
<div class="card sui-tabular-content page-content orders" id="order-manager-tab">
    <div class="card-header panel-header row">
        <h5 class="panel-title col-sm-4">Manage Test Report</h5>
        <div class="panel-options tab-action-container col-sm-8">
            <ui:basicTableFilter createBtn="true"/>
        </div>
    </div>
    <div class="card-body panel-body table-responsive tabular-body">
        <span class="label label-info float-left">Showing ${items.size()} of ${count}</span>
        <ul class="pagination pagination-sm float-right" data-count="${count ?: 0}"></ul>
        <table data-processing-url="${app.baseUrl()}page/pathology" class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Created</th>
                <th>Customer Name::Mobile</th>
                <th>Total</th>
                <th>Paid</th>
                <th>Due</th>
                <th>Payment Status</th>
                <th>Delivery Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${items}" var="order">
                <tr class="odd gradeX">
                    <td><span class="value">${order.id}</span></td>
                    <td><span class="value">${order.created.toAdminFormat()}</span></td>
                    <td><span class="value">${order.patient.name}::${order.patient.mobile}</span></td>
                    <td><span class="value">${order.grandTotal.toPrice()}</span></td>
                    <td><span class="value">${order.paid.toPrice()}</span></td>
                    <td class="center"><span class="value">${order.due.toPrice()}</span></td>
                    <td class="center"><span class="btn-sm value btn-${DomainConstant.statusUiClass(order.paymentStatus)}">${order.paymentStatus}</span></td>
                    <td class="center"><span class="btn-sm value btn-${DomainConstant.statusUiClass(order.deliveryStatus)}">${order.deliveryStatus}</span></td>
                    <td class="action-navigator btn-group center" data-id="${order.id}">
                        <g:if test="${!order.isPaid}">
                            <span class="btn btn-sm btn-info edit" data-action="edit" title="Edit"><i class="fas fa-edit"></i></span>
                        </g:if>
                        <span class="action btn btn-sm btn-warning view" data-action="view" title="View/Print Customer Copy"><i class="fas fa-print"></i></span>
                        <span class="action btn btn-sm btn-warning view" data-action="view" data-title="Office Copy" title="View/Print Office Copy"><i class="fas fa-eye"></i></span>
                        <g:if test="${order.active && order.paymentStatus == "PAID" && order.deliveryStatus != 'DELIVERED'}">
                            <span class="btn btn-sm btn-warning" data-action="delivery" title="Complete Delivery"><i class="fas fa-share-square"></i></span>
                        </g:if>
                        <g:if test="${order.paymentStatus != 'PAID'}">
                            <span class="btn btn-sm btn-warning" data-action="cancel" title="Cancel"><i class="fas fa-ban"></i></span>
                        </g:if>
                        <g:elseif test="${!order.active}">
                            <span class="btn btn-sm btn-warning" title="Activate" data-action="activate"><i class="fas fa-check-circle"></i></span>
                        </g:elseif>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <div class="card-footer panel-footer">
        <ul class="pagination pagination-sm justify-content-end" data-count="${count ?: 0}"></ul>
    </div>
</div>