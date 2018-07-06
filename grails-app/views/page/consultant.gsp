<%@ page import="com.healthcare.util.AppUtil" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main"/>
    <title>- Manage Test</title>
    <asset:javascript src="feature/feature.crud.js"/>
</g:if>
<div class="page-content consultants">
    <div class="content-box-large sui-tabular-content" id="consultant-tab">
        <div class="panel-heading">
            <div class="panel-title">Manage Consultants</div>
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