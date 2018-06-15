<%@ page import="com.healthcare.util.AppUtil" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main"/>
    <title>- Manage Pathologies</title>
    <asset:javascript src="feature/feature.service.js"/>
</g:if>
<div class="page-content services">
    <div class="content-box-large sui-tabular-content" id="service-setting-tab">
        <div class="panel-heading">
            <div class="panel-title">Manage Pathologies</div>
            <div class="panel-options tab-action-container">
                <div class="search-form">
                    <input class="form-control" placeholder="Search anything"/><button class="btn btn-primary glyphicon glyphicon-search"></button>
                </div>
                <button class="add-new-button btn btn-default"><i class="glyphicon glyphicon-plus"></i> Add</button>
            </div>
        </div>
        <div class="panel-body table-responsive tabular-body">
            <span class="label label-info">Showing ${items.size()} of ${count}</span>
            <table data-processing-url="${app.baseUrl()}setting/services" class="table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Instruction</th>
                    <th>Created</th>
                    <th>Price</th>
                    <th>Cost</th>
                    <th>Discount</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${items}" var="service">
                    <tr class="odd gradeX">
                        <td><span class="value">${service.name}</span></td>
                        <td><span class="value">${service.instruction}</span></td>
                        <td><span class="value">${service.created.toAdminFormat()}</span></td>
                        <td><span class="value">${service.basePrice}</span></td>
                        <td class="center"><span class="value">${service.costPrice}</span></td>
                        <td class="center"><span class="value">${service.discount ?: 0}${service.discountType}</span></td>
                        <td class="action-navigator btn-group center" data-id="${service.id}">
                            <span class="btn btn-xs btn-info edit"><i class="glyphicon glyphicon-edit"></i></span>
                            <span class="btn btn-xs btn-warning remove"><i class="glyphicon glyphicon-trash"></i></span>
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