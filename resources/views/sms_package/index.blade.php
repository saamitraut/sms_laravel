@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">sms_package</h4>

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
>Add sms_package </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add sms_package</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/sms_package/add-sms_package-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group col-md-4">
        
        <label for="Id">Id:</label>
        <input type="text" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group col-md-4">
        
        <label for="PackageName">PackageName:</label>
        <input type="text" class="form-control" id="PackageName" name="PackageName">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CasCode">CasCode:</label>
        <input type="text" class="form-control" id="CasCode" name="CasCode">
    </div>
    <div class="form-group col-md-4">
        
        <label for="Price">Price:</label>
        <input type="text" class="form-control" id="Price" name="Price">
    </div>
    <div class="form-group col-md-4">
        
        <label for="Price2">Price2:</label>
        <input type="text" class="form-control" id="Price2" name="Price2">
    </div>
    <div class="form-group col-md-4">
        
        <label for="BillingCycle">BillingCycle:</label>
        <input type="text" class="form-control" id="BillingCycle" name="BillingCycle">
    </div>
    <div class="form-group col-md-4">
        
        <label for="StartDate">StartDate:</label>
        <input type="text" class="form-control" id="StartDate" name="StartDate">
    </div>
    <div class="form-group col-md-4">
        
        <label for="EndDate">EndDate:</label>
        <input type="text" class="form-control" id="EndDate" name="EndDate">
    </div>
    <div class="form-group col-md-4">
        
        <label for="Status">Status:</label>
        <input type="text" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group col-md-4">
        
        <label for="Description">Description:</label>
        <input type="text" class="form-control" id="Description" name="Description">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CreatedOn">CreatedOn:</label>
        <input type="text" class="form-control" id="CreatedOn" name="CreatedOn">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CreatedBy">CreatedBy:</label>
        <input type="text" class="form-control" id="CreatedBy" name="CreatedBy">
    </div>
    <div class="form-group col-md-4">
        
        <label for="UpdatedOn">UpdatedOn:</label>
        <input type="text" class="form-control" id="UpdatedOn" name="UpdatedOn">
    </div>
    <div class="form-group col-md-4">
        
        <label for="UpdatedBy">UpdatedBy:</label>
        <input type="text" class="form-control" id="UpdatedBy" name="UpdatedBy">
    </div>
    <div class="form-group col-md-4">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group col-md-4">
        
        <label for="Remark">Remark:</label>
        <input type="text" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group col-md-4">
        
        <label for="PackageType">PackageType:</label>
        <input type="text" class="form-control" id="PackageType" name="PackageType">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CasCodeGospel">CasCodeGospel:</label>
        <input type="text" class="form-control" id="CasCodeGospel" name="CasCodeGospel">
    </div>
    <div class="form-group col-md-4">
        
        <label for="IsPrepaid">IsPrepaid:</label>
        <input type="text" class="form-control" id="IsPrepaid" name="IsPrepaid">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CasCodeTelelynx">CasCodeTelelynx:</label>
        <input type="text" class="form-control" id="CasCodeTelelynx" name="CasCodeTelelynx">
    </div>
    <div class="form-group col-md-4">
        
        <label for="BranchId">BranchId:</label>
        <input type="text" class="form-control" id="BranchId" name="BranchId">
    </div>
    <div class="form-group col-md-4">
        
        <label for="DASType">DASType:</label>
        <input type="text" class="form-control" id="DASType" name="DASType">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CasCodeNSTV">CasCodeNSTV:</label>
        <input type="text" class="form-control" id="CasCodeNSTV" name="CasCodeNSTV">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CasCodeKingvon">CasCodeKingvon:</label>
        <input type="text" class="form-control" id="CasCodeKingvon" name="CasCodeKingvon">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CasCodeCatVision">CasCodeCatVision:</label>
        <input type="text" class="form-control" id="CasCodeCatVision" name="CasCodeCatVision">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CasCodeBCas">CasCodeBCas:</label>
        <input type="text" class="form-control" id="CasCodeBCas" name="CasCodeBCas">
    </div>
	<div class="mb-3">
                        <label for="broadcaster_id" class="form-label">Broadcaster</label>
                        <select id="broadcaster_id" class="form-select">
                          <option value="0">Select Broadcaster</option>
                          @foreach($broadcasters as $broadcaster)
						  <option value="{{$broadcaster->ID}}">{{$broadcaster->BROADCASTERNAME}}</option>
                          @endforeach
                        </select>
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
@if(count($sms_package) > 0)	
        <nav aria-label="Page navigation">{{ $sms_package->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($sms_package as $sms_package)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>Id : {{$sms_package->Id}}</h5>
            <h5 class='card-title'>PackageName : {{$sms_package->PackageName}}</h5>
            <h5 class='card-title'>Broadcaster : {{$sms_package->broadcaster?$sms_package->broadcaster->BROADCASTERNAME:''}}</h5>
            <h5 class='card-title'>CasCode : {{$sms_package->CasCode}}</h5>
            <h5 class='card-title'>Price : {{$sms_package->Price}}</h5>
            <h5 class='card-title'>Price2 : {{$sms_package->Price2}}</h5>
            <h5 class='card-title'>BillingCycle : {{$sms_package->BillingCycle}}</h5>
            <h5 class='card-title'>StartDate : {{$sms_package->StartDate}}</h5>
            <h5 class='card-title'>EndDate : {{$sms_package->EndDate}}</h5>
            <h5 class='card-title'>Status : {{$sms_package->Status}}</h5>
            <h5 class='card-title'>Description : {{$sms_package->Description}}</h5>
            <h5 class='card-title'>CreatedOn : {{$sms_package->CreatedOn}}</h5>
            <h5 class='card-title'>CreatedBy : {{$sms_package->CreatedBy}}</h5>
            <h5 class='card-title'>UpdatedOn : {{$sms_package->UpdatedOn}}</h5>
            <h5 class='card-title'>UpdatedBy : {{$sms_package->UpdatedBy}}</h5>
            <h5 class='card-title'>Deleted : {{$sms_package->Deleted}}</h5>
            <h5 class='card-title'>Remark : {{$sms_package->Remark}}</h5>
            <h5 class='card-title'>PackageType : {{$sms_package->PackageType}}</h5>
            <h5 class='card-title'>CasCodeGospel : {{$sms_package->CasCodeGospel}}</h5>
            <h5 class='card-title'>IsPrepaid : {{$sms_package->IsPrepaid}}</h5>
            <h5 class='card-title'>CasCodeTelelynx : {{$sms_package->CasCodeTelelynx}}</h5>
            <h5 class='card-title'>BranchId : {{$sms_package->BranchId}}</h5>
            <h5 class='card-title'>DASType : {{$sms_package->DASType}}</h5>
            <h5 class='card-title'>CasCodeNSTV : {{$sms_package->CasCodeNSTV}}</h5>
            <h5 class='card-title'>CasCodeKingvon : {{$sms_package->CasCodeKingvon}}</h5>
            <h5 class='card-title'>CasCodeCatVision : {{$sms_package->CasCodeCatVision}}</h5>
            <h5 class='card-title'>CasCodeBCas : {{$sms_package->CasCodeBCas}}</h5><a class='card-link' href='{{ Request::root() }}/sms_package/change-status-sms_package/{{ $sms_package->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($sms_package->status == 0)
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
                     href='{{ Request::root() }}/sms_package/delete-sms_package/{{ $sms_package->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit sms_package</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/sms_package/edit-sms_package-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $sms_package->Id ?>'   name='sms_package_id'>
	<div class="row"><div class="form-group col-md-4">
        
        <label for="PackageName">PackageName:</label>
        <input type="text" value="{{ $sms_package->PackageName}}" class="form-control" id="PackageName" name="PackageName">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CasCode">CasCode:</label>
        <input type="text" value="{{ $sms_package->CasCode}}" class="form-control" id="CasCode" name="CasCode">
    </div>
    <div class="form-group col-md-4">
        
        <label for="Price">Price:</label>
        <input type="text" value="{{ $sms_package->Price}}" class="form-control" id="Price" name="Price">
    </div>
    <div class="form-group col-md-4">
        
        <label for="Price2">Price2:</label>
        <input type="text" value="{{ $sms_package->Price2}}" class="form-control" id="Price2" name="Price2">
    </div>
    <div class="form-group col-md-4">
        
        <label for="BillingCycle">BillingCycle:</label>
        <input type="text" value="{{ $sms_package->BillingCycle}}" class="form-control" id="BillingCycle" name="BillingCycle">
    </div>
    <div class="form-group col-md-4">
        
        <label for="StartDate">StartDate:</label>
        <input type="text" value="{{ $sms_package->StartDate}}" class="form-control" id="StartDate" name="StartDate">
    </div>
    <div class="form-group col-md-4">
        
        <label for="EndDate">EndDate:</label>
        <input type="text" value="{{ $sms_package->EndDate}}" class="form-control" id="EndDate" name="EndDate">
    </div>
    <div class="form-group col-md-4">
        
        <label for="Status">Status:</label>
        <input type="text" value="{{ $sms_package->Status}}" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group col-md-4">
        
        <label for="Description">Description:</label>
        <input type="text" value="{{ $sms_package->Description}}" class="form-control" id="Description" name="Description">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CreatedOn">CreatedOn:</label>
        <input type="text" value="{{ $sms_package->CreatedOn}}" class="form-control" id="CreatedOn" name="CreatedOn">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CreatedBy">CreatedBy:</label>
        <input type="text" value="{{ $sms_package->CreatedBy}}" class="form-control" id="CreatedBy" name="CreatedBy">
    </div>
    <div class="form-group col-md-4">
        
        <label for="UpdatedOn">UpdatedOn:</label>
        <input type="text" value="{{ $sms_package->UpdatedOn}}" class="form-control" id="UpdatedOn" name="UpdatedOn">
    </div>
    <div class="form-group col-md-4">
        
        <label for="UpdatedBy">UpdatedBy:</label>
        <input type="text" value="{{ $sms_package->UpdatedBy}}" class="form-control" id="UpdatedBy" name="UpdatedBy">
    </div>
    <div class="form-group col-md-4">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" value="{{ $sms_package->Deleted}}" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group col-md-4">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $sms_package->Remark}}" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group col-md-4">
        
        <label for="PackageType">PackageType:</label>
        <input type="text" value="{{ $sms_package->PackageType}}" class="form-control" id="PackageType" name="PackageType">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CasCodeGospel">CasCodeGospel:</label>
        <input type="text" value="{{ $sms_package->CasCodeGospel}}" class="form-control" id="CasCodeGospel" name="CasCodeGospel">
    </div>
    <div class="form-group col-md-4">
        
        <label for="IsPrepaid">IsPrepaid:</label>
        <input type="text" value="{{ $sms_package->IsPrepaid}}" class="form-control" id="IsPrepaid" name="IsPrepaid">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CasCodeTelelynx">CasCodeTelelynx:</label>
        <input type="text" value="{{ $sms_package->CasCodeTelelynx}}" class="form-control" id="CasCodeTelelynx" name="CasCodeTelelynx">
    </div>
    <div class="form-group col-md-4">
        
        <label for="BranchId">BranchId:</label>
        <input type="text" value="{{ $sms_package->BranchId}}" class="form-control" id="BranchId" name="BranchId">
    </div>
    <div class="form-group col-md-4">
        
        <label for="DASType">DASType:</label>
        <input type="text" value="{{ $sms_package->DASType}}" class="form-control" id="DASType" name="DASType">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CasCodeNSTV">CasCodeNSTV:</label>
        <input type="text" value="{{ $sms_package->CasCodeNSTV}}" class="form-control" id="CasCodeNSTV" name="CasCodeNSTV">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CasCodeKingvon">CasCodeKingvon:</label>
        <input type="text" value="{{ $sms_package->CasCodeKingvon}}" class="form-control" id="CasCodeKingvon" name="CasCodeKingvon">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CasCodeCatVision">CasCodeCatVision:</label>
        <input type="text" value="{{ $sms_package->CasCodeCatVision}}" class="form-control" id="CasCodeCatVision" name="CasCodeCatVision">
    </div>
    <div class="form-group col-md-4">
        
        <label for="CasCodeBCas">CasCodeBCas:</label>
        <input type="text" value="{{ $sms_package->CasCodeBCas}}" class="form-control" id="CasCodeBCas" name="CasCodeBCas">
    </div>
	<div class="form-group col-md-4"><div class="mb-3">
                        <label for="broadcaster_id" class="form-label">Broadcaster</label>
                        <select id="broadcaster_id" name="broadcaster_id"  class="form-select">
                          <option value="0">Select Broadcaster</option>
                          @foreach($broadcasters as $broadcaster)
						  <option value="{{$broadcaster->ID}}"
							  {{$sms_package->broadcaster_id==$broadcaster->ID ?'selected':''}}
						  >{{$broadcaster->BROADCASTERNAME}}</option>
                          @endforeach
                        </select>
                      </div>
    </div></div>
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
    <strong>No sms_packages Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')