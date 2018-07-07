<div class="silent-login-popup modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Your Session Expired!</h4>
            </div>
            <div class="modal-body">
                <div class="row silent-login-popup" style="height: 300px">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="login-wrapper">
                            <div class="box">
                                <g:include view="template/loginForm.gsp"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


%{--
<div class="row silent-login-popup" style="height: 300px">
    <div class="col-md-4 col-md-offset-4">
        <div class="login-wrapper">
            <div class="box">
                <g:include view="template/loginForm.gsp"/>
            </div>
        </div>
    </div>
</div>--}%
