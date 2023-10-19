@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">prp_bouque</h4>

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
>Add prp_bouque </button>
<!-- Search start -->
<button
type="button"
class="btn btn-primary"
data-bs-toggle="modal"
data-bs-target="#basicModal2" style="margin-bottom: 15px"
>
Search
</button>
<!-- Search End -->
<!-- Modal -->
<div class="modal fade" id="basicModal2" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel1">Search PackageType </h5>
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <div class="modal-body">
          <form role="form" method="post" action="/requiredfor_master/" >
              <input type="hidden" name="_token" value="{{ csrf_token() }}">
        
			<div class="mb-3">
                <label for="name" class="col-md-2 col-form-label">PackageType</label>
                <div class="col-md-10"><input class="form-control" type="text" value="" id="name" name="name" required>
                </div>
				<div class="mb-3">
                        <label for="package_type" class="form-label">PackageType</label>
                        <select id="defaultSelect" class="form-select">
						 <option>Default select</option>
						@foreach ($package_types as $package_type)
						<option value="{{$package_type->id}}">{{$package_type->name}}</option>
						@endforeach
                        </select>
                </div>
              </div>
              
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
          Close
        </button>
        <button type="submit" class="btn btn-primary">Search</button> </form>
      </div>
    </div>
  </div>
</div>
<!-- Modal end -->
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
                <h5 class="modal-title" id="exampleModalLabel1">Add prp_bouque</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/prp_bouque/add-prp_bouque-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="BouqueCode">BouqueCode:</label>
        <input type="text" class="form-control" id="BouqueCode" name="BouqueCode">
    </div>
    <div class="form-group">
        
        <label for="BouqueName">BouqueName:</label>
        <input type="text" class="form-control" id="BouqueName" name="BouqueName">
    </div>
    <div class="form-group">
        
        <label for="Rate">Rate:</label>
        <input type="text" class="form-control" id="Rate" name="Rate">
    </div>
    <div class="form-group">
        
        <label for="LCOSharing">LCOSharing:</label>
        <input type="text" class="form-control" id="LCOSharing" name="LCOSharing">
    </div>
    <div class="form-group">
        
        <label for="BType">BType:</label>
        <input type="text" class="form-control" id="BType" name="BType">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="AType">AType:</label>
        <input type="text" class="form-control" id="AType" name="AType">
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
    <div class="form-group">
        
        <label for="isRio">isRio:</label>
        <input type="text" class="form-control" id="isRio" name="isRio">
    </div>
    <div class="form-group">
        
        <label for="RIOAlaCarte1Count">RIOAlaCarte1Count:</label>
        <input type="text" class="form-control" id="RIOAlaCarte1Count" name="RIOAlaCarte1Count">
    </div>
    <div class="form-group">
        
        <label for="RIOAlaCarte2Count">RIOAlaCarte2Count:</label>
        <input type="text" class="form-control" id="RIOAlaCarte2Count" name="RIOAlaCarte2Count">
    </div>
    <div class="form-group">
        
        <label for="PackageTypeId">PackageTypeId:</label>
        <input type="text" class="form-control" id="PackageTypeId" name="PackageTypeId">
    </div>
    <div class="form-group">
        
        <label for="MRP">MRP:</label>
        <input type="text" class="form-control" id="MRP" name="MRP">
    </div>
    <div class="form-group">
        
        <label for="broadcaster_id">broadcaster_id:</label>
        <input type="text" class="form-control" id="broadcaster_id" name="broadcaster_id">
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
@if(count($prp_bouque) > 0)	
        <nav aria-label="Page navigation">{{ $prp_bouque->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($prp_bouque as $prp_bouque)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>Id : {{$prp_bouque->Id}}</h5>
            <h5 class='card-title'>BouqueCode : {{$prp_bouque->BouqueCode}}</h5>
            <h5 class='card-title'>BouqueName : {{$prp_bouque->BouqueName}}</h5>
            <h5 class='card-title'>Rate : {{$prp_bouque->Rate}}</h5>
            <h5 class='card-title'>LCOSharing : {{$prp_bouque->LCOSharing}}</h5>
            <h5 class='card-title'>BType : {{$prp_bouque->BType}}</h5>
            <h5 class='card-title'>Status : {{$prp_bouque->Status}}</h5>
            <h5 class='card-title'>AType : {{$prp_bouque->AType}}</h5>
            <h5 class='card-title'>Description : {{$prp_bouque->Description}}</h5>
            <h5 class='card-title'>CreatedOn : {{$prp_bouque->CreatedOn}}</h5>
            <h5 class='card-title'>CreatedBy : {{$prp_bouque->CreatedBy}}</h5>
            <h5 class='card-title'>UpdatedOn : {{$prp_bouque->UpdatedOn}}</h5>
            <h5 class='card-title'>UpdatedBy : {{$prp_bouque->UpdatedBy}}</h5>
            <h5 class='card-title'>Deleted : {{$prp_bouque->Deleted}}</h5>
            <h5 class='card-title'>Remark : {{$prp_bouque->Remark}}</h5>
            <h5 class='card-title'>isRio : {{$prp_bouque->isRio}}</h5>
            <h5 class='card-title'>RIOAlaCarte1Count : {{$prp_bouque->RIOAlaCarte1Count}}</h5>
            <h5 class='card-title'>RIOAlaCarte2Count : {{$prp_bouque->RIOAlaCarte2Count}}</h5>
            <h5 class='card-title'>PackageTypeId : {{$prp_bouque->PackageTypeId}}</h5>
            <h5 class='card-title'>MRP : {{$prp_bouque->MRP}}</h5>
            <h5 class='card-title'>broadcaster_id : {{$prp_bouque->broadcaster_id}}</h5><a class='card-link' href='{{ Request::root() }}/prp_bouque/change-status-prp_bouque/{{ $prp_bouque->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($prp_bouque->status == 0)
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
                     href='{{ Request::root() }}/prp_bouque/delete-prp_bouque/{{ $prp_bouque->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit prp_bouque</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/prp_bouque/edit-prp_bouque-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $prp_bouque->id ?>'   name='prp_bouque_id'>

    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" value="{{ $prp_bouque->Id}}" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="BouqueCode">BouqueCode:</label>
        <input type="text" value="{{ $prp_bouque->BouqueCode}}" class="form-control" id="BouqueCode" name="BouqueCode">
    </div>
    <div class="form-group">
        
        <label for="BouqueName">BouqueName:</label>
        <input type="text" value="{{ $prp_bouque->BouqueName}}" class="form-control" id="BouqueName" name="BouqueName">
    </div>
    <div class="form-group">
        
        <label for="Rate">Rate:</label>
        <input type="text" value="{{ $prp_bouque->Rate}}" class="form-control" id="Rate" name="Rate">
    </div>
    <div class="form-group">
        
        <label for="LCOSharing">LCOSharing:</label>
        <input type="text" value="{{ $prp_bouque->LCOSharing}}" class="form-control" id="LCOSharing" name="LCOSharing">
    </div>
    <div class="form-group">
        
        <label for="BType">BType:</label>
        <input type="text" value="{{ $prp_bouque->BType}}" class="form-control" id="BType" name="BType">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" value="{{ $prp_bouque->Status}}" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="AType">AType:</label>
        <input type="text" value="{{ $prp_bouque->AType}}" class="form-control" id="AType" name="AType">
    </div>
    <div class="form-group">
        
        <label for="Description">Description:</label>
        <input type="text" value="{{ $prp_bouque->Description}}" class="form-control" id="Description" name="Description">
    </div>
    <div class="form-group">
        
        <label for="CreatedOn">CreatedOn:</label>
        <input type="text" value="{{ $prp_bouque->CreatedOn}}" class="form-control" id="CreatedOn" name="CreatedOn">
    </div>
    <div class="form-group">
        
        <label for="CreatedBy">CreatedBy:</label>
        <input type="text" value="{{ $prp_bouque->CreatedBy}}" class="form-control" id="CreatedBy" name="CreatedBy">
    </div>
    <div class="form-group">
        
        <label for="UpdatedOn">UpdatedOn:</label>
        <input type="text" value="{{ $prp_bouque->UpdatedOn}}" class="form-control" id="UpdatedOn" name="UpdatedOn">
    </div>
    <div class="form-group">
        
        <label for="UpdatedBy">UpdatedBy:</label>
        <input type="text" value="{{ $prp_bouque->UpdatedBy}}" class="form-control" id="UpdatedBy" name="UpdatedBy">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" value="{{ $prp_bouque->Deleted}}" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $prp_bouque->Remark}}" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="isRio">isRio:</label>
        <input type="text" value="{{ $prp_bouque->isRio}}" class="form-control" id="isRio" name="isRio">
    </div>
    <div class="form-group">
        
        <label for="RIOAlaCarte1Count">RIOAlaCarte1Count:</label>
        <input type="text" value="{{ $prp_bouque->RIOAlaCarte1Count}}" class="form-control" id="RIOAlaCarte1Count" name="RIOAlaCarte1Count">
    </div>
    <div class="form-group">
        
        <label for="RIOAlaCarte2Count">RIOAlaCarte2Count:</label>
        <input type="text" value="{{ $prp_bouque->RIOAlaCarte2Count}}" class="form-control" id="RIOAlaCarte2Count" name="RIOAlaCarte2Count">
    </div>
    <div class="form-group">
        
        <label for="PackageTypeId">PackageTypeId:</label>
        <input type="text" value="{{ $prp_bouque->PackageTypeId}}" class="form-control" id="PackageTypeId" name="PackageTypeId">
    </div>
    <div class="form-group">
        
        <label for="MRP">MRP:</label>
        <input type="text" value="{{ $prp_bouque->MRP}}" class="form-control" id="MRP" name="MRP">
    </div>
    <div class="form-group">
        
        <label for="broadcaster_id">broadcaster_id:</label>
        <input type="text" value="{{ $prp_bouque->broadcaster_id}}" class="form-control" id="broadcaster_id" name="broadcaster_id">
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
    <strong>No prp_bouques Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')