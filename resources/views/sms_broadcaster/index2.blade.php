@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">sms_broadcaster</h4>

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
>Add sms_broadcaster </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add sms_broadcaster</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/sms_broadcaster/add-sms_broadcaster-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="row">
		<div class="form-group col-md-6">
			<label for="BROADCASTERNAME">BROADCASTERNAME:</label>
			<input type="text" class="form-control" id="BROADCASTERNAME" name="BROADCASTERNAME">
		</div>
		<div class="form-group col-md-6">
			<label for="BROADCASTERDESC">BROADCASTERDESC:</label>
			<input type="text" class="form-control" id="BROADCASTERDESC" name="BROADCASTERDESC">
		</div>
		<div class="form-group col-md-6">
			<label for="STATUS">STATUS:</label>
			<input type="text" class="form-control" id="STATUS" name="STATUS">
		</div>
		<div class="form-group col-md-6">
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
@if(count($sms_broadcaster) > 0)	
        <nav aria-label="Page navigation">{{ $sms_broadcaster->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($sms_broadcaster as $sms_broadcaster)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>ID : {{$sms_broadcaster->ID}}</h5>
            <h5 class='card-title'>BROADCASTERNAME : {{$sms_broadcaster->BROADCASTERNAME}}</h5>
            <h5 class='card-title'>BROADCASTERDESC : {{$sms_broadcaster->BROADCASTERDESC}}</h5>
            <h5 class='card-title'>CREATEDON : {{$sms_broadcaster->CREATEDON}}</h5>
            <h5 class='card-title'>UPDATEDON : {{$sms_broadcaster->UPDATEDON}}</h5>
            <h5 class='card-title'>CREATEDBY : {{$sms_broadcaster->CREATEDBY}}</h5>
            <h5 class='card-title'>UPDATEDBY : {{$sms_broadcaster->UPDATEDBY}}</h5>
            <h5 class='card-title'>STATUS : {{$sms_broadcaster->STATUS}}</h5>
            <h5 class='card-title'>Deleted : {{$sms_broadcaster->Deleted}}</h5>
            <h5 class='card-title'>Remark : {{$sms_broadcaster->Remark}}</h5>
            <h5 class='card-title'>sms_id : {{$sms_broadcaster->sms_id}}</h5><a class='card-link' href='{{ Request::root() }}/sms_broadcaster/change-status-sms_broadcaster/{{ $sms_broadcaster->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($sms_broadcaster->status == 0)
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
                     href='{{ Request::root() }}/sms_broadcaster/delete-sms_broadcaster/{{ $sms_broadcaster->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit sms_broadcaster</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/sms_broadcaster/edit-sms_broadcaster-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $sms_broadcaster->id ?>'   name='sms_broadcaster_id'>
	<div class="row">
		<div class="form-group col-md-6">
			<label for="BROADCASTERNAME">BROADCASTERNAME:</label>
			<input type="text" class="form-control" value="{{ $sms_broadcaster->BROADCASTERNAME}}" id="BROADCASTERNAME" name="BROADCASTERNAME">
		</div>
		<div class="form-group col-md-6">
			<label for="BROADCASTERDESC">BROADCASTERDESC:</label>
			<input type="text" class="form-control" value="{{ $sms_broadcaster->BROADCASTERDESC}}" id="BROADCASTERDESC" name="BROADCASTERDESC">
		</div>
		<div class="form-group col-md-6">
			<label for="STATUS">STATUS:</label>
			<input type="text" class="form-control" value="{{ $sms_broadcaster->STATUS}}" id="STATUS" name="STATUS">
		</div>
		<div class="form-group col-md-6">
			<label for="Remark">Remark:</label>
			<input type="text" class="form-control" value="{{ $sms_broadcaster->Remark}}" id="Remark" name="Remark">
		</div>
    </div >
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
    <strong>No sms_broadcasters Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')