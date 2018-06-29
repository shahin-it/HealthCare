<%@ page import="com.healthcare.util.AppUtil" %>
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
                    <th>Customer Name</th>
                    <th>Mobile</th>
                    <th>Total</th>
                    <th>Due</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${items}" var="order">
                    <tr class="odd gradeX">
                        <td><span class="value">${order.id}</span></td>
                        <td><span class="value">${order.created.toAdminFormat()}</span></td>
                        <td><span class="value">${order.patient.name}</span></td>
                        <td><span class="value">${order.patient.mobile}</span></td>
                        <td><span class="value">${order.total}</span></td>
                        <td class="center"><span class="value">${order.due}</span></td>
                        <td class="center"><span class="value status ${order.status}">${order.status}</span></td>
                        <td class="action-navigator btn-group center" data-id="${order.id}">
                            <span class="btn btn-xs btn-info edit" title="Edit"><i class="glyphicon glyphicon-edit"></i></span>
                            <span class="btn btn-xs btn-warning view" title="View/Print"><i class="glyphicon glyphicon-print"></i></span>
                            <g:if test="${order.active && order.status != 'PAID'}">
                                <span class="btn btn-xs btn-warning cancel" title="Cancel"><i class="glyphicon glyphicon-eye-close"></i></span>
                            </g:if>
                            <g:else>
                                <span class="btn btn-xs btn-warning active" title="Activate"><i class="glyphicon glyphicon-ok"></i></span>
                            </g:else>
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