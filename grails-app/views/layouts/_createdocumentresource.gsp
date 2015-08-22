<div class="modal fade" id="create_document_resource" role="dialog">
    <div class="modal-dialog modal-body">
        <div class="panel-group">
            <div class="panel panel-success">
                <div class="panel-heading">Create Document Resource</div>
                <div class="panel-body" style="padding: 0px 15px;">
                        <g:uploadForm controller="resource" action="createResource" method="post" enctype="multipart/form-data"
                                      onSuccess="alert('Resource Added'); location.reload(true)">
                            <fieldset class="form">
                                <div class="row mt10">
                                    <div class="col-md-4">
                                        <label>Document</label>
                                    </div>

                                    <div class="col-md-8">
                                        <input type="file" name="mydocument" class="myWidth" required/>
                                    </div>
                                </div>
                                <!--row-->
                                <div class="row mt10">
                                    <div class="col-md-4">
                                        <label>Description</label>
                                    </div>

                                    <div class="col-md-8">
                                        <textarea name="description" class="myWidth"></textarea>
                                    </div>
                                </div>
                                <!--row-->
                                <div class="row mt10">
                                    <div class="col-md-4">
                                        <label>Topic</label>
                                    </div>

                                    <div class="col-md-8">

                                        <g:select name="topicid"
                                                  from="${topicList}"
                                                  optionValue="name"
                                                  optionKey="id"/>

                                    </div>
                                </div>
                                <!--row-->
                                <div class="row mt10 mb10">
                                    <div class="col-md-3 col-md-offset-3">
                                        <input class="save btn btn-success" type="submit" value="Submit"
                                               onclick="$('#create_link_resource').modal('hide')"/>
                                    </div>

                                    <div class="col-md-3">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                                <!--row-->
                        </fieldset>
                    </g:uploadForm>
                </div>
            </div>
        </div>
    </div>
</div>