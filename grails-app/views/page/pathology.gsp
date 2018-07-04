<%@ page import="com.healthcare.DomainConstant; com.healthcare.util.AppUtil" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main"/>
    <title>- Manage Test</title>
    <asset:javascript src="feature/feature.order.js"/>
</g:if>
<div class="page-content orders">
    <div class="content-box-large sui-tabular-content" id="order-manager-tab">
        <div class="panel-heading">
            <div class="panel-title">Manage Test Report</div>
            <div class="panel-options tab-action-container">
                <div class="search-form">
                    <input type="text" class="form-control" placeholder="Search anything"/><button class="btn btn-primary glyphicon glyphicon-search"></button>
                </div>
                <button class="add-new-button btn btn-default"><i class="glyphicon glyphicon-plus"></i> Add</button>
            </div>
        </div>
        <div class="panel-body table-responsive tabular-body">
            <span class="label label-info">Showing ${items.size()} of ${count}</span>
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
                                <span class="btn btn-xs btn-info edit" data-action="edit" title="Edit"><i class="glyphicon glyphicon-edit"></i></span>
                            </g:if>
                            <span class="action btn btn-xs btn-warning view" data-action="view" title="View/Print"><i class="glyphicon glyphicon-print"></i></span>
                            <g:if test="${order.active && order.paymentStatus == "PAID" && order.deliveryStatus != 'DELIVERED'}">
                                <span class="btn btn-xs btn-warning" data-action="delivery" title="Complete Delivery"><i class="glyphicon glyphicon-send"></i></span>
                            </g:if>
                            <g:if test="${order.paymentStatus != 'PAID'}">
                                <span class="btn btn-xs btn-warning" data-action="cancel" title="Cancel"><i class="glyphicon glyphicon-ban-circle"></i></span>
                            </g:if>
                            <g:elseif test="${!order.active}">
                                <span class="btn btn-xs btn-warning" title="Activate" data-action="activate"><i class="glyphicon glyphicon-ok"></i></span>
                            </g:elseif>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="fc-row table-footer">
                <div class="col-sm-8 left">
                </div>
                <div class="col-sm-4 right">
                    <ul class="pagination pagination-sm" data-count="${count ?: 0}"></ul>
                </div>
            </div>
        </div>
    </div>
</div>