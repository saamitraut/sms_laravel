@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">prp_demobouque</h4>

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
>Add prp_demobouque </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add prp_demobouque</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/prp_demobouque/add-prp_demobouque-post" >
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
        
        <label for="Duration">Duration:</label>
        <input type="text" class="form-control" id="Duration" name="Duration">
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
@if(count($prp_demobouque) > 0)	
        <nav aria-label="Page navigation">{{ $prp_demobouque->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($prp_demobouque as $prp_demobouque)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>Id : {{$prp_demobouque->Id}}</h5>
            <h5 class='card-title'>BouqueCode : {{$prp_demobouque->BouqueCode}}</h5>
            <h5 class='card-title'>BouqueName : {{$prp_demobouque->BouqueName}}</h5>
            <h5 class='card-title'>Duration : {{$prp_demobouque->Duration}}</h5>
            <h5 class='card-title'>BType : {{$prp_demobouque->BType}}</h5>
            <h5 class='card-title'>Status : {{$prp_demobouque->Status}}</h5>
            <h5 class='card-title'>Description : {{$prp_demobouque->Description}}</h5>
            <h5 class='card-title'>CreatedOn : {{$prp_demobouque->CreatedOn}}</h5>
            <h5 class='card-title'>CreatedBy : {{$prp_demobouque->CreatedBy}}</h5>
            <h5 class='card-title'>UpdatedOn : {{$prp_demobouque->UpdatedOn}}</h5>
            <h5 class='card-title'>UpdatedBy : {{$prp_demobouque->UpdatedBy}}</h5>
            <h5 class='card-title'>Deleted : {{$prp_demobouque->Deleted}}</h5>
            <h5 class='card-title'>Remark : {{$prp_demobouque->Remark}}</h5><a class='card-link' href='{{ Request::root() }}/prp_demobouque/change-status-prp_demobouque/{{ $prp_demobouque->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($prp_demobouque->status == 0)
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
                     href='{{ Request::root() }}/prp_demobouque/delete-prp_demobouque/{{ $prp_demobouque->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit prp_demobouque</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/prp_demobouque/edit-prp_demobouque-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $prp_demobouque->id ?>'   name='prp_demobouque_id'>

    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" value="{{ $prp_demobouque->Id}}" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="BouqueCode">BouqueCode:</label>
        <input type="text" value="{{ $prp_demobouque->BouqueCode}}" class="form-control" id="BouqueCode" name="BouqueCode">
    </div>
    <div class="form-group">
        
        <label for="BouqueName">BouqueName:</label>
        <input type="text" value="{{ $prp_demobouque->BouqueName}}" class="form-control" id="BouqueName" name="BouqueName">
    </div>
    <div class="form-group">
        
        <label for="Duration">Duration:</label>
        <input type="text" value="{{ $prp_demobouque->Duration}}" class="form-control" id="Duration" name="Duration">
    </div>
    <div class="form-group">
        
        <label for="BType">BType:</label>
        <input type="text" value="{{ $prp_demobouque->BType}}" class="form-control" id="BType" name="BType">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" value="{{ $prp_demobouque->Status}}" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="Description">Description:</label>
        <input type="text" value="{{ $prp_demobouque->Description}}" class="form-control" id="Description" name="Description">
    </div>
    <div class="form-group">
        
        <label for="CreatedOn">CreatedOn:</label>
        <input type="text" value="{{ $prp_demobouque->CreatedOn}}" class="form-control" id="CreatedOn" name="CreatedOn">
    </div>
    <div class="form-group">
        
        <label for="CreatedBy">CreatedBy:</label>
        <input type="text" value="{{ $prp_demobouque->CreatedBy}}" class="form-control" id="CreatedBy" name="CreatedBy">
    </div>
    <div class="form-group">
        
        <label for="UpdatedOn">UpdatedOn:</label>
        <input type="text" value="{{ $prp_demobouque->UpdatedOn}}" class="form-control" id="UpdatedOn" name="UpdatedOn">
    </div>
    <div class="form-group">
        
        <label for="UpdatedBy">UpdatedBy:</label>
        <input type="text" value="{{ $prp_demobouque->UpdatedBy}}" class="form-control" id="UpdatedBy" name="UpdatedBy">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" value="{{ $prp_demobouque->Deleted}}" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $prp_demobouque->Remark}}" class="form-control" id="Remark" name="Remark">
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
    <strong>No prp_demobouques Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')