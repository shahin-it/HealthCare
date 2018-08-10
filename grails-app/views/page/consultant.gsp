<%@ page import="com.healthcare.util.AppUtil" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main"/>
    <title>- Manage Test</title>
    <asset:javascript src="feature/feature.crud.js"/>
</g:if>
<div class="card consultants skui-tabular-content" id="consultant-tab">
    <div class="card-header panel-header">
        <h5 class="card-title panel-title">Manage Consultants</h5>
        <div class="tab-action-container panel-options">
            <ui:basicTableFilter createBtn="true"/>
        </div>
    </div>
    <div class="card-body table-responsive tabular-body">
        <span class="label label-info">Showing ${items.size()} of ${count}</span>
        <table class="table">
            <thead>
            <tr>
                <th>Name</th>
                <th>Phone</th>
                <th>Designation</th>
                <th>Qualification</th>
                <th>Gender</th>
                <th>Visiting Fee</th>
                <th>Created</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${items}" var="consultant">
                <tr class="odd gradeX">
                    <td><span class="value">${consultant.name}</span></td>
                    <td><span class="value">${consultant.mobile}</span></td>
                    <td><span class="value">${consultant.designation}</span></td>
                    <td><span class="value">${consultant.qualification}</span></td>
                    <td><span class="value">${consultant.sex}</span></td>
                    <td><span class="value">${consultant.visitingFee}</span></td>
                    <td><span class="value">${consultant.created.toAdminFormat()}</span></td>
                    <td class="action-navigator btn-group center" data-id="${consultant.id}">
                        <span class="btn btn-sm btn-info edit" title="Edit"><i class="fas fa-edit"></i></span>
                        <span class="btn btn-sm btn-warning remove" title="Remove"><i class="fas fa-trash-alt"></i></span>
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