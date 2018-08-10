<%@ page import="com.healthcare.util.AppUtil" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main"/>
    <title>- Manage Pathologies</title>
    <asset:javascript src="feature/feature.crud.js"/>
</g:if>
<div class="card employee skui-tabular-content" id="employee-tab">
    <div class="card-header panel-header">
        <h5 class="card-title panel-title">Employee Register</h5>
        <div class="panel-options tab-action-container">
            <ui:basicTableFilter createBtn="true"/>
        </div>
    </div>
    <div class="card-body table-responsive tabular-body">
        <span class="label label-info">Showing ${items.size()} of ${count}</span>
        <table data-processing-url="${app.baseUrl()}setting/employee" class="table">
            <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Created</th>
                <th>Joined</th>
                <th>Phone</th>
                <th>User Id</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${items}" var="employee">
                <tr class="odd gradeX">
                    <td><span class="value">${employee.name}</span></td>
                    <td><span class="value">${employee.email}</span></td>
                    <td><span class="value">${employee.created.toAdminFormat()}</span></td>
                    <td><span class="value">${employee.joiningDate.toAdminFormat()}</span></td>
                    <td><span class="value">${employee.mobile}</span></td>
                    <td class="center"><span class="value">${employee.user?.userId}</span></td>
                    <td class="center"><span class="value">${employee.user?.role}</span></td>
                    <td class="action-navigator btn-group center" data-id="${employee.id}">
                        <span class="btn btn-sm btn-info edit" title="Edit"><i class="fas fa-edit"></i></span>
                        <span action="pay-salary" class="btn btn-sm btn-info" title="Pay Salary"><i class="fas fa-dollar-sign"></i></span>
                        <span action="pay-bonus" class="btn btn-sm btn-info" title="Pay Bonus"><i class="fas fa-plus-circle"></i></span>
                        <span action="payment-history" class="btn btn-sm btn-info" title="Payment History"><i class="fas fa-list-ul"></i></span>
                        <span class="btn btn-sm btn-warning remove" title="Delete"><i class="fas fa-trash-alt"></i></span>
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