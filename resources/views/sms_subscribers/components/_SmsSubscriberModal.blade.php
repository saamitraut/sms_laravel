<!-- Modal -->
<div class="modal fade" id="basicModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Add sms_subscribers</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/sms_subscribers/add-sms_subscribers-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="FormNo">FormNo:</label>
        <input type="text" class="form-control" id="FormNo" name="FormNo">
    </div>
    <div class="form-group">
        
        <label for="CustomerId">CustomerId:</label>
        <input type="text" class="form-control" id="CustomerId" name="CustomerId">
    </div>
    <div class="form-group">
        
        <label for="OperatorId">OperatorId:</label>
        <input type="text" class="form-control" id="OperatorId" name="OperatorId">
    </div>
    <div class="form-group">
        
        <label for="SocietyId">SocietyId:</label>
        <input type="text" class="form-control" id="SocietyId" name="SocietyId">
    </div>
    <div class="form-group">
        
        <label for="MobileNo">MobileNo:</label>
        <input type="text" class="form-control" id="MobileNo" name="MobileNo">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="ProspectId">ProspectId:</label>
        <input type="text" class="form-control" id="ProspectId" name="ProspectId">
    </div>
    <div class="form-group">
        
        <label for="PCustomerId">PCustomerId:</label>
        <input type="text" class="form-control" id="PCustomerId" name="PCustomerId">
    </div>
    <div class="form-group">
        
        <label for="OpTobeBilled">OpTobeBilled:</label>
        <input type="text" class="form-control" id="OpTobeBilled" name="OpTobeBilled">
    </div>
    <div class="form-group">
        
        <label for="CreatedOn">CreatedOn:</label>
        <input type="text" class="form-control" id="CreatedOn" name="CreatedOn">
    </div>
    <div class="form-group">
        
        <label for="CreatedBy">CreatedBy:</label>
        <input type="text" class="form-control" id="CreatedBy" name="CreatedBy">
    </div>
    <div class="form-group">
        
        <label for="UpdatedOn">UpdatedOn:</label>
        <input type="text" class="form-control" id="UpdatedOn" name="UpdatedOn">
    </div>
    <div class="form-group">
        
        <label for="UpdatedBy">UpdatedBy:</label>
        <input type="text" class="form-control" id="UpdatedBy" name="UpdatedBy">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="sms_id">sms_id:</label>
        <input type="text" class="form-control" id="sms_id" name="sms_id">
    </div>
                </div >
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                        Close
                    </button>
                    <button type="submit" class="btn btn-primary">Save changes</button> </form>
                </div>
            </div>
        </div>
    </div>
<!-- Modal end -->