<div class="modal fade" id="send_invitation" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="panel-group">
            <div class="panel panel-default">
                <div class="panel-heading">Send Invitation</div>
                <div class="panel-body">
                    <g:formRemote url="[controller: 'invitation', action: 'index', params: params]" method="post" name="invitation">
                    <div class="row">
                        <div class="col-md-4">
                            <label>Email</label>
                        </div>
                        <div class="col-md-8">
                            <input type="text" name="email" placeholder="Email" required/>
                        </div>
                    </div>
                    <!--row-->
                    <div class="row">
                        <div class="col-md-4">
                            <label>Topic</label>
                        </div>
                        <div class="col-md-8" id="topicInvitation">
                            <g:select id="topicselector" name="topicId" from="${topicList}" optionValue="name" optionKey="id" />
                        </div>
                    </div>
                    <!--row-->
                    <div class="row">
                        <div class="col-md-3 col-md-offset-3">
                            <input class="save btn btn-primary" type="submit" value="Submit" onclick="$('#send_invitation').modal('hide')"/>
                        </div>
                        <div class="col-md-3">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!--row-->
                    </g:formRemote>
                </div>
            </div>
        </div>
    </div>
</div>