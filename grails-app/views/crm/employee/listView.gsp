<%@ page import="com.healthcare.util.AppUtil" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main"/>
    <title>- Manage Pathologies</title>
    <asset:javascript src="feature/feature.crud.js"/>
</g:if>
<div class="page-content services">
    <div class="content-box-large sui-tabular-content" id="employee-tab">
        <div class="panel-heading">
            <div class="panel-title">Employee Register</div>
            <div class="row panel-options tab-action-container">
                <ui:basicTableFilter/>
                <button class="add-new-button btn btn-sm btn-default"><i class="fas fa-plus"></i> Add</button>
            </div>
        </div>
        <div class="panel-body table-responsive tabular-body">
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
                            <span action="pay-bonus" class="btn btn-sm btn-info" title="Pay Bonus"><i class="fas fa-envira"></i></span>
                            <span action="payment-history" class="btn btn-sm btn-info" title="Payment History"><i class="fas fa-list-ul"></i></span>
                            <span class="btn btn-sm btn-warning remove" title="Delete"><i class="fas fa-trash-alt"></i></span>
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