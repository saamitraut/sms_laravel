@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">sms_operator</h4>

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
>Add sms_operator </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add sms_operator</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/sms_operator/add-sms_operator-post" >
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
        
        <label for="CODE">CODE:</label>
        <input type="text" class="form-control" id="CODE" name="CODE">
    </div>
    <div class="form-group">
        
        <label for="CONTACTPERSON">CONTACTPERSON:</label>
        <input type="text" class="form-control" id="CONTACTPERSON" name="CONTACTPERSON">
    </div>
    <div class="form-group">
        
        <label for="ParentId">ParentId:</label>
        <input type="text" class="form-control" id="ParentId" name="ParentId">
    </div>
    <div class="form-group">
        
        <label for="TobeBilled">TobeBilled:</label>
        <input type="text" class="form-control" id="TobeBilled" name="TobeBilled">
    </div>
    <div class="form-group">
        
        <label for="BillingFrom">BillingFrom:</label>
        <input type="text" class="form-control" id="BillingFrom" name="BillingFrom">
    </div>
    <div class="form-group">
        
        <label for="ADDRESS">ADDRESS:</label>
        <input type="text" class="form-control" id="ADDRESS" name="ADDRESS">
    </div>
    <div class="form-group">
        
        <label for="MOBILE">MOBILE:</label>
        <input type="text" class="form-control" id="MOBILE" name="MOBILE">
    </div>
    <div class="form-group">
        
        <label for="Email">Email:</label>
        <input type="text" class="form-control" id="Email" name="Email">
    </div>
    <div class="form-group">
        
        <label for="PHONE">PHONE:</label>
        <input type="text" class="form-control" id="PHONE" name="PHONE">
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
        
        <label for="LogInId">LogInId:</label>
        <input type="text" class="form-control" id="LogInId" name="LogInId">
    </div>
    <div class="form-group">
        
        <label for="Password">Password:</label>
        <input type="text" class="form-control" id="Password" name="Password">
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
        
        <label for="branch">branch:</label>
        <input type="text" class="form-control" id="branch" name="branch">
    </div>
    <div class="form-group">
        
        <label for="AreaId">AreaId:</label>
        <input type="text" class="form-control" id="AreaId" name="AreaId">
    </div>
    <div class="form-group">
        
        <label for="PanNo">PanNo:</label>
        <input type="text" class="form-control" id="PanNo" name="PanNo">
    </div>
    <div class="form-group">
        
        <label for="SerTaxNo">SerTaxNo:</label>
        <input type="text" class="form-control" id="SerTaxNo" name="SerTaxNo">
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
@if(count($sms_operator) > 0)	
        <nav aria-label="Page navigation">{{ $sms_operator->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($sms_operator as $sms_operator)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>ID : {{$sms_operator->ID}}</h5>
            <h5 class='card-title'>NAME : {{$sms_operator->NAME}}</h5>
            <h5 class='card-title'>CODE : {{$sms_operator->CODE}}</h5>
            <h5 class='card-title'>CONTACTPERSON : {{$sms_operator->CONTACTPERSON}}</h5>
            <h5 class='card-title'>ParentId : {{$sms_operator->ParentId}}</h5>
            <h5 class='card-title'>TobeBilled : {{$sms_operator->TobeBilled}}</h5>
            <h5 class='card-title'>BillingFrom : {{$sms_operator->BillingFrom}}</h5>
            <h5 class='card-title'>ADDRESS : {{$sms_operator->ADDRESS}}</h5>
            <h5 class='card-title'>MOBILE : {{$sms_operator->MOBILE}}</h5>
            <h5 class='card-title'>Email : {{$sms_operator->Email}}</h5>
            <h5 class='card-title'>PHONE : {{$sms_operator->PHONE}}</h5>
            <h5 class='card-title'>STATUS : {{$sms_operator->STATUS}}</h5>
            <h5 class='card-title'>CREATEDON : {{$sms_operator->CREATEDON}}</h5>
            <h5 class='card-title'>UPDATEDON : {{$sms_operator->UPDATEDON}}</h5>
            <h5 class='card-title'>CREATEDBY : {{$sms_operator->CREATEDBY}}</h5>
            <h5 class='card-title'>UPDATEDBY : {{$sms_operator->UPDATEDBY}}</h5>
            <h5 class='card-title'>LogInId : {{$sms_operator->LogInId}}</h5>
            <h5 class='card-title'>Password : {{$sms_operator->Password}}</h5>
            <h5 class='card-title'>Deleted : {{$sms_operator->Deleted}}</h5>
            <h5 class='card-title'>Remark : {{$sms_operator->Remark}}</h5>
            <h5 class='card-title'>sms_id : {{$sms_operator->sms_id}}</h5>
            <h5 class='card-title'>branch : {{$sms_operator->branch}}</h5>
            <h5 class='card-title'>AreaId : {{$sms_operator->AreaId}}</h5>
            <h5 class='card-title'>PanNo : {{$sms_operator->PanNo}}</h5>
            <h5 class='card-title'>SerTaxNo : {{$sms_operator->SerTaxNo}}</h5><a class='card-link' href='{{ Request::root() }}/sms_operator/change-status-sms_operator/{{ $sms_operator->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($sms_operator->status == 0)
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
                     href='{{ Request::root() }}/sms_operator/delete-sms_operator/{{ $sms_operator->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit sms_operator</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/sms_operator/edit-sms_operator-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $sms_operator->id ?>'   name='sms_operator_id'>

    <div class="form-group">
        
        <label for="ID">ID:</label>
        <input type="text" value="{{ $sms_operator->ID}}" class="form-control" id="ID" name="ID">
    </div>
    <div class="form-group">
        
        <label for="NAME">NAME:</label>
        <input type="text" value="{{ $sms_operator->NAME}}" class="form-control" id="NAME" name="NAME">
    </div>
    <div class="form-group">
        
        <label for="CODE">CODE:</label>
        <input type="text" value="{{ $sms_operator->CODE}}" class="form-control" id="CODE" name="CODE">
    </div>
    <div class="form-group">
        
        <label for="CONTACTPERSON">CONTACTPERSON:</label>
        <input type="text" value="{{ $sms_operator->CONTACTPERSON}}" class="form-control" id="CONTACTPERSON" name="CONTACTPERSON">
    </div>
    <div class="form-group">
        
        <label for="ParentId">ParentId:</label>
        <input type="text" value="{{ $sms_operator->ParentId}}" class="form-control" id="ParentId" name="ParentId">
    </div>
    <div class="form-group">
        
        <label for="TobeBilled">TobeBilled:</label>
        <input type="text" value="{{ $sms_operator->TobeBilled}}" class="form-control" id="TobeBilled" name="TobeBilled">
    </div>
    <div class="form-group">
        
        <label for="BillingFrom">BillingFrom:</label>
        <input type="text" value="{{ $sms_operator->BillingFrom}}" class="form-control" id="BillingFrom" name="BillingFrom">
    </div>
    <div class="form-group">
        
        <label for="ADDRESS">ADDRESS:</label>
        <input type="text" value="{{ $sms_operator->ADDRESS}}" class="form-control" id="ADDRESS" name="ADDRESS">
    </div>
    <div class="form-group">
        
        <label for="MOBILE">MOBILE:</label>
        <input type="text" value="{{ $sms_operator->MOBILE}}" class="form-control" id="MOBILE" name="MOBILE">
    </div>
    <div class="form-group">
        
        <label for="Email">Email:</label>
        <input type="text" value="{{ $sms_operator->Email}}" class="form-control" id="Email" name="Email">
    </div>
    <div class="form-group">
        
        <label for="PHONE">PHONE:</label>
        <input type="text" value="{{ $sms_operator->PHONE}}" class="form-control" id="PHONE" name="PHONE">
    </div>
    <div class="form-group">
        
        <label for="STATUS">STATUS:</label>
        <input type="text" value="{{ $sms_operator->STATUS}}" class="form-control" id="STATUS" name="STATUS">
    </div>
    <div class="form-group">
        
        <label for="CREATEDON">CREATEDON:</label>
        <input type="text" value="{{ $sms_operator->CREATEDON}}" class="form-control" id="CREATEDON" name="CREATEDON">
    </div>
    <div class="form-group">
        
        <label for="UPDATEDON">UPDATEDON:</label>
        <input type="text" value="{{ $sms_operator->UPDATEDON}}" class="form-control" id="UPDATEDON" name="UPDATEDON">
    </div>
    <div class="form-group">
        
        <label for="CREATEDBY">CREATEDBY:</label>
        <input type="text" value="{{ $sms_operator->CREATEDBY}}" class="form-control" id="CREATEDBY" name="CREATEDBY">
    </div>
    <div class="form-group">
        
        <label for="UPDATEDBY">UPDATEDBY:</label>
        <input type="text" value="{{ $sms_operator->UPDATEDBY}}" class="form-control" id="UPDATEDBY" name="UPDATEDBY">
    </div>
    <div class="form-group">
        
        <label for="LogInId">LogInId:</label>
        <input type="text" value="{{ $sms_operator->LogInId}}" class="form-control" id="LogInId" name="LogInId">
    </div>
    <div class="form-group">
        
        <label for="Password">Password:</label>
        <input type="text" value="{{ $sms_operator->Password}}" class="form-control" id="Password" name="Password">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" value="{{ $sms_operator->Deleted}}" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $sms_operator->Remark}}" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="sms_id">sms_id:</label>
        <input type="text" value="{{ $sms_operator->sms_id}}" class="form-control" id="sms_id" name="sms_id">
    </div>
    <div class="form-group">
        
        <label for="branch">branch:</label>
        <input type="text" value="{{ $sms_operator->branch}}" class="form-control" id="branch" name="branch">
    </div>
    <div class="form-group">
        
        <label for="AreaId">AreaId:</label>
        <input type="text" value="{{ $sms_operator->AreaId}}" class="form-control" id="AreaId" name="AreaId">
    </div>
    <div class="form-group">
        
        <label for="PanNo">PanNo:</label>
        <input type="text" value="{{ $sms_operator->PanNo}}" class="form-control" id="PanNo" name="PanNo">
    </div>
    <div class="form-group">
        
        <label for="SerTaxNo">SerTaxNo:</label>
        <input type="text" value="{{ $sms_operator->SerTaxNo}}" class="form-control" id="SerTaxNo" name="SerTaxNo">
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
    <strong>No sms_operators Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')