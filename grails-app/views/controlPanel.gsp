<%@ page import="com.healthcare.DomainConstant; com.healthcare.crm.Employee; com.healthcare.pathology.Service; com.healthcare.pathology.Order; com.healthcare.crm.Consultant; com.healthcare.Patient; grails.converters.JSON" %>
<g:if test="${!params.ajax}">
    <meta name="layout" content="_main"/>
    <asset:javascript src="vendor/Chart.bundle.min.js"/>
    <asset:javascript src="dashboard.js"/>
</g:if>
<div class="page-content control-panel">
    <div class="row">
        <div class="col-md-7">
            <div class="card">
                <div class="card-header">
                    <h6 class="card-title float-left">Latest Test Assignment</h6>
                    <div class="card-link float-right">
                        <g:link controller="page" action="pathology" title="View All" data-rel="collapse"><i class="fas fa-info-circle"></i> View All</g:link>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Patient</th>
                            <th>Amount</th>
                            <th>Paid</th>
                            <th>Due</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${reports.latestOrder}" var="order">
                            <tr>
                                <td>${order.id}</td>
                                <td>${order.patient.name}</td>
                                <td>${order.grandTotal.toPrice()}</td>
                                <td>${order.paid.toPrice()}</td>
                                <td>${order.due.toPrice()}</td>
                                <td><span class="btn-sm value btn-${DomainConstant.statusUiClass(order.paymentStatus)}">${order.paymentStatus}</span></td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-5 panel-warning">
            <div class="card">
                <div class="card-header">
                    <h6 class="card-title float-left">Over-all Status</h6>
                    <div class="card-link float-right">
                        <a href="#" data-rel="collapse"><i class="fas fa-sync-alt"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between">Number of Inhouse Consultant<span class="badge badge-primary badge-pill">${Consultant.countByIsInHouse(true)}</span></li>
                        <li class="list-group-item d-flex justify-content-between">Number of Patient Served<span class="badge badge-primary badge-pill">${Patient.count}</span></li>
                        <li class="list-group-item d-flex justify-content-between">Number of Order/Report Delivered<span class="badge badge-primary badge-pill">${Order.countByDeliveryStatus("DELIVERED")}</span></li>
                        <li class="list-group-item d-flex justify-content-between">Number of Service Available<span class="badge badge-primary badge-pill">${Service.countByIsActive(true)}</span></li>
                        <li class="list-group-item d-flex justify-content-between">Number of Employee<span class="badge badge-primary badge-pill">${Employee.count}</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-7">
            <div class="card">
                <div class="card-body">
                    <canvas class="canvas" data-data="${reports.testChart as JSON}" id="sell-by-month-chart" height="165" style="display: block;"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <canvas class="canvas" data-data="${reports.orderStatus as JSON}" id="order-status-chart" height="250" style="display: block;"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>