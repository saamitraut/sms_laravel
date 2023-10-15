@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">sms_subscriberaccounts</h4>

    @if(Session::has('message'))
    <div class="alert alert-success">
                        <strong><span class="glyphicon glyphicon-ok"></span>{{  Session::get('message') }}</strong>
                    </div>
    @endif
            <!--Button trigger modal -->
<button
    type="button"
    class="btn btn-primary"
    data-bs-toggle="modal"
    data-bs-target="#basicModal" style="margin-bottom: 15px"
>Add sms_subscriberaccounts </button>
<div class="btn - group" style="margin-bottom: 15px">
                          <button type = "button" class="btn btn-outline-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Pagination
                      </button>
                      
					  <ul id = "pagination_limit" class="dropdown-menu" style="">
                        <li><a value = "5" class="dropdown-item" href="javascript:void(0);">5</a></li>
                        <li><a value = "10" class="dropdown-item" href="javascript:void(0);">10</a></li>
                      </ul>
                    </div>
	<script>
    document.getElementById('pagination_limit').addEventListener('click', function(event) {
            if (event.target.nodeName === 'A') {
            window.location.href = '{{ Request::url() }}?pagination_limit=' + event.target.getAttribute('value');
        }
});
</script >
<!-- Modal -->
<div class="modal fade" id="basicModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Add sms_subscriberaccounts</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/sms_subscriberaccounts/add-sms_subscriberaccounts-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="SubscriberId">SubscriberId:</label>
        <input type="text" class="form-control" id="SubscriberId" name="SubscriberId">
    </div>
    <div class="form-group">
        
        <label for="ConnectionId">ConnectionId:</label>
        <input type="text" class="form-control" id="ConnectionId" name="ConnectionId">
    </div>
    <div class="form-group">
        
        <label for="IsPrimary">IsPrimary:</label>
        <input type="text" class="form-control" id="IsPrimary" name="IsPrimary">
    </div>
    <div class="form-group">
        
        <label for="ApplicableRate">ApplicableRate:</label>
        <input type="text" class="form-control" id="ApplicableRate" name="ApplicableRate">
    </div>
    <div class="form-group">
        
        <label for="TimeShift">TimeShift:</label>
        <input type="text" class="form-control" id="TimeShift" name="TimeShift">
    </div>
    <div class="form-group">
        
        <label for="PairingId">PairingId:</label>
        <input type="text" class="form-control" id="PairingId" name="PairingId">
    </div>
    <div class="form-group">
        
        <label for="BillingSMonth">BillingSMonth:</label>
        <input type="text" class="form-control" id="BillingSMonth" name="BillingSMonth">
    </div>
    <div class="form-group">
        
        <label for="ActivationDate">ActivationDate:</label>
        <input type="text" class="form-control" id="ActivationDate" name="ActivationDate">
    </div>
    <div class="form-group">
        
        <label for="DeactivationDate">DeactivationDate:</label>
        <input type="text" class="form-control" id="DeactivationDate" name="DeactivationDate">
    </div>
    <div class="form-group">
        
        <label for="ExpiryDate">ExpiryDate:</label>
        <input type="text" class="form-control" id="ExpiryDate" name="ExpiryDate">
    </div>
    <div class="form-group">
        
        <label for="Description">Description:</label>
        <input type="text" class="form-control" id="Description" name="Description">
    </div>
    <div class="form-group">
        
        <label for="ActionTaken">ActionTaken:</label>
        <input type="text" class="form-control" id="ActionTaken" name="ActionTaken">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" class="form-control" id="Status" name="Status">
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
    <div class="form-group">
        
        <label for="isblacklisted">isblacklisted:</label>
        <input type="text" class="form-control" id="isblacklisted" name="isblacklisted">
    </div>
    <div class="form-group">
        
        <label for="blacklistfilename">blacklistfilename:</label>
        <input type="text" class="form-control" id="blacklistfilename" name="blacklistfilename">
    </div>
    <div class="form-group">
        
        <label for="PrePaidFlag">PrePaidFlag:</label>
        <input type="text" class="form-control" id="PrePaidFlag" name="PrePaidFlag">
    </div>
    <div class="form-group">
        
        <label for="Acct_Type">Acct_Type:</label>
        <input type="text" class="form-control" id="Acct_Type" name="Acct_Type">
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
@if(count($sms_subscriberaccounts) > 0)	
        <nav aria-label="Page navigation">{{ $sms_subscriberaccounts->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($sms_subscriberaccounts as $sms_subscriberaccount)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>Id : {{$sms_subscriberaccount->Id}}</h5>
            <h5 class='card-title'>SubscriberId : {{$sms_subscriberaccount->SubscriberId}}</h5>
            <h5 class='card-title'>ConnectionId : {{$sms_subscriberaccount->ConnectionId}}</h5>
            <h5 class='card-title'>IsPrimary : {{$sms_subscriberaccount->IsPrimary}}</h5>
            <h5 class='card-title'>ApplicableRate : {{$sms_subscriberaccount->ApplicableRate}}</h5>
            <h5 class='card-title'>TimeShift : {{$sms_subscriberaccount->TimeShift}}</h5>
            <h5 class='card-title'>PairingId : {{$sms_subscriberaccount->PairingId}}</h5>
            <h5 class='card-title'>BillingSMonth : {{$sms_subscriberaccount->BillingSMonth}}</h5>
            <h5 class='card-title'>ActivationDate : {{$sms_subscriberaccount->ActivationDate}}</h5>
            <h5 class='card-title'>DeactivationDate : {{$sms_subscriberaccount->DeactivationDate}}</h5>
            <h5 class='card-title'>ExpiryDate : {{$sms_subscriberaccount->ExpiryDate}}</h5>
            <h5 class='card-title'>Description : {{$sms_subscriberaccount->Description}}</h5>
            <h5 class='card-title'>ActionTaken : {{$sms_subscriberaccount->ActionTaken}}</h5>
            <h5 class='card-title'>Status : {{$sms_subscriberaccount->Status}}</h5>
            <h5 class='card-title'>CreatedOn : {{$sms_subscriberaccount->CreatedOn}}</h5>
            <h5 class='card-title'>CreatedBy : {{$sms_subscriberaccount->CreatedBy}}</h5>
            <h5 class='card-title'>UpdatedOn : {{$sms_subscriberaccount->UpdatedOn}}</h5>
            <h5 class='card-title'>UpdatedBy : {{$sms_subscriberaccount->UpdatedBy}}</h5>
            <h5 class='card-title'>Deleted : {{$sms_subscriberaccount->Deleted}}</h5>
            <h5 class='card-title'>Remark : {{$sms_subscriberaccount->Remark}}</h5>
            <h5 class='card-title'>sms_id : {{$sms_subscriberaccount->sms_id}}</h5>
            <h5 class='card-title'>isblacklisted : {{$sms_subscriberaccount->isblacklisted}}</h5>
            <h5 class='card-title'>blacklistfilename : {{$sms_subscriberaccount->blacklistfilename}}</h5>
            <h5 class='card-title'>PrePaidFlag : {{$sms_subscriberaccount->PrePaidFlag}}</h5>
            <h5 class='card-title'>Acct_Type : {{$sms_subscriberaccount->Acct_Type}}</h5><a class='card-link' href='{{ Request::root() }}/sms_subscriberaccounts/change-status-sms_subscriberaccounts/{{ $sms_subscriberaccount->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($sms_subscriberaccount->status == 0)
                         {{ 'Activate' }}
                     @else
                         {{ 'Deactivate' }}
                     @endif
                 </a>
                 <a
                     data-bs-toggle='modal'
                     data-bs-target='#basicModall{{ $i }}'
                     class='card-link'
                     href='#'
                 >
                     Edit
                 </a>
                 <a
                     class='card-link'
                     href='{{ Request::root() }}/sms_subscriberaccounts/delete-sms_subscriberaccounts/{{ $sms_subscriberaccount->id }}'
                     onclick='return confirm('Are you sure to delete?')'
                 >
                     <i class='bx bx-trash me-1'></i> Delete
                 </a>
             </div>
         </div>
         
<!-- Modal edit starts -->
<div class='modal fade' id='basicModall{{ $i }}' tabindex='-1' aria-hidden='true'>
    <div class='modal-dialog' role='document'>
        <div class='modal-content'>
            <div class='modal-header'>
                <h5 class='modal-title' id='exampleModalLabel1'>Edit sms_subscriberaccounts</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/sms_subscriberaccounts/edit-sms_subscriberaccounts-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $sms_subscriberaccount->id ?>'   name='sms_subscriberaccounts_id'>

    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" value="{{ $sms_subscriberaccount->Id}}" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="SubscriberId">SubscriberId:</label>
        <input type="text" value="{{ $sms_subscriberaccount->SubscriberId}}" class="form-control" id="SubscriberId" name="SubscriberId">
    </div>
    <div class="form-group">
        
        <label for="ConnectionId">ConnectionId:</label>
        <input type="text" value="{{ $sms_subscriberaccount->ConnectionId}}" class="form-control" id="ConnectionId" name="ConnectionId">
    </div>
    <div class="form-group">
        
        <label for="IsPrimary">IsPrimary:</label>
        <input type="text" value="{{ $sms_subscriberaccount->IsPrimary}}" class="form-control" id="IsPrimary" name="IsPrimary">
    </div>
    <div class="form-group">
        
        <label for="ApplicableRate">ApplicableRate:</label>
        <input type="text" value="{{ $sms_subscriberaccount->ApplicableRate}}" class="form-control" id="ApplicableRate" name="ApplicableRate">
    </div>
    <div class="form-group">
        
        <label for="TimeShift">TimeShift:</label>
        <input type="text" value="{{ $sms_subscriberaccount->TimeShift}}" class="form-control" id="TimeShift" name="TimeShift">
    </div>
    <div class="form-group">
        
        <label for="PairingId">PairingId:</label>
        <input type="text" value="{{ $sms_subscriberaccount->PairingId}}" class="form-control" id="PairingId" name="PairingId">
    </div>
    <div class="form-group">
        
        <label for="BillingSMonth">BillingSMonth:</label>
        <input type="text" value="{{ $sms_subscriberaccount->BillingSMonth}}" class="form-control" id="BillingSMonth" name="BillingSMonth">
    </div>
    <div class="form-group">
        
        <label for="ActivationDate">ActivationDate:</label>
        <input type="text" value="{{ $sms_subscriberaccount->ActivationDate}}" class="form-control" id="ActivationDate" name="ActivationDate">
    </div>
    <div class="form-group">
        
        <label for="DeactivationDate">DeactivationDate:</label>
        <input type="text" value="{{ $sms_subscriberaccount->DeactivationDate}}" class="form-control" id="DeactivationDate" name="DeactivationDate">
    </div>
    <div class="form-group">
        
        <label for="ExpiryDate">ExpiryDate:</label>
        <input type="text" value="{{ $sms_subscriberaccount->ExpiryDate}}" class="form-control" id="ExpiryDate" name="ExpiryDate">
    </div>
    <div class="form-group">
        
        <label for="Description">Description:</label>
        <input type="text" value="{{ $sms_subscriberaccount->Description}}" class="form-control" id="Description" name="Description">
    </div>
    <div class="form-group">
        
        <label for="ActionTaken">ActionTaken:</label>
        <input type="text" value="{{ $sms_subscriberaccount->ActionTaken}}" class="form-control" id="ActionTaken" name="ActionTaken">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" value="{{ $sms_subscriberaccount->Status}}" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="CreatedOn">CreatedOn:</label>
        <input type="text" value="{{ $sms_subscriberaccount->CreatedOn}}" class="form-control" id="CreatedOn" name="CreatedOn">
    </div>
    <div class="form-group">
        
        <label for="CreatedBy">CreatedBy:</label>
        <input type="text" value="{{ $sms_subscriberaccount->CreatedBy}}" class="form-control" id="CreatedBy" name="CreatedBy">
    </div>
    <div class="form-group">
        
        <label for="UpdatedOn">UpdatedOn:</label>
        <input type="text" value="{{ $sms_subscriberaccount->UpdatedOn}}" class="form-control" id="UpdatedOn" name="UpdatedOn">
    </div>
    <div class="form-group">
        
        <label for="UpdatedBy">UpdatedBy:</label>
        <input type="text" value="{{ $sms_subscriberaccount->UpdatedBy}}" class="form-control" id="UpdatedBy" name="UpdatedBy">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" value="{{ $sms_subscriberaccount->Deleted}}" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $sms_subscriberaccount->Remark}}" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="sms_id">sms_id:</label>
        <input type="text" value="{{ $sms_subscriberaccount->sms_id}}" class="form-control" id="sms_id" name="sms_id">
    </div>
    <div class="form-group">
        
        <label for="isblacklisted">isblacklisted:</label>
        <input type="text" value="{{ $sms_subscriberaccount->isblacklisted}}" class="form-control" id="isblacklisted" name="isblacklisted">
    </div>
    <div class="form-group">
        
        <label for="blacklistfilename">blacklistfilename:</label>
        <input type="text" value="{{ $sms_subscriberaccount->blacklistfilename}}" class="form-control" id="blacklistfilename" name="blacklistfilename">
    </div>
    <div class="form-group">
        
        <label for="PrePaidFlag">PrePaidFlag:</label>
        <input type="text" value="{{ $sms_subscriberaccount->PrePaidFlag}}" class="form-control" id="PrePaidFlag" name="PrePaidFlag">
    </div>
    <div class="form-group">
        
        <label for="Acct_Type">Acct_Type:</label>
        <input type="text" value="{{ $sms_subscriberaccount->Acct_Type}}" class="form-control" id="Acct_Type" name="Acct_Type">
    </div>

      </div>
      <div class='modal-footer'>
        <button type='button' class='btn btn-outline-secondary' data-bs-dismiss='modal'>
          Close
        </button>
        <button type='submit' class='btn btn-primary'>Save changes</button> </form>
      </div>
    </div>
  </div>
</div>
<!-- Modal edit ends -->

    <!-- ... (rest of the card content) ... -->
    <?php $i++; ?>
@endforeach
@else
<div class='alert alert-info' role='alert'>
    <strong>No sms_subscriberaccountss Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')