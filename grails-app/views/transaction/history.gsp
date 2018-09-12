<%@ page import="com.healthcare.util.AppUtil" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main"/>
    <title>- Manage Pathologies</title>
    <asset:javascript src="feature/feature.crud.js"/>
</g:if>
<div class="card employee skui-tabular-content page-content" id="transaction-tab">
    <div class="card-header panel-header">
        <h5 class="card-title panel-title">Transaction History</h5>
        <g:if test="${!params.historyOnly}">
            <div class="panel-options tab-action-container">
                <ui:basicTableFilter createBtn="true"/>
            </div>
        </g:if>
    </div>
    <div class="card-body table-responsive tabular-body panel-body">
        <span class="label label-info">Showing ${items.size()} of ${count}</span>
        <table data-processing-url="${app.baseUrl()}transection/history" class="table">
            <thead>
            <tr>
                <th>Title</th>
                <th>Type</th>
                <th>Created</th>
                <th>Updated</th>
                <th>Trnx By</th>
                <th>Domain Id</th>
                <th>Amount</th>
                <th>Note</th>
                <g:if test="${!params.historyOnly}">
                    <th>Actions</th>
                </g:if>
            </tr>
            </thead>
            <tbody>
            <g:each in="${items}" var="item">
                <tr class="odd gradeX">
                    <td><span class="value">${item.title}</span></td>
                    <td><span class="value">${item.type}</span></td>
                    <td><span class="value">${item.created.toAdminFormat()}</span></td>
                    <td><span class="value">${item.updated.toAdminFormat()}</span></td>
                    <td class="center"><span class="value">${item.createdBy?.userId}</span></td>
                    <td><span class="value">#${item.domainId}</span></td>
                    <td><span class="value">${item.unitAmount} x ${item.quantity} = ${item.total}</span></td>
                    <td><span class="value">${item.note}</span></td>
                    <g:if test="${!params.historyOnly}">
                        <td class="action-navigator btn-group center" data-id="${item.id}">
                            <span class="btn btn-sm btn-info edit" title="Edit"><i class="fas fa-edit"></i></span>
                            <span class="btn btn-sm btn-warning remove" title="Delete"><i class="fas fa-trash-alt"></i></span>
                        </td>
                    </g:if>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <div class="card-footer panel-footer">
        <ul class="pagination pagination-sm justify-content-end" data-count="${count ?: 0}"></ul>
    </div>
</div>