<div class="modal fade" id="edit_resource" role="dialog">
    <div class="modal-dialog modal-body">
        <div class="container-fluid">
            <div class="panel-group">
                <div class="panel panel-success">
                    <div class="panel-heading">Update Resource</div>
                    <div class="panel-body" style="padding: 0px 15px;">
                        <g:uploadForm name="edit resource"
                                      url="[controller: 'resource', action: 'createOrUpdateResource', params: params]"
                                      enctype="multipart/form-data"
                                      method="post" onSuccess="alert('Resource Added'); location.reload(true)"
                                        onsubmit="alert('Resource Added'); location.reload(true)"
                        >
                            <div class="row mt10">
                                <div class="col-md-4">
                                    <g:if test="${myResource.urlPath}">
                                        <label>Link</label>
                                    </g:if>
                                    <g:else>
                                        <label>Document</label>
                                    </g:else>
                                </div>
                                <input type="text" style="display: none" name="type" value="${type}">
                                <input type="text" style="display: none" name="resourceId" value="${myResource.id}">

                                <div class="col-md-8">
                                    <g:if test="${myResource.urlPath}">
                                        <input type="text" class="myWidth" name="url" placeholder="Resource URL" value="${myResource.urlPath}" required/>
                                    </g:if>
                                    <g:else>
                                        <input type="file" name="mydocument" class="myWidth" required/>
                                    </g:else>
                                </div>
                            </div>
                            <!--row-->
                            <div class="row mt10">
                                <div class="col-md-4">
                                    <label>Description</label>
                                </div>

                                <div class="col-md-8">
                                    <textarea name="description" class="myWidth">${myResource.description}</textarea>
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
                                    optionKey="id"
                                />
                                </div>
                            </div>
                            <!--row-->
                            <div class="row mt10 mb10">
                                <div class="col-md-3 col-md-offset-3">
                                    <input class="save btn btn-primary" type="submit" value="Update"
                                           onsubmit="$('#edit_resource').modal('hide')"/>
                                </div>

                                <div class="col-md-3">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                            <!--row-->
                        </g:uploadForm>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>