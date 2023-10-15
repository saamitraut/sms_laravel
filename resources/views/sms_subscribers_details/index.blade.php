@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">sms_subscribers_details</h4>

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
>Add sms_subscribers_details </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add sms_subscribers_details</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/sms_subscribers_details/add-sms_subscribers_details-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="SubscriberId">SubscriberId:</label>
        <input type="text" class="form-control" id="SubscriberId" name="SubscriberId">
    </div>
    <div class="form-group">
        
        <label for="FName">FName:</label>
        <input type="text" class="form-control" id="FName" name="FName">
    </div>
    <div class="form-group">
        
        <label for="LName">LName:</label>
        <input type="text" class="form-control" id="LName" name="LName">
    </div>
    <div class="form-group">
        
        <label for="Mname">Mname:</label>
        <input type="text" class="form-control" id="Mname" name="Mname">
    </div>
    <div class="form-group">
        
        <label for="FlatNo">FlatNo:</label>
        <input type="text" class="form-control" id="FlatNo" name="FlatNo">
    </div>
    <div class="form-group">
        
        <label for="FloorNo">FloorNo:</label>
        <input type="text" class="form-control" id="FloorNo" name="FloorNo">
    </div>
    <div class="form-group">
        
        <label for="Wing">Wing:</label>
        <input type="text" class="form-control" id="Wing" name="Wing">
    </div>
    <div class="form-group">
        
        <label for="Building">Building:</label>
        <input type="text" class="form-control" id="Building" name="Building">
    </div>
    <div class="form-group">
        
        <label for="Address">Address:</label>
        <input type="text" class="form-control" id="Address" name="Address">
    </div>
    <div class="form-group">
        
        <label for="Gender">Gender:</label>
        <input type="text" class="form-control" id="Gender" name="Gender">
    </div>
    <div class="form-group">
        
        <label for="Verify">Verify:</label>
        <input type="text" class="form-control" id="Verify" name="Verify">
    </div>
    <div class="form-group">
        
        <label for="Zipcode">Zipcode:</label>
        <input type="text" class="form-control" id="Zipcode" name="Zipcode">
    </div>
    <div class="form-group">
        
        <label for="Email">Email:</label>
        <input type="text" class="form-control" id="Email" name="Email">
    </div>
    <div class="form-group">
        
        <label for="Phone">Phone:</label>
        <input type="text" class="form-control" id="Phone" name="Phone">
    </div>
    <div class="form-group">
        
        <label for="DOB">DOB:</label>
        <input type="text" class="form-control" id="DOB" name="DOB">
    </div>
    <div class="form-group">
        
        <label for="OCCUPATION">OCCUPATION:</label>
        <input type="text" class="form-control" id="OCCUPATION" name="OCCUPATION">
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
        
        <label for="photoprooftype">photoprooftype:</label>
        <input type="text" class="form-control" id="photoprooftype" name="photoprooftype">
    </div>
    <div class="form-group">
        
        <label for="photoprooffilename">photoprooffilename:</label>
        <input type="text" class="form-control" id="photoprooffilename" name="photoprooffilename">
    </div>
    <div class="form-group">
        
        <label for="addressprooftype">addressprooftype:</label>
        <input type="text" class="form-control" id="addressprooftype" name="addressprooftype">
    </div>
    <div class="form-group">
        
        <label for="addressprooffilename">addressprooffilename:</label>
        <input type="text" class="form-control" id="addressprooffilename" name="addressprooffilename">
    </div>
    <div class="form-group">
        
        <label for="BillingAddress">BillingAddress:</label>
        <input type="text" class="form-control" id="BillingAddress" name="BillingAddress">
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
@if(count($sms_subscribers_details) > 0)	
        <nav aria-label="Page navigation">{{ $sms_subscribers_details->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($sms_subscribers_details as $sms_subscribers_detail)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>Id : {{$sms_subscribers_detail->Id}}</h5>
            <h5 class='card-title'>SubscriberId : {{$sms_subscribers_detail->SubscriberId}}</h5>
            <h5 class='card-title'>FName : {{$sms_subscribers_detail->FName}}</h5>
            <h5 class='card-title'>LName : {{$sms_subscribers_detail->LName}}</h5>
            <h5 class='card-title'>Mname : {{$sms_subscribers_detail->Mname}}</h5>
            <h5 class='card-title'>FlatNo : {{$sms_subscribers_detail->FlatNo}}</h5>
            <h5 class='card-title'>FloorNo : {{$sms_subscribers_detail->FloorNo}}</h5>
            <h5 class='card-title'>Wing : {{$sms_subscribers_detail->Wing}}</h5>
            <h5 class='card-title'>Building : {{$sms_subscribers_detail->Building}}</h5>
            <h5 class='card-title'>Address : {{$sms_subscribers_detail->Address}}</h5>
            <h5 class='card-title'>Gender : {{$sms_subscribers_detail->Gender}}</h5>
            <h5 class='card-title'>Verify : {{$sms_subscribers_detail->Verify}}</h5>
            <h5 class='card-title'>Zipcode : {{$sms_subscribers_detail->Zipcode}}</h5>
            <h5 class='card-title'>Email : {{$sms_subscribers_detail->Email}}</h5>
            <h5 class='card-title'>Phone : {{$sms_subscribers_detail->Phone}}</h5>
            <h5 class='card-title'>DOB : {{$sms_subscribers_detail->DOB}}</h5>
            <h5 class='card-title'>OCCUPATION : {{$sms_subscribers_detail->OCCUPATION}}</h5>
            <h5 class='card-title'>CreatedOn : {{$sms_subscribers_detail->CreatedOn}}</h5>
            <h5 class='card-title'>CreatedBy : {{$sms_subscribers_detail->CreatedBy}}</h5>
            <h5 class='card-title'>UpdatedOn : {{$sms_subscribers_detail->UpdatedOn}}</h5>
            <h5 class='card-title'>UpdatedBy : {{$sms_subscribers_detail->UpdatedBy}}</h5>
            <h5 class='card-title'>Deleted : {{$sms_subscribers_detail->Deleted}}</h5>
            <h5 class='card-title'>Remark : {{$sms_subscribers_detail->Remark}}</h5>
            <h5 class='card-title'>photoprooftype : {{$sms_subscribers_detail->photoprooftype}}</h5>
            <h5 class='card-title'>photoprooffilename : {{$sms_subscribers_detail->photoprooffilename}}</h5>
            <h5 class='card-title'>addressprooftype : {{$sms_subscribers_detail->addressprooftype}}</h5>
            <h5 class='card-title'>addressprooffilename : {{$sms_subscribers_detail->addressprooffilename}}</h5>
            <h5 class='card-title'>BillingAddress : {{$sms_subscribers_detail->BillingAddress}}</h5><a class='card-link' href='{{ Request::root() }}/sms_subscribers_details/change-status-sms_subscribers_details/{{ $sms_subscribers_detail->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($sms_subscribers_detail->status == 0)
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
                     href='{{ Request::root() }}/sms_subscribers_details/delete-sms_subscribers_details/{{ $sms_subscribers_detail->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit sms_subscribers_details</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/sms_subscribers_details/edit-sms_subscribers_details-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $sms_subscribers_detail->id ?>'   name='sms_subscribers_details_id'>

    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" value="{{ $sms_subscribers_detail->Id}}" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="SubscriberId">SubscriberId:</label>
        <input type="text" value="{{ $sms_subscribers_detail->SubscriberId}}" class="form-control" id="SubscriberId" name="SubscriberId">
    </div>
    <div class="form-group">
        
        <label for="FName">FName:</label>
        <input type="text" value="{{ $sms_subscribers_detail->FName}}" class="form-control" id="FName" name="FName">
    </div>
    <div class="form-group">
        
        <label for="LName">LName:</label>
        <input type="text" value="{{ $sms_subscribers_detail->LName}}" class="form-control" id="LName" name="LName">
    </div>
    <div class="form-group">
        
        <label for="Mname">Mname:</label>
        <input type="text" value="{{ $sms_subscribers_detail->Mname}}" class="form-control" id="Mname" name="Mname">
    </div>
    <div class="form-group">
        
        <label for="FlatNo">FlatNo:</label>
        <input type="text" value="{{ $sms_subscribers_detail->FlatNo}}" class="form-control" id="FlatNo" name="FlatNo">
    </div>
    <div class="form-group">
        
        <label for="FloorNo">FloorNo:</label>
        <input type="text" value="{{ $sms_subscribers_detail->FloorNo}}" class="form-control" id="FloorNo" name="FloorNo">
    </div>
    <div class="form-group">
        
        <label for="Wing">Wing:</label>
        <input type="text" value="{{ $sms_subscribers_detail->Wing}}" class="form-control" id="Wing" name="Wing">
    </div>
    <div class="form-group">
        
        <label for="Building">Building:</label>
        <input type="text" value="{{ $sms_subscribers_detail->Building}}" class="form-control" id="Building" name="Building">
    </div>
    <div class="form-group">
        
        <label for="Address">Address:</label>
        <input type="text" value="{{ $sms_subscribers_detail->Address}}" class="form-control" id="Address" name="Address">
    </div>
    <div class="form-group">
        
        <label for="Gender">Gender:</label>
        <input type="text" value="{{ $sms_subscribers_detail->Gender}}" class="form-control" id="Gender" name="Gender">
    </div>
    <div class="form-group">
        
        <label for="Verify">Verify:</label>
        <input type="text" value="{{ $sms_subscribers_detail->Verify}}" class="form-control" id="Verify" name="Verify">
    </div>
    <div class="form-group">
        
        <label for="Zipcode">Zipcode:</label>
        <input type="text" value="{{ $sms_subscribers_detail->Zipcode}}" class="form-control" id="Zipcode" name="Zipcode">
    </div>
    <div class="form-group">
        
        <label for="Email">Email:</label>
        <input type="text" value="{{ $sms_subscribers_detail->Email}}" class="form-control" id="Email" name="Email">
    </div>
    <div class="form-group">
        
        <label for="Phone">Phone:</label>
        <input type="text" value="{{ $sms_subscribers_detail->Phone}}" class="form-control" id="Phone" name="Phone">
    </div>
    <div class="form-group">
        
        <label for="DOB">DOB:</label>
        <input type="text" value="{{ $sms_subscribers_detail->DOB}}" class="form-control" id="DOB" name="DOB">
    </div>
    <div class="form-group">
        
        <label for="OCCUPATION">OCCUPATION:</label>
        <input type="text" value="{{ $sms_subscribers_detail->OCCUPATION}}" class="form-control" id="OCCUPATION" name="OCCUPATION">
    </div>
    <div class="form-group">
        
        <label for="CreatedOn">CreatedOn:</label>
        <input type="text" value="{{ $sms_subscribers_detail->CreatedOn}}" class="form-control" id="CreatedOn" name="CreatedOn">
    </div>
    <div class="form-group">
        
        <label for="CreatedBy">CreatedBy:</label>
        <input type="text" value="{{ $sms_subscribers_detail->CreatedBy}}" class="form-control" id="CreatedBy" name="CreatedBy">
    </div>
    <div class="form-group">
        
        <label for="UpdatedOn">UpdatedOn:</label>
        <input type="text" value="{{ $sms_subscribers_detail->UpdatedOn}}" class="form-control" id="UpdatedOn" name="UpdatedOn">
    </div>
    <div class="form-group">
        
        <label for="UpdatedBy">UpdatedBy:</label>
        <input type="text" value="{{ $sms_subscribers_detail->UpdatedBy}}" class="form-control" id="UpdatedBy" name="UpdatedBy">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" value="{{ $sms_subscribers_detail->Deleted}}" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $sms_subscribers_detail->Remark}}" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="photoprooftype">photoprooftype:</label>
        <input type="text" value="{{ $sms_subscribers_detail->photoprooftype}}" class="form-control" id="photoprooftype" name="photoprooftype">
    </div>
    <div class="form-group">
        
        <label for="photoprooffilename">photoprooffilename:</label>
        <input type="text" value="{{ $sms_subscribers_detail->photoprooffilename}}" class="form-control" id="photoprooffilename" name="photoprooffilename">
    </div>
    <div class="form-group">
        
        <label for="addressprooftype">addressprooftype:</label>
        <input type="text" value="{{ $sms_subscribers_detail->addressprooftype}}" class="form-control" id="addressprooftype" name="addressprooftype">
    </div>
    <div class="form-group">
        
        <label for="addressprooffilename">addressprooffilename:</label>
        <input type="text" value="{{ $sms_subscribers_detail->addressprooffilename}}" class="form-control" id="addressprooffilename" name="addressprooffilename">
    </div>
    <div class="form-group">
        
        <label for="BillingAddress">BillingAddress:</label>
        <input type="text" value="{{ $sms_subscribers_detail->BillingAddress}}" class="form-control" id="BillingAddress" name="BillingAddress">
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
    <strong>No sms_subscribers_detailss Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')