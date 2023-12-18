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
</script>

@include('sms_subscribers.components._SmsSubscriberModal')

@if(count($sms_subscribers) > 0)	
        <nav aria-label="Page navigation">{{ $sms_subscribers->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($sms_subscribers as $sms_subscriber)
		@php 	$carbon = \Illuminate\Support\Carbon::parse ($sms_subscriber->CreatedOn);
			$date = $carbon->format('M d Y h:iA');
		@endphp
        <div class='card mb-4'>
            <div class='card-body'>
			<ul class="list-group list-group-horizontal-md text-md-center">
                       <li class="list-group-item"><b>SubscriberName</b> {{$sms_subscriber->subscriber_deatils->FName }} {{$sms_subscriber->subscriber_deatils->Mname  }} {{$sms_subscriber->subscriber_deatils->LName}}</li>
                      <li class="list-group-item"><b>Addedby</b> {{$sms_subscriber->createdby->NAME }}  {{$date}}  </li>
                      <li class="list-group-item"><b>MobileNo</b> : {{$sms_subscriber->MobileNo}}</li>
                      <li class="list-group-item"><b>CustomerId:</b> {{$sms_subscriber->CustomerId}}</li>
                      <li class="list-group-item"><b>FormNo :</b> {{$sms_subscriber->FormNo}}</li>
					  <li class="list-group-item"><b>Operator:</b> {{$sms_subscriber->operator->NAME }}</li>
					  <li class="list-group-item"><b>CODE:</b> {{$sms_subscriber->operator->CODE }}</li>
					   <li class="list-group-item"><b>Society:</b> {{$sms_subscriber->society->SocietyName }}</li>
					   <li class="list-group-item"><b>Area:</b> {{$sms_subscriber->society->area->NAME }}</li></ul>
			
		
                      <small class="text-light fw-semibold">Accounts</small>
                      <div class="demo-inline-spacing mt-3">
                            
							<div class="list-group list-group-horizontal-md text-md-center">
                              @php	$counter=1;	 @endphp
							  @foreach($sms_subscriber->accounts as $account)
							  <a class="list-group-item list-group-item-action" id="list-{{$account->Id}}-list" data-bs-toggle="list" href="#list-{{$account->Id}}">Account{{$counter}}</a>
							  @php	$counter++;	@endphp
							  @endforeach
                            </div>

                            <div class="tab-content p-0">
							@foreach($sms_subscriber->accounts as $account) 
                              <div class="tab-pane fade" id="list-{{$account->Id}}">
									@php 	$carbon = \Illuminate\Support\Carbon::parse($account->CreatedOn);
									$date = $carbon->format('M d Y h:iA');	@endphp
	
	<p class="card-text">
		@if ($account->Status === 1)
            <button type="button" class="btn rounded-pill btn-outline-primary">Active</button>
        @else
            <button type="button" class="btn rounded-pill btn-outline-secondary">InActive</button>
        @endif &ensp; <b>AccountId </b> {{$account->Id}}</p>
	<ul class="list-group list-group-horizontal-md text-md-center">
                      <li class="list-group-item"><b>Addedby</b> {{$account->createdby->NAME}} {{$date}}</li>
                      <li class="list-group-item"><b>STBNo/SmartcardNo:</b> {{$account->pairing->stb->STBNo}} {{$account->pairing->smartcard->SmartcardNo}}</li>
                      <li class="list-group-item"><b>STBModel BoxType:</b> {{$account->pairing->stb->brand->BrandTitle}} {{$account->pairing->stb->brand->BoxType?'HD':'SD'}}</li>
                      <li class="list-group-item"><b>ActivationDate DeactivationDate</b> {{$account->ActivationDate}} {{$account->DeactivationDate}}</li>
                      <li class="list-group-item"><b>Remark:</b> {{$account->Remark}}</li>
                      <li class="list-group-item"><b>Bouques</b>&ensp;{{$account->transactions->count()}}</li>
                      <li class="list-group-item"><b>Action</b><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addBouquets">
                          Add Bouque
                        </button></li>
                      <!--<li class="list-group-item">Vestibulum at eros</li>-->
                    </ul>
					<br>
					
					<div class="modal fade" id="addBouquets" tabindex="-1" style="display: none;" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-scrollable" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="modalScrollableTitle">Modal title</h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                            <div id="mydiv"></div>
                            <div>{{$sms_subscriber->Id}}</div>
                              <p>
							@php $assets=$sms_subscriber->operator->assets; 
							@endphp
              <div id="primary{{$sms_subscriber->Id}}">
								@foreach ($assets as $asset)
								@if ($asset->bouquet->AType==1)
									<p class="card-text">{{$asset->bouquet->BouqueName}} {{$asset->bouquet->AType}}</p>
								@endif
								@endforeach							
              </div>
                             
							  
							@php
   $primary_assets = $sms_subscriber->operator->assets->filter(function ($asset) {
       return $asset->bouquet->AType == 1;
   });
@endphp

@foreach ($primary_assets as $asset)
   {{ $asset->bouquet->BouqueName }} {{ $asset->bouquet->AType }}
@endforeach

								 </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                              <p>
                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
                                in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
                              </p>
                              <p>
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                lacus vel augue laoreet rutrum faucibus dolor auctor.
                              </p>
                              <p>
                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus
                                auctor fringilla.
                              </p>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                Close
                              </button>
                              <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                          </div>
                        </div>
                      </div>					
					
					<div class="row">
                <div class="col-xl-12">
                  <h6 class="text-muted">Account Details</h6>
                  <div class="nav-align-top mb-4">
                    <ul class="nav nav-tabs" role="tablist">
                      <li class="nav-item">
                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-transactions" aria-controls="navs-top-transactions" aria-selected="true">
                          Bouque Details
                        </button>
                      </li>
                      <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-profile" aria-controls="navs-top-profile" aria-selected="false">
                          Command History
                        </button>
                      </li>
                      <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-messages" aria-controls="navs-top-messages" aria-selected="false">
                          
						  Previous Bouquets Details
                        </button>
                      </li>
                    </ul>
                    <div class="tab-content">
                      <div class="tab-pane fade show active" id="navs-top-transactions" role="tabpanel">
					  
					  @php 
					  
					  $counter=1;	$group_number=0;				 
                      
					  $transactions = $account->transactions;					
					
						// Group the transactions by AddedBy and CreatedOn.
						$res = $transactions->groupBy('ActivationDate');
					   @endphp
				@foreach($res as $row)
				
				@php	$groupedTransactions = $row->groupBy('DeActivationDate'); @endphp
				
				@foreach($groupedTransactions as $group)
					  @php 							
							$group_number=$group_number+1;			
					  @endphp
					<div class="card accordion-item">
                      <h2 class="accordion-header" id="headingOne">
                        <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#accordion{{$group_number}}" aria-expanded="false" aria-controls="accordion{{$group_number}}">
                          <ul class="list-group list-group-horizontal-md text-md-center">						  
						  <li style="width:100%;" class="list-group-item"><b>Addedby</b>&ensp;{{$group->first()->createdby->NAME}}</li>
	@php 	$carbon = \Illuminate\Support\Carbon::parse($group->first()->CreatedOn);
									$date = $carbon->format('Y-m-d');	@endphp
						  <li style="width:100%;" class="list-group-item"><b>AddedOn</b>&ensp;{{$date}}</li>
						  <li style="width:100%;" class="list-group-item"><b>ActivationDate</b> {{$group->first()->ActivationDate}}</li>
						  <li style="width:100%;" class="list-group-item"><b>DeactivationDate</b> {{$group->first()->DeactivationDate}}</li>
							@php
							  $today = \Illuminate\Support\Carbon::today()->format('Y-m-d');
							  $status = $group->first()->DeactivationDate >= $today ? 'Active' : 'InActive';
							@endphp					
						  <li style="width:100%;" class="list-group-item"><b>Status</b> {{$status}}</li>
						  </ul>
                        </button>
                      </h2>

                      <div id="accordion{{$group_number}}" class="accordion-collapse collapse" data-bs-parent="#accordionExample" style="">
                        <div class="accordion-body">
							@foreach($group as $transaction)
								<ul class="list-group list-group-horizontal-md text-md-center">
									  <li style="width:10em;" class="list-group-item"><b>{{$counter++}}</b></li>
									  <li style="width:100%;" class="list-group-item"><b>{{$transaction->ActivationDate}}</b></li>
									  <li style="width:100%;" class="list-group-item"><b>Bouque</b> {{$transaction->bouque->BouqueName}}</li>
									  <li style="width:100%;" class="list-group-item"><b>Amount</b> {{$transaction->bouque->Rate}}</li>	 
									  <li style="width:100%;" class="list-group-item"><b>Channels</b> 
									  @php 
										$assets=$transaction->bouque->assets->where('ChannelId', '<>', null); 
									  @endphp
									  @foreach($assets as $asset)
											{{ $asset->channel->ChannelName}}{{ !$loop->last ? ', ' : '' }}
										@endforeach
									  </li>
									  <li style="width:100%;" class="list-group-item">
	@php $assets=$transaction->bouque->assets->where('PackageId', '<>', null);
	@endphp
					
					@if ($assets->count()>1)
					<div class="card accordion-item">
                      <h2 class="accordion-header" id="headingTwo">
                        <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#accordion{{$counter}}" aria-expanded="false" aria-controls="accordion{{$counter}}">
                          Packages
                        </button>
                      </h2>
                      <div id="accordion{{$counter}}" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                        <div class="accordion-body">                          
										@foreach($assets as $asset)
											<p class="card-text">{{ $asset->package->PackageName}}{{ !$loop->last ? ', ' : '' }}</p>
										@endforeach
                        </div>
                      </div>
                    </div>					
					@else
						<b>Packages</b>
						@foreach($assets as $asset)
											<p class="card-text">{{ $asset->package->PackageName}}{{ !$loop->last ? ', ' : '' }}</p>
										@endforeach
					@endif	
									  </li>
								</ul>
							@endforeach
                        </div>
                      </div>
                    </div>
						
				@endforeach
				@endforeach
					  
                      </div>
                      <div class="tab-pane fade" id="navs-top-profile" role="tabpanel">
                        <p>
                          Donut dragée jelly pie halvah. Danish gingerbread bonbon cookie wafer candy oat cake ice
                          cream. Gummies halvah tootsie roll muffin biscuit icing dessert gingerbread. Pastry ice cream
                          cheesecake fruitcake.
                        </p>
                        <p class="mb-0">
                          Jelly-o jelly beans icing pastry cake cake lemon drops. Muffin muffin pie tiramisu halvah
                          cotton candy liquorice caramels.
                        </p>
                      </div>
                      <div class="tab-pane fade" id="navs-top-messages" role="tabpanel">
                        <p>
                          Oat cake chupa chups dragée donut toffee. Sweet cotton candy jelly beans macaroon gummies
                          cupcake gummi bears cake chocolate.
                        </p>
                        <p class="mb-0">
                          Cake chocolate bar cotton candy apple pie tootsie roll ice cream apple pie brownie cake. Sweet
                          roll icing sesame snaps caramels danish toffee. Brownie biscuit dessert dessert. Pudding jelly
                          jelly-o tart brownie jelly.
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
			  </div>
                               </div>
							@endforeach
                            </div>                    
                      </div>
            
			<br>
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
<script type="text/babel">
   const primarydetails=document.getElementById('primary1').children[0].innerText   
   function Hello() {
        return <h1>{primarydetails}</h1>;
      }
      const container = document.getElementById('mydiv');
      const root = ReactDOM.createRoot(container);
      root.render(<Hello/>)
    </script>

@include('includes.footer')