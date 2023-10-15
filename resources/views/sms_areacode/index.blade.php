@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">sms_areacode</h4>

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
>Add sms_areacode </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add sms_areacode</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/sms_areacode/add-sms_areacode-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="ID">ID:</label>
        <input type="text" class="form-control" id="ID" name="ID">
    </div>
    <div class="form-group">
        
        <label for="AREACODE">AREACODE:</label>
        <input type="text" class="form-control" id="AREACODE" name="AREACODE">
    </div>
    <div class="form-group">
        
        <label for="NAME">NAME:</label>
        <input type="text" class="form-control" id="NAME" name="NAME">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="OperatorId">OperatorId:</label>
        <input type="text" class="form-control" id="OperatorId" name="OperatorId">
    </div>
    <div class="form-group">
        
        <label for="CREATEDON">CREATEDON:</label>
        <input type="text" class="form-control" id="CREATEDON" name="CREATEDON">
    </div>
    <div class="form-group">
        
        <label for="UPDATEDON">UPDATEDON:</label>
        <input type="text" class="form-control" id="UPDATEDON" name="UPDATEDON">
    </div>
    <div class="form-group">
        
        <label for="CREATEDBY">CREATEDBY:</label>
        <input type="text" class="form-control" id="CREATEDBY" name="CREATEDBY">
    </div>
    <div class="form-group">
        
        <label for="UPDATEDBY">UPDATEDBY:</label>
        <input type="text" class="form-control" id="UPDATEDBY" name="UPDATEDBY">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="sms_id">sms_id:</label>
        <input type="text" class="form-control" id="sms_id" name="sms_id">
    </div>
    <div class="form-group">
        
        <label for="AREACASCODE">AREACASCODE:</label>
        <input type="text" class="form-control" id="AREACASCODE" name="AREACASCODE">
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
@if(count($sms_areacode) > 0)	
        <nav aria-label="Page navigation">{{ $sms_areacode->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($sms_areacode as $sms_areacode)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>ID : {{$sms_areacode->ID}}</h5>
            <h5 class='card-title'>AREACODE : {{$sms_areacode->AREACODE}}</h5>
            <h5 class='card-title'>NAME : {{$sms_areacode->NAME}}</h5>
            <h5 class='card-title'>Status : {{$sms_areacode->Status}}</h5>
            <h5 class='card-title'>OperatorId : {{$sms_areacode->OperatorId}}</h5>
            <h5 class='card-title'>CREATEDON : {{$sms_areacode->CREATEDON}}</h5>
            <h5 class='card-title'>UPDATEDON : {{$sms_areacode->UPDATEDON}}</h5>
            <h5 class='card-title'>CREATEDBY : {{$sms_areacode->CREATEDBY}}</h5>
            <h5 class='card-title'>UPDATEDBY : {{$sms_areacode->UPDATEDBY}}</h5>
            <h5 class='card-title'>Remark : {{$sms_areacode->Remark}}</h5>
            <h5 class='card-title'>Deleted : {{$sms_areacode->Deleted}}</h5>
            <h5 class='card-title'>sms_id : {{$sms_areacode->sms_id}}</h5>
            <h5 class='card-title'>AREACASCODE : {{$sms_areacode->AREACASCODE}}</h5><a class='card-link' href='{{ Request::root() }}/sms_areacode/change-status-sms_areacode/{{ $sms_areacode->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($sms_areacode->status == 0)
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
                     href='{{ Request::root() }}/sms_areacode/delete-sms_areacode/{{ $sms_areacode->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit sms_areacode</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/sms_areacode/edit-sms_areacode-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $sms_areacode->id ?>'   name='sms_areacode_id'>

    <div class="form-group">
        
        <label for="ID">ID:</label>
        <input type="text" value="{{ $sms_areacode->ID}}" class="form-control" id="ID" name="ID">
    </div>
    <div class="form-group">
        
        <label for="AREACODE">AREACODE:</label>
        <input type="text" value="{{ $sms_areacode->AREACODE}}" class="form-control" id="AREACODE" name="AREACODE">
    </div>
    <div class="form-group">
        
        <label for="NAME">NAME:</label>
        <input type="text" value="{{ $sms_areacode->NAME}}" class="form-control" id="NAME" name="NAME">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" value="{{ $sms_areacode->Status}}" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="OperatorId">OperatorId:</label>
        <input type="text" value="{{ $sms_areacode->OperatorId}}" class="form-control" id="OperatorId" name="OperatorId">
    </div>
    <div class="form-group">
        
        <label for="CREATEDON">CREATEDON:</label>
        <input type="text" value="{{ $sms_areacode->CREATEDON}}" class="form-control" id="CREATEDON" name="CREATEDON">
    </div>
    <div class="form-group">
        
        <label for="UPDATEDON">UPDATEDON:</label>
        <input type="text" value="{{ $sms_areacode->UPDATEDON}}" class="form-control" id="UPDATEDON" name="UPDATEDON">
    </div>
    <div class="form-group">
        
        <label for="CREATEDBY">CREATEDBY:</label>
        <input type="text" value="{{ $sms_areacode->CREATEDBY}}" class="form-control" id="CREATEDBY" name="CREATEDBY">
    </div>
    <div class="form-group">
        
        <label for="UPDATEDBY">UPDATEDBY:</label>
        <input type="text" value="{{ $sms_areacode->UPDATEDBY}}" class="form-control" id="UPDATEDBY" name="UPDATEDBY">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $sms_areacode->Remark}}" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" value="{{ $sms_areacode->Deleted}}" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="sms_id">sms_id:</label>
        <input type="text" value="{{ $sms_areacode->sms_id}}" class="form-control" id="sms_id" name="sms_id">
    </div>
    <div class="form-group">
        
        <label for="AREACASCODE">AREACASCODE:</label>
        <input type="text" value="{{ $sms_areacode->AREACASCODE}}" class="form-control" id="AREACASCODE" name="AREACASCODE">
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
    <strong>No sms_areacodes Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')