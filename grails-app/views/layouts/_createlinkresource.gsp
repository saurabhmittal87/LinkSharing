<div class="modal fade" id="create_link_resource" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="panel-group">
            <div class="panel panel-default">
                <div class="panel-heading">Create Topic</div>
                <div class="panel-body">
                    <g:formRemote name="topiccreate" url="[controller: 'topic', action: 'createtopic',params: params]" method="post" onSuccess="alert('Topic Added')">
                        <div class="row">
                            <div class="col-md-4">
                                <label>Link</label>
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="link" placeholder="Resource URL" required/>
                            </div>
                        </div>
                        <!--row-->
                        <div class="row">
                            <div class="col-md-4">
                                <label>Description</label>
                            </div>
                            <div class="col-md-8">
                                <textarea></textarea>
                            </div>
                        </div>
                        <!--row-->
                        <div class="row">
                            <div class="col-md-4">
                                <label>Topic</label>
                            </div>
                            <div class="col-md-8">
                                <select>
                                    <option>1</option>
                                    <option>2</option>
                                </select>
                            </div>
                        </div>
                        <!--row-->
                        <div class="row">
                            <div class="col-md-3 col-md-offset-3">
                                <input class="save btn btn-primary" type="submit" value="Submit" onclick="$('#create_topic').modal('hide')" />
                                %{--<button type="button" class="btn btn-primary">Submit</button>--}%
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