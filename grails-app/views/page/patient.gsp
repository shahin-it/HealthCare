<%@ page import="com.healthcare.util.AppUtil" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main"/>
    <title>- Manage Test</title>
    <asset:javascript src="feature/feature.crud.js"/>
</g:if>
<div class="page-content patients">
    <div class="content-box-large sui-tabular-content" id="patient-tab">
        <div class="panel-heading">
            <div class="panel-title">Manage Patients</div>
            <div class="panel-options tab-action-container">
                <div class="filter-form">
                    <input type="text" class="form-control" placeholder="Search anything"/><button class="btn btn-primary glyphicon glyphicon-search"></button>
                </div>
                <button class="add-new-button btn btn-default"><i class="glyphicon glyphicon-plus"></i> Add</button>
            </div>
        </div>
        <div class="panel-body table-responsive tabular-body">
            <span class="label label-info">Showing ${items.size()} of ${count}</span>
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
                            <span class="btn btn-xs btn-info edit" title="Edit"><i class="glyphicon glyphicon-edit"></i></span>
                            <span class="btn btn-xs btn-warning remove" title="Remove"><i class="glyphicon glyphicon-trash"></i></span>
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