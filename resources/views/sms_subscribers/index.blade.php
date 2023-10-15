@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">sms_subscribers</h4>

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
>Add sms_subscribers </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add sms_subscribers</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/sms_subscribers/add-sms_subscribers-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="FormNo">FormNo:</label>
        <input type="text" class="form-control" id="FormNo" name="FormNo">
    </div>
    <div class="form-group">
        
        <label for="CustomerId">CustomerId:</label>
        <input type="text" class="form-control" id="CustomerId" name="CustomerId">
    </div>
    <div class="form-group">
        
        <label for="OperatorId">OperatorId:</label>
        <input type="text" class="form-control" id="OperatorId" name="OperatorId">
    </div>
    <div class="form-group">
        
        <label for="SocietyId">SocietyId:</label>
        <input type="text" class="form-control" id="SocietyId" name="SocietyId">
    </div>
    <div class="form-group">
        
        <label for="MobileNo">MobileNo:</label>
        <input type="text" class="form-control" id="MobileNo" name="MobileNo">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="ProspectId">ProspectId:</label>
        <input type="text" class="form-control" id="ProspectId" name="ProspectId">
    </div>
    <div class="form-group">
        
        <label for="PCustomerId">PCustomerId:</label>
        <input type="text" class="form-control" id="PCustomerId" name="PCustomerId">
    </div>
    <div class="form-group">
        
        <label for="OpTobeBilled">OpTobeBilled:</label>
        <input type="text" class="form-control" id="OpTobeBilled" name="OpTobeBilled">
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
@if(count($sms_subscribers) > 0)	
        <nav aria-label="Page navigation">{{ $sms_subscribers->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($sms_subscribers as $sms_subscriber)
        <div class='card mb-4'>
            <div class='card-body'>
			<div class="row">
			<div class="col-lg-6 mb-4 mb-xl-0">
            <!--<h5 class='card-title'>Id : {{$sms_subscriber->Id}}</h5>-->
            <p class="card-text"><b>SubscriberName :</b> {{$sms_subscriber->subscriber_deatils->FName }} {{$sms_subscriber->subscriber_deatils->Mname  }} {{$sms_subscriber->subscriber_deatils->LName}}</p>
			
			@php 	$carbon = \Illuminate\Support\Carbon::parse($sms_subscriber->CreatedOn);
					$date = $carbon->format('M d Y h:iA');
			@endphp
			<p class="card-text"><b>Addedby</b> {{$sms_subscriber->createdby->NAME }} <b>On</b>  {{$date}}  </p>			
			<p class="card-text"><b>MobileNo</b> : {{$sms_subscriber->MobileNo}}</p>
				<div class="row">
					<div class="col-md-4 col-12 mb-3 mb-md-0">
					<b>CustomerId :</b> {{$sms_subscriber->CustomerId}}</div>
					
					<div class="col-md-4 col-12 mb-3 mb-md-0">
					<b>FormNo :</b> {{$sms_subscriber->FormNo}} </div>
				</div>			
				<p class="card-text"><div class="row">
					<div class="card-text col-md-4 col-12 mb-3 mb-md-0"><b>Operator :</b> {{$sms_subscriber->operator->NAME }} </div>				
					<div class="col-md-4 col-12 mb-3 mb-md-0"><b>CODE :</b> {{$sms_subscriber->operator->CODE }}</div>
				</div></p>
				<div class="row">
					
					<div class="col-md-4 col-12 mb-3 mb-md-0"><b>Society :</b> {{$sms_subscriber->society->SocietyName }} </div>
					<div class="col-md-4 col-12 mb-3 mb-md-0"><b>Area :</b> {{$sms_subscriber->society->area->NAME }}</div>
				</div>
            <!--<h5 class='card-title'>OperatorId : {{$sms_subscriber->OperatorId}}</h5>
            <h5 class='card-title'>SocietyId : {{$sms_subscriber->SocietyId}}</h5>
            <h5 class='card-title'>MobileNo : {{$sms_subscriber->MobileNo}}</h5>
            <h5 class='card-title'>Status : {{$sms_subscriber->Status}}</h5>
            <h5 class='card-title'>ProspectId : {{$sms_subscriber->ProspectId}}</h5>
            <h5 class='card-title'>PCustomerId : {{$sms_subscriber->PCustomerId}}</h5>
            <h5 class='card-title'>OpTobeBilled : {{$sms_subscriber->OpTobeBilled}}</h5>
            <h5 class='card-title'>CreatedOn : {{$sms_subscriber->CreatedOn}}</h5>
            <h5 class='card-title'>CreatedBy : {{$sms_subscriber->CreatedBy}}</h5>
            <h5 class='card-title'>UpdatedOn : {{$sms_subscriber->UpdatedOn}}</h5>
            <h5 class='card-title'>UpdatedBy : {{$sms_subscriber->UpdatedBy}}</h5>
            <h5 class='card-title'>Deleted : {{$sms_subscriber->Deleted}}</h5>
            <h5 class='card-title'>Remark : {{$sms_subscriber->Remark}}</h5>
            <h5 class='card-title'>sms_id : {{$sms_subscriber->sms_id}}</h5>-->
			</div>
		<div class="col-lg-6">
                      <small class="text-light fw-semibold">Accounts</small>
                      <div class="mt-3">
                        <div class="row">
                          <div class="col-md-4 col-12 mb-3 mb-md-0">
                            <div class="list-group">
                              @php	$counter=1;	 @endphp
							  @foreach($sms_subscriber->accounts as $account)
							  <a class="list-group-item list-group-item-action" id="list-{{$account->Id}}-list" data-bs-toggle="list" href="#list-{{$account->Id}}">Account {{$counter}}</a>
							  @php	$counter++;	@endphp
							  @endforeach
                            </div>
                          </div>
                          <div class="col-md-8 col-12">
                            <div class="tab-content p-0">
							@foreach($sms_subscriber->accounts as $account) 
                              <div class="tab-pane fade" id="list-{{$account->Id}}">
	@php 	$carbon = \Illuminate\Support\Carbon::parse($account->CreatedOn);
			$date = $carbon->format('M d Y h:iA');
			@endphp
	<p class="card-text">
		@if ($account->Status === 1)
            <button type="button" class="btn rounded-pill btn-outline-primary">Active</button>
        @else
            <button type="button" class="btn rounded-pill btn-outline-secondary">InActive</button>
        @endif</p>
	
	<p class="card-text"><b>AccountId :</b> {{$account->Id}}</p>
	<p class="card-text"><b>Addedon :</b> {{$date}}</p>
	<p class="card-text"><b>Addedby :</b> {{$account->createdby->NAME}}</p>
	<p class="card-text"><b>STBNo :</b> {{$account->pairing->stb->STBNo}}</p>
	<p class="card-text"><b>STBModel :</b> {{$account->pairing->stb->brand->BrandTitle}} & <b> Box Type :</b> {{$account->pairing->stb->brand->BoxType?'HD':'SD'}}</p>
	<p class="card-text"><b>SmartcardNo :</b> {{$account->pairing->smartcard->SmartcardNo}}</p>
	<p class="card-text"><b>ActivationDate :</b> {{$account->ActivationDate}}</p>
	<p class="card-text"><b>DeactivationDate :</b>{{$account->DeactivationDate}}</p>
	<p class="card-text"><b>Remark :</b> {{$account->Remark}}</p>
	<p class="card-text"><b>Bouques :</b> {{$account->transactions->count()}}</p>
							  <!--<div class="tab-pane fade" id="list-{{$account->Id}}">
								SubscriberId : {{$account->SubscriberId}}<br>
								IsPrimary : {{$account->IsPrimary}}<br>
								PairingId : {{$account->PairingId}}<br>
								ActivationDate : {{$account->ActivationDate}}<br>
								DeactivationDate : {{$account->DeactivationDate}}<br>
								Remark : {{$account->Remark}} <br>-->
                              </div>
							@endforeach
                            </div>
                          </div>
                        </div>
                      </div>
            </div>
			</div><br>
			<a class='card-link' href='{{ Request::root() }}/sms_subscribers/change-status-sms_subscribers/{{ $sms_subscriber->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($sms_subscriber->status == 0)
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
                     href='{{ Request::root() }}/sms_subscribers/delete-sms_subscribers/{{ $sms_subscriber->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit sms_subscribers</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/sms_subscribers/edit-sms_subscribers-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $sms_subscriber->id ?>'   name='sms_subscribers_id'>

    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" value="{{ $sms_subscriber->Id}}" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="FormNo">FormNo:</label>
        <input type="text" value="{{ $sms_subscriber->FormNo}}" class="form-control" id="FormNo" name="FormNo">
    </div>
    <div class="form-group">
        
        <label for="CustomerId">CustomerId:</label>
        <input type="text" value="{{ $sms_subscriber->CustomerId}}" class="form-control" id="CustomerId" name="CustomerId">
    </div>
    <div class="form-group">
        
        <label for="OperatorId">OperatorId:</label>
        <input type="text" value="{{ $sms_subscriber->OperatorId}}" class="form-control" id="OperatorId" name="OperatorId">
    </div>
    <div class="form-group">
        
        <label for="SocietyId">SocietyId:</label>
        <input type="text" value="{{ $sms_subscriber->SocietyId}}" class="form-control" id="SocietyId" name="SocietyId">
    </div>
    <div class="form-group">
        
        <label for="MobileNo">MobileNo:</label>
        <input type="text" value="{{ $sms_subscriber->MobileNo}}" class="form-control" id="MobileNo" name="MobileNo">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" value="{{ $sms_subscriber->Status}}" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="ProspectId">ProspectId:</label>
        <input type="text" value="{{ $sms_subscriber->ProspectId}}" class="form-control" id="ProspectId" name="ProspectId">
    </div>
    <div class="form-group">
        
        <label for="PCustomerId">PCustomerId:</label>
        <input type="text" value="{{ $sms_subscriber->PCustomerId}}" class="form-control" id="PCustomerId" name="PCustomerId">
    </div>
    <div class="form-group">
        
        <label for="OpTobeBilled">OpTobeBilled:</label>
        <input type="text" value="{{ $sms_subscriber->OpTobeBilled}}" class="form-control" id="OpTobeBilled" name="OpTobeBilled">
    </div>
    <div class="form-group">
        
        <label for="CreatedOn">CreatedOn:</label>
        <input type="text" value="{{ $sms_subscriber->CreatedOn}}" class="form-control" id="CreatedOn" name="CreatedOn">
    </div>
    <div class="form-group">
        
        <label for="CreatedBy">CreatedBy:</label>
        <input type="text" value="{{ $sms_subscriber->CreatedBy}}" class="form-control" id="CreatedBy" name="CreatedBy">
    </div>
    <div class="form-group">
        
        <label for="UpdatedOn">UpdatedOn:</label>
        <input type="text" value="{{ $sms_subscriber->UpdatedOn}}" class="form-control" id="UpdatedOn" name="UpdatedOn">
    </div>
    <div class="form-group">
        
        <label for="UpdatedBy">UpdatedBy:</label>
        <input type="text" value="{{ $sms_subscriber->UpdatedBy}}" class="form-control" id="UpdatedBy" name="UpdatedBy">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" value="{{ $sms_subscriber->Deleted}}" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $sms_subscriber->Remark}}" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="sms_id">sms_id:</label>
        <input type="text" value="{{ $sms_subscriber->sms_id}}" class="form-control" id="sms_id" name="sms_id">
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
    <strong>No sms_subscriberss Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')