<%@ page import="com.healthcare.util.AppUtil" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main"/>
    <title>- Manage Pathologies</title>
    <asset:javascript src="feature/feature.setting.js"/>
</g:if>
<div class="card services skui-tabular-content" id="service-setting-tab">
    <div class="card-header panel-header">
        <h5 class="card-title panel-title">Manage Pathologies</h5>
        <div class="row panel-options tab-action-container">
            <ui:basicTableFilter createBtn="true"/>
        </div>
    </div>
    <div class="card-body table-responsive tabular-body">
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