@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">sms_access</h4>

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
>Add sms_access </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add sms_access</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/sms_access/add-sms_access-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="ID">ID:</label>
        <input type="text" class="form-control" id="ID" name="ID">
    </div>
    <div class="form-group">
        
        <label for="NAME">NAME:</label>
        <input type="text" class="form-control" id="NAME" name="NAME">
    </div>
    <div class="form-group">
        
        <label for="LOGINID">LOGINID:</label>
        <input type="text" class="form-control" id="LOGINID" name="LOGINID">
    </div>
    <div class="form-group">
        
        <label for="PASSWORD">PASSWORD:</label>
        <input type="text" class="form-control" id="PASSWORD" name="PASSWORD">
    </div>
    <div class="form-group">
        
        <label for="USERTYPE">USERTYPE:</label>
        <input type="text" class="form-control" id="USERTYPE" name="USERTYPE">
    </div>
    <div class="form-group">
        
        <label for="STATUS">STATUS:</label>
        <input type="text" class="form-control" id="STATUS" name="STATUS">
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
        
        <label for="OperatorID">OperatorID:</label>
        <input type="text" class="form-control" id="OperatorID" name="OperatorID">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="deleted">deleted:</label>
        <input type="text" class="form-control" id="deleted" name="deleted">
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
@if(count($sms_access) > 0)	
        <nav aria-label="Page navigation">{{ $sms_access->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($sms_access as $sms_acces)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>ID : {{$sms_acces->ID}}</h5>
            <h5 class='card-title'>NAME : {{$sms_acces->NAME}}</h5>
            <h5 class='card-title'>LOGINID : {{$sms_acces->LOGINID}}</h5>
            <h5 class='card-title'>PASSWORD : {{$sms_acces->PASSWORD}}</h5>
            <h5 class='card-title'>USERTYPE : {{$sms_acces->USERTYPE}}</h5>
            <h5 class='card-title'>STATUS : {{$sms_acces->STATUS}}</h5>
            <h5 class='card-title'>CREATEDON : {{$sms_acces->CREATEDON}}</h5>
            <h5 class='card-title'>UPDATEDON : {{$sms_acces->UPDATEDON}}</h5>
            <h5 class='card-title'>CREATEDBY : {{$sms_acces->CREATEDBY}}</h5>
            <h5 class='card-title'>UPDATEDBY : {{$sms_acces->UPDATEDBY}}</h5>
            <h5 class='card-title'>OperatorID : {{$sms_acces->OperatorID}}</h5>
            <h5 class='card-title'>Remark : {{$sms_acces->Remark}}</h5>
            <h5 class='card-title'>deleted : {{$sms_acces->deleted}}</h5>
            <h5 class='card-title'>sms_id : {{$sms_acces->sms_id}}</h5><a class='card-link' href='{{ Request::root() }}/sms_access/change-status-sms_access/{{ $sms_acces->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($sms_acces->status == 0)
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
                     href='{{ Request::root() }}/sms_access/delete-sms_access/{{ $sms_acces->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit sms_access</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/sms_access/edit-sms_access-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $sms_acces->id ?>'   name='sms_access_id'>

    <div class="form-group">
        
        <label for="ID">ID:</label>
        <input type="text" value="{{ $sms_acces->ID}}" class="form-control" id="ID" name="ID">
    </div>
    <div class="form-group">
        
        <label for="NAME">NAME:</label>
        <input type="text" value="{{ $sms_acces->NAME}}" class="form-control" id="NAME" name="NAME">
    </div>
    <div class="form-group">
        
        <label for="LOGINID">LOGINID:</label>
        <input type="text" value="{{ $sms_acces->LOGINID}}" class="form-control" id="LOGINID" name="LOGINID">
    </div>
    <div class="form-group">
        
        <label for="PASSWORD">PASSWORD:</label>
        <input type="text" value="{{ $sms_acces->PASSWORD}}" class="form-control" id="PASSWORD" name="PASSWORD">
    </div>
    <div class="form-group">
        
        <label for="USERTYPE">USERTYPE:</label>
        <input type="text" value="{{ $sms_acces->USERTYPE}}" class="form-control" id="USERTYPE" name="USERTYPE">
    </div>
    <div class="form-group">
        
        <label for="STATUS">STATUS:</label>
        <input type="text" value="{{ $sms_acces->STATUS}}" class="form-control" id="STATUS" name="STATUS">
    </div>
    <div class="form-group">
        
        <label for="CREATEDON">CREATEDON:</label>
        <input type="text" value="{{ $sms_acces->CREATEDON}}" class="form-control" id="CREATEDON" name="CREATEDON">
    </div>
    <div class="form-group">
        
        <label for="UPDATEDON">UPDATEDON:</label>
        <input type="text" value="{{ $sms_acces->UPDATEDON}}" class="form-control" id="UPDATEDON" name="UPDATEDON">
    </div>
    <div class="form-group">
        
        <label for="CREATEDBY">CREATEDBY:</label>
        <input type="text" value="{{ $sms_acces->CREATEDBY}}" class="form-control" id="CREATEDBY" name="CREATEDBY">
    </div>
    <div class="form-group">
        
        <label for="UPDATEDBY">UPDATEDBY:</label>
        <input type="text" value="{{ $sms_acces->UPDATEDBY}}" class="form-control" id="UPDATEDBY" name="UPDATEDBY">
    </div>
    <div class="form-group">
        
        <label for="OperatorID">OperatorID:</label>
        <input type="text" value="{{ $sms_acces->OperatorID}}" class="form-control" id="OperatorID" name="OperatorID">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $sms_acces->Remark}}" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="deleted">deleted:</label>
        <input type="text" value="{{ $sms_acces->deleted}}" class="form-control" id="deleted" name="deleted">
    </div>
    <div class="form-group">
        
        <label for="sms_id">sms_id:</label>
        <input type="text" value="{{ $sms_acces->sms_id}}" class="form-control" id="sms_id" name="sms_id">
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
    <strong>No sms_accesss Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')