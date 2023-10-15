@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">sms_smartcards</h4>

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
>Add sms_smartcards </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add sms_smartcards</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/sms_smartcards/add-sms_smartcards-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="SmartcardNo">SmartcardNo:</label>
        <input type="text" class="form-control" id="SmartcardNo" name="SmartcardNo">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="BrandId">BrandId:</label>
        <input type="text" class="form-control" id="BrandId" name="BrandId">
    </div>
    <div class="form-group">
        
        <label for="UploadLogId">UploadLogId:</label>
        <input type="text" class="form-control" id="UploadLogId" name="UploadLogId">
    </div>
    <div class="form-group">
        
        <label for="DocExtension">DocExtension:</label>
        <input type="text" class="form-control" id="DocExtension" name="DocExtension">
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
        
        <label for="IsLocked">IsLocked:</label>
        <input type="text" class="form-control" id="IsLocked" name="IsLocked">
    </div>
    <div class="form-group">
        
        <label for="LockedOn">LockedOn:</label>
        <input type="text" class="form-control" id="LockedOn" name="LockedOn">
    </div>
    <div class="form-group">
        
        <label for="LockedFrom">LockedFrom:</label>
        <input type="text" class="form-control" id="LockedFrom" name="LockedFrom">
    </div>
    <div class="form-group">
        
        <label for="sms_id">sms_id:</label>
        <input type="text" class="form-control" id="sms_id" name="sms_id">
    </div>
    <div class="form-group">
        
        <label for="PONumber">PONumber:</label>
        <input type="text" class="form-control" id="PONumber" name="PONumber">
    </div>
    <div class="form-group">
        
        <label for="PODate">PODate:</label>
        <input type="text" class="form-control" id="PODate" name="PODate">
    </div>
    <div class="form-group">
        
        <label for="InvNumber">InvNumber:</label>
        <input type="text" class="form-control" id="InvNumber" name="InvNumber">
    </div>
    <div class="form-group">
        
        <label for="InvDate">InvDate:</label>
        <input type="text" class="form-control" id="InvDate" name="InvDate">
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
@if(count($sms_smartcards) > 0)	
        <nav aria-label="Page navigation">{{ $sms_smartcards->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($sms_smartcards as $sms_smartcard)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>Id : {{$sms_smartcard->Id}}</h5>
            <h5 class='card-title'>SmartcardNo : {{$sms_smartcard->SmartcardNo}}</h5>
            <h5 class='card-title'>Status : {{$sms_smartcard->Status}}</h5>
            <h5 class='card-title'>BrandId : {{$sms_smartcard->BrandId}}</h5>
            <h5 class='card-title'>UploadLogId : {{$sms_smartcard->UploadLogId}}</h5>
            <h5 class='card-title'>DocExtension : {{$sms_smartcard->DocExtension}}</h5>
            <h5 class='card-title'>CreatedOn : {{$sms_smartcard->CreatedOn}}</h5>
            <h5 class='card-title'>CreatedBy : {{$sms_smartcard->CreatedBy}}</h5>
            <h5 class='card-title'>UpdatedOn : {{$sms_smartcard->UpdatedOn}}</h5>
            <h5 class='card-title'>UpdatedBy : {{$sms_smartcard->UpdatedBy}}</h5>
            <h5 class='card-title'>Deleted : {{$sms_smartcard->Deleted}}</h5>
            <h5 class='card-title'>Remark : {{$sms_smartcard->Remark}}</h5>
            <h5 class='card-title'>IsLocked : {{$sms_smartcard->IsLocked}}</h5>
            <h5 class='card-title'>LockedOn : {{$sms_smartcard->LockedOn}}</h5>
            <h5 class='card-title'>LockedFrom : {{$sms_smartcard->LockedFrom}}</h5>
            <h5 class='card-title'>sms_id : {{$sms_smartcard->sms_id}}</h5>
            <h5 class='card-title'>PONumber : {{$sms_smartcard->PONumber}}</h5>
            <h5 class='card-title'>PODate : {{$sms_smartcard->PODate}}</h5>
            <h5 class='card-title'>InvNumber : {{$sms_smartcard->InvNumber}}</h5>
            <h5 class='card-title'>InvDate : {{$sms_smartcard->InvDate}}</h5><a class='card-link' href='{{ Request::root() }}/sms_smartcards/change-status-sms_smartcards/{{ $sms_smartcard->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($sms_smartcard->status == 0)
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
                     href='{{ Request::root() }}/sms_smartcards/delete-sms_smartcards/{{ $sms_smartcard->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit sms_smartcards</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/sms_smartcards/edit-sms_smartcards-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $sms_smartcard->id ?>'   name='sms_smartcards_id'>

    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" value="{{ $sms_smartcard->Id}}" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="SmartcardNo">SmartcardNo:</label>
        <input type="text" value="{{ $sms_smartcard->SmartcardNo}}" class="form-control" id="SmartcardNo" name="SmartcardNo">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" value="{{ $sms_smartcard->Status}}" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="BrandId">BrandId:</label>
        <input type="text" value="{{ $sms_smartcard->BrandId}}" class="form-control" id="BrandId" name="BrandId">
    </div>
    <div class="form-group">
        
        <label for="UploadLogId">UploadLogId:</label>
        <input type="text" value="{{ $sms_smartcard->UploadLogId}}" class="form-control" id="UploadLogId" name="UploadLogId">
    </div>
    <div class="form-group">
        
        <label for="DocExtension">DocExtension:</label>
        <input type="text" value="{{ $sms_smartcard->DocExtension}}" class="form-control" id="DocExtension" name="DocExtension">
    </div>
    <div class="form-group">
        
        <label for="CreatedOn">CreatedOn:</label>
        <input type="text" value="{{ $sms_smartcard->CreatedOn}}" class="form-control" id="CreatedOn" name="CreatedOn">
    </div>
    <div class="form-group">
        
        <label for="CreatedBy">CreatedBy:</label>
        <input type="text" value="{{ $sms_smartcard->CreatedBy}}" class="form-control" id="CreatedBy" name="CreatedBy">
    </div>
    <div class="form-group">
        
        <label for="UpdatedOn">UpdatedOn:</label>
        <input type="text" value="{{ $sms_smartcard->UpdatedOn}}" class="form-control" id="UpdatedOn" name="UpdatedOn">
    </div>
    <div class="form-group">
        
        <label for="UpdatedBy">UpdatedBy:</label>
        <input type="text" value="{{ $sms_smartcard->UpdatedBy}}" class="form-control" id="UpdatedBy" name="UpdatedBy">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" value="{{ $sms_smartcard->Deleted}}" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $sms_smartcard->Remark}}" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="IsLocked">IsLocked:</label>
        <input type="text" value="{{ $sms_smartcard->IsLocked}}" class="form-control" id="IsLocked" name="IsLocked">
    </div>
    <div class="form-group">
        
        <label for="LockedOn">LockedOn:</label>
        <input type="text" value="{{ $sms_smartcard->LockedOn}}" class="form-control" id="LockedOn" name="LockedOn">
    </div>
    <div class="form-group">
        
        <label for="LockedFrom">LockedFrom:</label>
        <input type="text" value="{{ $sms_smartcard->LockedFrom}}" class="form-control" id="LockedFrom" name="LockedFrom">
    </div>
    <div class="form-group">
        
        <label for="sms_id">sms_id:</label>
        <input type="text" value="{{ $sms_smartcard->sms_id}}" class="form-control" id="sms_id" name="sms_id">
    </div>
    <div class="form-group">
        
        <label for="PONumber">PONumber:</label>
        <input type="text" value="{{ $sms_smartcard->PONumber}}" class="form-control" id="PONumber" name="PONumber">
    </div>
    <div class="form-group">
        
        <label for="PODate">PODate:</label>
        <input type="text" value="{{ $sms_smartcard->PODate}}" class="form-control" id="PODate" name="PODate">
    </div>
    <div class="form-group">
        
        <label for="InvNumber">InvNumber:</label>
        <input type="text" value="{{ $sms_smartcard->InvNumber}}" class="form-control" id="InvNumber" name="InvNumber">
    </div>
    <div class="form-group">
        
        <label for="InvDate">InvDate:</label>
        <input type="text" value="{{ $sms_smartcard->InvDate}}" class="form-control" id="InvDate" name="InvDate">
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
    <strong>No sms_smartcardss Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')