@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">sms_operator_assets</h4>

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
>Add sms_operator_assets </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add sms_operator_assets</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/sms_operator_assets/add-sms_operator_assets-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="OperatorId">OperatorId:</label>
        <input type="text" class="form-control" id="OperatorId" name="OperatorId">
    </div>
    <div class="form-group">
        
        <label for="PackageId">PackageId:</label>
        <input type="text" class="form-control" id="PackageId" name="PackageId">
    </div>
    <div class="form-group">
        
        <label for="AlacarteId">AlacarteId:</label>
        <input type="text" class="form-control" id="AlacarteId" name="AlacarteId">
    </div>
    <div class="form-group">
        
        <label for="BouqueId">BouqueId:</label>
        <input type="text" class="form-control" id="BouqueId" name="BouqueId">
    </div>
    <div class="form-group">
        
        <label for="DemoBouqueId">DemoBouqueId:</label>
        <input type="text" class="form-control" id="DemoBouqueId" name="DemoBouqueId">
    </div>
    <div class="form-group">
        
        <label for="Description">Description:</label>
        <input type="text" class="form-control" id="Description" name="Description">
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
@if(count($sms_operator_assets) > 0)	
        <nav aria-label="Page navigation">{{ $sms_operator_assets->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($sms_operator_assets as $sms_operator_asset)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>Id : {{$sms_operator_asset->Id}}</h5>
            <h5 class='card-title'>OperatorId : {{$sms_operator_asset->OperatorId}}</h5>
            <h5 class='card-title'>PackageId : {{$sms_operator_asset->PackageId}}</h5>
            <h5 class='card-title'>AlacarteId : {{$sms_operator_asset->AlacarteId}}</h5>
            <h5 class='card-title'>BouqueId : {{$sms_operator_asset->BouqueId}}</h5>
            <h5 class='card-title'>DemoBouqueId : {{$sms_operator_asset->DemoBouqueId}}</h5>
            <h5 class='card-title'>Description : {{$sms_operator_asset->Description}}</h5>
            <h5 class='card-title'>CreatedOn : {{$sms_operator_asset->CreatedOn}}</h5>
            <h5 class='card-title'>CreatedBy : {{$sms_operator_asset->CreatedBy}}</h5>
            <h5 class='card-title'>UpdatedOn : {{$sms_operator_asset->UpdatedOn}}</h5>
            <h5 class='card-title'>UpdatedBy : {{$sms_operator_asset->UpdatedBy}}</h5>
            <h5 class='card-title'>Deleted : {{$sms_operator_asset->Deleted}}</h5>
            <h5 class='card-title'>Remark : {{$sms_operator_asset->Remark}}</h5><a class='card-link' href='{{ Request::root() }}/sms_operator_assets/change-status-sms_operator_assets/{{ $sms_operator_asset->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($sms_operator_asset->status == 0)
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
                     href='{{ Request::root() }}/sms_operator_assets/delete-sms_operator_assets/{{ $sms_operator_asset->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit sms_operator_assets</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/sms_operator_assets/edit-sms_operator_assets-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $sms_operator_asset->id ?>'   name='sms_operator_assets_id'>

    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" value="{{ $sms_operator_asset->Id}}" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="OperatorId">OperatorId:</label>
        <input type="text" value="{{ $sms_operator_asset->OperatorId}}" class="form-control" id="OperatorId" name="OperatorId">
    </div>
    <div class="form-group">
        
        <label for="PackageId">PackageId:</label>
        <input type="text" value="{{ $sms_operator_asset->PackageId}}" class="form-control" id="PackageId" name="PackageId">
    </div>
    <div class="form-group">
        
        <label for="AlacarteId">AlacarteId:</label>
        <input type="text" value="{{ $sms_operator_asset->AlacarteId}}" class="form-control" id="AlacarteId" name="AlacarteId">
    </div>
    <div class="form-group">
        
        <label for="BouqueId">BouqueId:</label>
        <input type="text" value="{{ $sms_operator_asset->BouqueId}}" class="form-control" id="BouqueId" name="BouqueId">
    </div>
    <div class="form-group">
        
        <label for="DemoBouqueId">DemoBouqueId:</label>
        <input type="text" value="{{ $sms_operator_asset->DemoBouqueId}}" class="form-control" id="DemoBouqueId" name="DemoBouqueId">
    </div>
    <div class="form-group">
        
        <label for="Description">Description:</label>
        <input type="text" value="{{ $sms_operator_asset->Description}}" class="form-control" id="Description" name="Description">
    </div>
    <div class="form-group">
        
        <label for="CreatedOn">CreatedOn:</label>
        <input type="text" value="{{ $sms_operator_asset->CreatedOn}}" class="form-control" id="CreatedOn" name="CreatedOn">
    </div>
    <div class="form-group">
        
        <label for="CreatedBy">CreatedBy:</label>
        <input type="text" value="{{ $sms_operator_asset->CreatedBy}}" class="form-control" id="CreatedBy" name="CreatedBy">
    </div>
    <div class="form-group">
        
        <label for="UpdatedOn">UpdatedOn:</label>
        <input type="text" value="{{ $sms_operator_asset->UpdatedOn}}" class="form-control" id="UpdatedOn" name="UpdatedOn">
    </div>
    <div class="form-group">
        
        <label for="UpdatedBy">UpdatedBy:</label>
        <input type="text" value="{{ $sms_operator_asset->UpdatedBy}}" class="form-control" id="UpdatedBy" name="UpdatedBy">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" value="{{ $sms_operator_asset->Deleted}}" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $sms_operator_asset->Remark}}" class="form-control" id="Remark" name="Remark">
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
    <strong>No sms_operator_assetss Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')