<div class="modal fade" id="send_invitation" role="dialog">
    <div class="modal-dialog modal-body">
        <div class="panel-group">
            <div class="panel panel-success">
                <div class="panel-heading">Send Invitation</div>
                <div class="panel-body" style="padding: 0px 15px;">
                    <g:formRemote url="[controller: 'invitation', action: 'index', params: params]" method="post" name="invitation">
                    <div class="row mt10">
                        <div class="col-md-4">
                            <label>Email</label>
                        </div>
                        <div class="col-md-8">
                            <input type="text" name="email" placeholder="Email" class="myWidth" required/>
                        </div>
                    </div>
                    <!--row-->
                    <div class="row mt10">
                        <div class="col-md-4">
                            <label>Topic</label>
                        </div>
                        <div class="col-md-8" id="topicInvitation">
                            <g:select id="topicselector" name="topicId" from="${topicList}" optionValue="name" optionKey="id" />
                        </div>
                    </div>
                    <!--row-->
                    <div class="row mt10 mb10">
                        <div class="col-md-3 col-md-offset-3">
                            <input class="save btn btn-success" type="submit" value="Submit" onclick="$('#send_invitation').modal('hide')"/>
                        </div>
                        <div class="col-md-3">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!--row-->
                    </g:formRemote>
                </div>
            </div>
        </div>
    </div>
</div>