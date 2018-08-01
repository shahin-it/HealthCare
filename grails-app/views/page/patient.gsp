<%@ page import="com.healthcare.util.AppUtil" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main"/>
    <title>- Manage Test</title>
    <asset:javascript src="feature/feature.crud.js"/>
</g:if>
<div class="page-content patients">
    <div class="card sui-tabular-content" id="patient-tab">
        <div class="card-header panel-header row">
            <h5 class="panel-title col-sm-4">Manage Patients</h5>
            <div class="tab-action-container col-sm-8">
                <ui:basicTableFilter createBtn="true"/>
            </div>
        </div>
        <div class="card-body panel-body table-responsive tabular-body">
            <span class="label label-info">Showing ${items.size()} of ${count}</span>
            <ul class="pagination pagination-sm float-right" data-count="${count ?: 0}"></ul>
            <table class="table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Father Name</th>
                    <th>Spouse Name</th>
                    <th>Gender</th>
                    <th>Mobile</th>
                    <th>Created</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${items}" var="patient">
                    <tr class="odd gradeX">
                        <td><span class="value">${patient.name}</span></td>
                        <td><span class="value">${patient.fatherName}</span></td>
                        <td><span class="value">${patient.spouseName}</span></td>
                        <td><span class="value">${patient.sex}</span></td>
                        <td><span class="value">${patient.mobile}</span></td>
                        <td><span class="value">${patient.created.toAdminFormat()}</span></td>
                        <td class="action-navigator btn-group center" data-id="${patient.id}">
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
</div>