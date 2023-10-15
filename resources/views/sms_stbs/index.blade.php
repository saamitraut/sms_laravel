@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">sms_stbs</h4>

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
>Add sms_stbs </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add sms_stbs</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/sms_stbs/add-sms_stbs-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="STBNo">STBNo:</label>
        <input type="text" class="form-control" id="STBNo" name="STBNo">
    </div>
    <div class="form-group">
        
        <label for="MACADDRESS">MACADDRESS:</label>
        <input type="text" class="form-control" id="MACADDRESS" name="MACADDRESS">
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
        
        <label for="DocExtension">DocExtension:</label>
        <input type="text" class="form-control" id="DocExtension" name="DocExtension">
    </div>
    <div class="form-group">
        
        <label for="CHIPID">CHIPID:</label>
        <input type="text" class="form-control" id="CHIPID" name="CHIPID">
    </div>
    <div class="form-group">
        
        <label for="Checkcode">Checkcode:</label>
        <input type="text" class="form-control" id="Checkcode" name="Checkcode">
    </div>
    <div class="form-group">
        
        <label for="Authcode">Authcode:</label>
        <input type="text" class="form-control" id="Authcode" name="Authcode">
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
    <div class="form-group">
        
        <label for="NSTVSTBTrackNo">NSTVSTBTrackNo:</label>
        <input type="text" class="form-control" id="NSTVSTBTrackNo" name="NSTVSTBTrackNo">
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
@if(count($sms_stbs) > 0)	
        <nav aria-label="Page navigation">{{ $sms_stbs->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($sms_stbs as $sms_stb)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>Id : {{$sms_stb->Id}}</h5>
            <h5 class='card-title'>STBNo : {{$sms_stb->STBNo}}</h5>
            <h5 class='card-title'>MACADDRESS : {{$sms_stb->MACADDRESS}}</h5>
            <h5 class='card-title'>Status : {{$sms_stb->Status}}</h5>
            <h5 class='card-title'>BrandId : {{$sms_stb->BrandId}}</h5>
            <h5 class='card-title'>UploadLogId : {{$sms_stb->UploadLogId}}</h5>
            <h5 class='card-title'>CreatedOn : {{$sms_stb->CreatedOn}}</h5>
            <h5 class='card-title'>CreatedBy : {{$sms_stb->CreatedBy}}</h5>
            <h5 class='card-title'>UpdatedOn : {{$sms_stb->UpdatedOn}}</h5>
            <h5 class='card-title'>UpdatedBy : {{$sms_stb->UpdatedBy}}</h5>
            <h5 class='card-title'>Deleted : {{$sms_stb->Deleted}}</h5>
            <h5 class='card-title'>Remark : {{$sms_stb->Remark}}</h5>
            <h5 class='card-title'>IsLocked : {{$sms_stb->IsLocked}}</h5>
            <h5 class='card-title'>LockedOn : {{$sms_stb->LockedOn}}</h5>
            <h5 class='card-title'>LockedFrom : {{$sms_stb->LockedFrom}}</h5>
            <h5 class='card-title'>sms_id : {{$sms_stb->sms_id}}</h5>
            <h5 class='card-title'>DocExtension : {{$sms_stb->DocExtension}}</h5>
            <h5 class='card-title'>CHIPID : {{$sms_stb->CHIPID}}</h5>
            <h5 class='card-title'>Checkcode : {{$sms_stb->Checkcode}}</h5>
            <h5 class='card-title'>Authcode : {{$sms_stb->Authcode}}</h5>
            <h5 class='card-title'>PONumber : {{$sms_stb->PONumber}}</h5>
            <h5 class='card-title'>PODate : {{$sms_stb->PODate}}</h5>
            <h5 class='card-title'>InvNumber : {{$sms_stb->InvNumber}}</h5>
            <h5 class='card-title'>InvDate : {{$sms_stb->InvDate}}</h5>
            <h5 class='card-title'>NSTVSTBTrackNo : {{$sms_stb->NSTVSTBTrackNo}}</h5><a class='card-link' href='{{ Request::root() }}/sms_stbs/change-status-sms_stbs/{{ $sms_stb->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($sms_stb->status == 0)
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
                     href='{{ Request::root() }}/sms_stbs/delete-sms_stbs/{{ $sms_stb->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit sms_stbs</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/sms_stbs/edit-sms_stbs-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $sms_stb->id ?>'   name='sms_stbs_id'>

    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" value="{{ $sms_stb->Id}}" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="STBNo">STBNo:</label>
        <input type="text" value="{{ $sms_stb->STBNo}}" class="form-control" id="STBNo" name="STBNo">
    </div>
    <div class="form-group">
        
        <label for="MACADDRESS">MACADDRESS:</label>
        <input type="text" value="{{ $sms_stb->MACADDRESS}}" class="form-control" id="MACADDRESS" name="MACADDRESS">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" value="{{ $sms_stb->Status}}" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="BrandId">BrandId:</label>
        <input type="text" value="{{ $sms_stb->BrandId}}" class="form-control" id="BrandId" name="BrandId">
    </div>
    <div class="form-group">
        
        <label for="UploadLogId">UploadLogId:</label>
        <input type="text" value="{{ $sms_stb->UploadLogId}}" class="form-control" id="UploadLogId" name="UploadLogId">
    </div>
    <div class="form-group">
        
        <label for="CreatedOn">CreatedOn:</label>
        <input type="text" value="{{ $sms_stb->CreatedOn}}" class="form-control" id="CreatedOn" name="CreatedOn">
    </div>
    <div class="form-group">
        
        <label for="CreatedBy">CreatedBy:</label>
        <input type="text" value="{{ $sms_stb->CreatedBy}}" class="form-control" id="CreatedBy" name="CreatedBy">
    </div>
    <div class="form-group">
        
        <label for="UpdatedOn">UpdatedOn:</label>
        <input type="text" value="{{ $sms_stb->UpdatedOn}}" class="form-control" id="UpdatedOn" name="UpdatedOn">
    </div>
    <div class="form-group">
        
        <label for="UpdatedBy">UpdatedBy:</label>
        <input type="text" value="{{ $sms_stb->UpdatedBy}}" class="form-control" id="UpdatedBy" name="UpdatedBy">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" value="{{ $sms_stb->Deleted}}" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $sms_stb->Remark}}" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="IsLocked">IsLocked:</label>
        <input type="text" value="{{ $sms_stb->IsLocked}}" class="form-control" id="IsLocked" name="IsLocked">
    </div>
    <div class="form-group">
        
        <label for="LockedOn">LockedOn:</label>
        <input type="text" value="{{ $sms_stb->LockedOn}}" class="form-control" id="LockedOn" name="LockedOn">
    </div>
    <div class="form-group">
        
        <label for="LockedFrom">LockedFrom:</label>
        <input type="text" value="{{ $sms_stb->LockedFrom}}" class="form-control" id="LockedFrom" name="LockedFrom">
    </div>
    <div class="form-group">
        
        <label for="sms_id">sms_id:</label>
        <input type="text" value="{{ $sms_stb->sms_id}}" class="form-control" id="sms_id" name="sms_id">
    </div>
    <div class="form-group">
        
        <label for="DocExtension">DocExtension:</label>
        <input type="text" value="{{ $sms_stb->DocExtension}}" class="form-control" id="DocExtension" name="DocExtension">
    </div>
    <div class="form-group">
        
        <label for="CHIPID">CHIPID:</label>
        <input type="text" value="{{ $sms_stb->CHIPID}}" class="form-control" id="CHIPID" name="CHIPID">
    </div>
    <div class="form-group">
        
        <label for="Checkcode">Checkcode:</label>
        <input type="text" value="{{ $sms_stb->Checkcode}}" class="form-control" id="Checkcode" name="Checkcode">
    </div>
    <div class="form-group">
        
        <label for="Authcode">Authcode:</label>
        <input type="text" value="{{ $sms_stb->Authcode}}" class="form-control" id="Authcode" name="Authcode">
    </div>
    <div class="form-group">
        
        <label for="PONumber">PONumber:</label>
        <input type="text" value="{{ $sms_stb->PONumber}}" class="form-control" id="PONumber" name="PONumber">
    </div>
    <div class="form-group">
        
        <label for="PODate">PODate:</label>
        <input type="text" value="{{ $sms_stb->PODate}}" class="form-control" id="PODate" name="PODate">
    </div>
    <div class="form-group">
        
        <label for="InvNumber">InvNumber:</label>
        <input type="text" value="{{ $sms_stb->InvNumber}}" class="form-control" id="InvNumber" name="InvNumber">
    </div>
    <div class="form-group">
        
        <label for="InvDate">InvDate:</label>
        <input type="text" value="{{ $sms_stb->InvDate}}" class="form-control" id="InvDate" name="InvDate">
    </div>
    <div class="form-group">
        
        <label for="NSTVSTBTrackNo">NSTVSTBTrackNo:</label>
        <input type="text" value="{{ $sms_stb->NSTVSTBTrackNo}}" class="form-control" id="NSTVSTBTrackNo" name="NSTVSTBTrackNo">
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
    <strong>No sms_stbss Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')