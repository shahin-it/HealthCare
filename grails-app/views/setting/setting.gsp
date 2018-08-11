<%@ page import="com.healthcare.DomainConstant" %>
<meta name="layout" content="_main">
<title>- Global Settings</title>
<div class="skui-tab row">
    <nav class="nav nav-tabs flex-column col-sm-2">
        <a class="nav-link active" data-toggle="tab" href="#home">General Settings</a>
        <a class="nav-link" data-toggle="tab" href="#dashboard">Dashboard</a>
        <a class="nav-link" data-toggle="tab" href="#accessControl">Access Control</a>
        <a class="nav-link" data-toggle="tab" href="#invoice">Invoice</a>
        <a class="nav-link" data-toggle="tab" href="#others">Others</a>
    </nav>
    <div class="tab-content col-sm-10">
        <div class="tab-pane active" id="home">
            <g:include controller="setting" action="loadSettings" params="[type: 'general']"/>
        </div>
        <div class="tab-pane" id="dashboard">
            Dashboard
        </div>
        <div class="tab-pane" id="accessControl">
            Access Control
        </div>
        <div class="tab-pane" id="invoice">
            <g:include controller="setting" action="loadSettings" params="[type: 'invoice']"/>
        </div>
        <div class="tab-pane" id="others">
            <g:include controller="setting" action="loadSettings" params="[type: 'others']"/>
        </div>
    </div>
</div>