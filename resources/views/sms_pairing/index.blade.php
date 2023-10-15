@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">sms_pairing</h4>

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
>Add sms_pairing </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add sms_pairing</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/sms_pairing/add-sms_pairing-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="SmartCardId">SmartCardId:</label>
        <input type="text" class="form-control" id="SmartCardId" name="SmartCardId">
    </div>
    <div class="form-group">
        
        <label for="StbId">StbId:</label>
        <input type="text" class="form-control" id="StbId" name="StbId">
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
        
        <label for="AllocatedOperatorId">AllocatedOperatorId:</label>
        <input type="text" class="form-control" id="AllocatedOperatorId" name="AllocatedOperatorId">
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
@if(count($sms_pairing) > 0)	
        <nav aria-label="Page navigation">{{ $sms_pairing->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($sms_pairing as $sms_pairing)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>Id : {{$sms_pairing->Id}}</h5>
            <h5 class='card-title'>SmartCardId : {{$sms_pairing->SmartCardId}}</h5>
            <h5 class='card-title'>StbId : {{$sms_pairing->StbId}}</h5>
            <h5 class='card-title'>Status : {{$sms_pairing->Status}}</h5>
            <h5 class='card-title'>CreatedOn : {{$sms_pairing->CreatedOn}}</h5>
            <h5 class='card-title'>CreatedBy : {{$sms_pairing->CreatedBy}}</h5>
            <h5 class='card-title'>UpdatedOn : {{$sms_pairing->UpdatedOn}}</h5>
            <h5 class='card-title'>UpdatedBy : {{$sms_pairing->UpdatedBy}}</h5>
            <h5 class='card-title'>Deleted : {{$sms_pairing->Deleted}}</h5>
            <h5 class='card-title'>Remark : {{$sms_pairing->Remark}}</h5>
            <h5 class='card-title'>IsLocked : {{$sms_pairing->IsLocked}}</h5>
            <h5 class='card-title'>LockedOn : {{$sms_pairing->LockedOn}}</h5>
            <h5 class='card-title'>LockedFrom : {{$sms_pairing->LockedFrom}}</h5>
            <h5 class='card-title'>sms_id : {{$sms_pairing->sms_id}}</h5>
            <h5 class='card-title'>AllocatedOperatorId : {{$sms_pairing->AllocatedOperatorId}}</h5><a class='card-link' href='{{ Request::root() }}/sms_pairing/change-status-sms_pairing/{{ $sms_pairing->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($sms_pairing->status == 0)
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
                     href='{{ Request::root() }}/sms_pairing/delete-sms_pairing/{{ $sms_pairing->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit sms_pairing</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/sms_pairing/edit-sms_pairing-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $sms_pairing->id ?>'   name='sms_pairing_id'>

    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" value="{{ $sms_pairing->Id}}" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="SmartCardId">SmartCardId:</label>
        <input type="text" value="{{ $sms_pairing->SmartCardId}}" class="form-control" id="SmartCardId" name="SmartCardId">
    </div>
    <div class="form-group">
        
        <label for="StbId">StbId:</label>
        <input type="text" value="{{ $sms_pairing->StbId}}" class="form-control" id="StbId" name="StbId">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" value="{{ $sms_pairing->Status}}" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="CreatedOn">CreatedOn:</label>
        <input type="text" value="{{ $sms_pairing->CreatedOn}}" class="form-control" id="CreatedOn" name="CreatedOn">
    </div>
    <div class="form-group">
        
        <label for="CreatedBy">CreatedBy:</label>
        <input type="text" value="{{ $sms_pairing->CreatedBy}}" class="form-control" id="CreatedBy" name="CreatedBy">
    </div>
    <div class="form-group">
        
        <label for="UpdatedOn">UpdatedOn:</label>
        <input type="text" value="{{ $sms_pairing->UpdatedOn}}" class="form-control" id="UpdatedOn" name="UpdatedOn">
    </div>
    <div class="form-group">
        
        <label for="UpdatedBy">UpdatedBy:</label>
        <input type="text" value="{{ $sms_pairing->UpdatedBy}}" class="form-control" id="UpdatedBy" name="UpdatedBy">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" value="{{ $sms_pairing->Deleted}}" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $sms_pairing->Remark}}" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="IsLocked">IsLocked:</label>
        <input type="text" value="{{ $sms_pairing->IsLocked}}" class="form-control" id="IsLocked" name="IsLocked">
    </div>
    <div class="form-group">
        
        <label for="LockedOn">LockedOn:</label>
        <input type="text" value="{{ $sms_pairing->LockedOn}}" class="form-control" id="LockedOn" name="LockedOn">
    </div>
    <div class="form-group">
        
        <label for="LockedFrom">LockedFrom:</label>
        <input type="text" value="{{ $sms_pairing->LockedFrom}}" class="form-control" id="LockedFrom" name="LockedFrom">
    </div>
    <div class="form-group">
        
        <label for="sms_id">sms_id:</label>
        <input type="text" value="{{ $sms_pairing->sms_id}}" class="form-control" id="sms_id" name="sms_id">
    </div>
    <div class="form-group">
        
        <label for="AllocatedOperatorId">AllocatedOperatorId:</label>
        <input type="text" value="{{ $sms_pairing->AllocatedOperatorId}}" class="form-control" id="AllocatedOperatorId" name="AllocatedOperatorId">
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
    <strong>No sms_pairings Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')