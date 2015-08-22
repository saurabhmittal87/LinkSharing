<div class="modal fade" id="create_topic" role="dialog">
    <div class="modal-dialog modal-body">
        <div class="panel-group">
            <div class="panel panel-success">
                <div class="panel-heading">Create Topic</div>
                <div class="panel-body" style="padding: 0px 15px;">
                    <g:formRemote name="topiccreate" url="[controller: 'topic', action: 'createTopic',params: params]" method="post" onSuccess="alert('Topic Added')">
                        <div class="row mt10">
                            <div class="col-md-4">
                                <label>Name</label>
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="topicname" class="myWidth" placeholder="Topic Name" required/>
                            </div>
                        </div>
                        <!--row-->
                        <div class="row mt10">
                            <div class="col-md-4">
                                <label>Topic</label>
                            </div>
                            <div class="col-md-8">
                                <g:select name="topicVisibility" from="${global.MyEnum.Visibility}"></g:select>
                                %{--<select name="topicVisibility">--}%
                                    %{--<option>Public</option>--}%
                                    %{--<option>Private</option>--}%
                                %{--</select>--}%
                            </div>
                        </div>
                        <!--row-->
                        <div class="row mt10 mb10">
                            <div class="col-md-3 col-md-offset-3">
                                <input class="save btn btn-success" type="submit" value="Submit" onclick="$('#create_topic').modal('hide')" />
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