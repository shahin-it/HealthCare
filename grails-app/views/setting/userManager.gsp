<%@ page import="com.healthcare.util.AppUtil" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main"/>
    <title>- Manage Pathologies</title>
    <asset:javascript src="feature/feature.setting.js"/>
</g:if>
<div class="card skui-tabular-content services" id="user-setting-tab">
    <div class="card-header panel-header">
        <h5 class="card-title panel-title">Manage Users</h5>
        <div class="row panel-options tab-action-container">
            <ui:basicTableFilter createBtn="true"/>
        </div>
    </div>

    <div class="card-body table-responsive tabular-body">
        <span class="label label-info">Showing ${items.size()} of ${count}</span>
        <table data-processing-url="${app.baseUrl()}setting/userManager" class="table">
            <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Created</th>
                <th>Phone</th>
                <th>User Id</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${items}" var="user">
                <tr class="odd gradeX">
                    <td><span class="value">${user.name}</span></td>
                    <td><span class="value">${user.email}</span></td>
                    <td><span class="value">${user.created.toAdminFormat()}</span></td>
                    <td><span class="value">${user.mobile}</span></td>
                    <td class="center"><span class="value">${user.userId}</span></td>
                    <td class="center"><span class="value">${user.role}</span></td>
                    <td class="action-navigator btn-group center" data-id="${user.id}">
                        <span class="btn btn-sm btn-info edit"><i class="fas fa-edit"></i></span>
                        <span class="btn btn-sm btn-warning remove"><i class="fas fa-trash-alt"></i></span>
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