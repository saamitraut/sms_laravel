@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">prp_accounttransaction</h4>

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
>Add prp_accounttransaction </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add prp_accounttransaction</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/prp_accounttransaction/add-prp_accounttransaction-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="AccountId">AccountId:</label>
        <input type="text" class="form-control" id="AccountId" name="AccountId">
    </div>
    <div class="form-group">
        
        <label for="Rate">Rate:</label>
        <input type="text" class="form-control" id="Rate" name="Rate">
    </div>
    <div class="form-group">
        
        <label for="Amount">Amount:</label>
        <input type="text" class="form-control" id="Amount" name="Amount">
    </div>
    <div class="form-group">
        
        <label for="LCOSharing">LCOSharing:</label>
        <input type="text" class="form-control" id="LCOSharing" name="LCOSharing">
    </div>
    <div class="form-group">
        
        <label for="NCFAmount">NCFAmount:</label>
        <input type="text" class="form-control" id="NCFAmount" name="NCFAmount">
    </div>
    <div class="form-group">
        
        <label for="NCF_LCOSharing">NCF_LCOSharing:</label>
        <input type="text" class="form-control" id="NCF_LCOSharing" name="NCF_LCOSharing">
    </div>
    <div class="form-group">
        
        <label for="BouqueId">BouqueId:</label>
        <input type="text" class="form-control" id="BouqueId" name="BouqueId">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="ActivationDate">ActivationDate:</label>
        <input type="text" class="form-control" id="ActivationDate" name="ActivationDate">
    </div>
    <div class="form-group">
        
        <label for="DeactivationDate">DeactivationDate:</label>
        <input type="text" class="form-control" id="DeactivationDate" name="DeactivationDate">
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
        
        <label for="OperatorId">OperatorId:</label>
        <input type="text" class="form-control" id="OperatorId" name="OperatorId">
    </div>
    <div class="form-group">
        
        <label for="SessionFlag">SessionFlag:</label>
        <input type="text" class="form-control" id="SessionFlag" name="SessionFlag">
    </div>
    <div class="form-group">
        
        <label for="CASStatus">CASStatus:</label>
        <input type="text" class="form-control" id="CASStatus" name="CASStatus">
    </div>
    <div class="form-group">
        
        <label for="IsAutoRenew">IsAutoRenew:</label>
        <input type="text" class="form-control" id="IsAutoRenew" name="IsAutoRenew">
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
@if(count($prp_accounttransaction) > 0)	
        <nav aria-label="Page navigation">{{ $prp_accounttransaction->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($prp_accounttransaction as $prp_accounttransaction)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>Id : {{$prp_accounttransaction->Id}}</h5>
            <h5 class='card-title'>AccountId : {{$prp_accounttransaction->AccountId}}</h5>
            <h5 class='card-title'>Rate : {{$prp_accounttransaction->Rate}}</h5>
            <h5 class='card-title'>Amount : {{$prp_accounttransaction->Amount}}</h5>
            <h5 class='card-title'>LCOSharing : {{$prp_accounttransaction->LCOSharing}}</h5>
            <h5 class='card-title'>NCFAmount : {{$prp_accounttransaction->NCFAmount}}</h5>
            <h5 class='card-title'>NCF_LCOSharing : {{$prp_accounttransaction->NCF_LCOSharing}}</h5>
            <h5 class='card-title'>BouqueId : {{$prp_accounttransaction->BouqueId}}</h5>
            <h5 class='card-title'>Status : {{$prp_accounttransaction->Status}}</h5>
            <h5 class='card-title'>ActivationDate : {{$prp_accounttransaction->ActivationDate}}</h5>
            <h5 class='card-title'>DeactivationDate : {{$prp_accounttransaction->DeactivationDate}}</h5>
            <h5 class='card-title'>CreatedOn : {{$prp_accounttransaction->CreatedOn}}</h5>
            <h5 class='card-title'>CreatedBy : {{$prp_accounttransaction->CreatedBy}}</h5>
            <h5 class='card-title'>UpdatedOn : {{$prp_accounttransaction->UpdatedOn}}</h5>
            <h5 class='card-title'>UpdatedBy : {{$prp_accounttransaction->UpdatedBy}}</h5>
            <h5 class='card-title'>Deleted : {{$prp_accounttransaction->Deleted}}</h5>
            <h5 class='card-title'>Remark : {{$prp_accounttransaction->Remark}}</h5>
            <h5 class='card-title'>OperatorId : {{$prp_accounttransaction->OperatorId}}</h5>
            <h5 class='card-title'>SessionFlag : {{$prp_accounttransaction->SessionFlag}}</h5>
            <h5 class='card-title'>CASStatus : {{$prp_accounttransaction->CASStatus}}</h5>
            <h5 class='card-title'>IsAutoRenew : {{$prp_accounttransaction->IsAutoRenew}}</h5><a class='card-link' href='{{ Request::root() }}/prp_accounttransaction/change-status-prp_accounttransaction/{{ $prp_accounttransaction->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($prp_accounttransaction->status == 0)
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
                     href='{{ Request::root() }}/prp_accounttransaction/delete-prp_accounttransaction/{{ $prp_accounttransaction->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit prp_accounttransaction</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/prp_accounttransaction/edit-prp_accounttransaction-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $prp_accounttransaction->id ?>'   name='prp_accounttransaction_id'>

    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" value="{{ $prp_accounttransaction->Id}}" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="AccountId">AccountId:</label>
        <input type="text" value="{{ $prp_accounttransaction->AccountId}}" class="form-control" id="AccountId" name="AccountId">
    </div>
    <div class="form-group">
        
        <label for="Rate">Rate:</label>
        <input type="text" value="{{ $prp_accounttransaction->Rate}}" class="form-control" id="Rate" name="Rate">
    </div>
    <div class="form-group">
        
        <label for="Amount">Amount:</label>
        <input type="text" value="{{ $prp_accounttransaction->Amount}}" class="form-control" id="Amount" name="Amount">
    </div>
    <div class="form-group">
        
        <label for="LCOSharing">LCOSharing:</label>
        <input type="text" value="{{ $prp_accounttransaction->LCOSharing}}" class="form-control" id="LCOSharing" name="LCOSharing">
    </div>
    <div class="form-group">
        
        <label for="NCFAmount">NCFAmount:</label>
        <input type="text" value="{{ $prp_accounttransaction->NCFAmount}}" class="form-control" id="NCFAmount" name="NCFAmount">
    </div>
    <div class="form-group">
        
        <label for="NCF_LCOSharing">NCF_LCOSharing:</label>
        <input type="text" value="{{ $prp_accounttransaction->NCF_LCOSharing}}" class="form-control" id="NCF_LCOSharing" name="NCF_LCOSharing">
    </div>
    <div class="form-group">
        
        <label for="BouqueId">BouqueId:</label>
        <input type="text" value="{{ $prp_accounttransaction->BouqueId}}" class="form-control" id="BouqueId" name="BouqueId">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" value="{{ $prp_accounttransaction->Status}}" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="ActivationDate">ActivationDate:</label>
        <input type="text" value="{{ $prp_accounttransaction->ActivationDate}}" class="form-control" id="ActivationDate" name="ActivationDate">
    </div>
    <div class="form-group">
        
        <label for="DeactivationDate">DeactivationDate:</label>
        <input type="text" value="{{ $prp_accounttransaction->DeactivationDate}}" class="form-control" id="DeactivationDate" name="DeactivationDate">
    </div>
    <div class="form-group">
        
        <label for="CreatedOn">CreatedOn:</label>
        <input type="text" value="{{ $prp_accounttransaction->CreatedOn}}" class="form-control" id="CreatedOn" name="CreatedOn">
    </div>
    <div class="form-group">
        
        <label for="CreatedBy">CreatedBy:</label>
        <input type="text" value="{{ $prp_accounttransaction->CreatedBy}}" class="form-control" id="CreatedBy" name="CreatedBy">
    </div>
    <div class="form-group">
        
        <label for="UpdatedOn">UpdatedOn:</label>
        <input type="text" value="{{ $prp_accounttransaction->UpdatedOn}}" class="form-control" id="UpdatedOn" name="UpdatedOn">
    </div>
    <div class="form-group">
        
        <label for="UpdatedBy">UpdatedBy:</label>
        <input type="text" value="{{ $prp_accounttransaction->UpdatedBy}}" class="form-control" id="UpdatedBy" name="UpdatedBy">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" value="{{ $prp_accounttransaction->Deleted}}" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $prp_accounttransaction->Remark}}" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="OperatorId">OperatorId:</label>
        <input type="text" value="{{ $prp_accounttransaction->OperatorId}}" class="form-control" id="OperatorId" name="OperatorId">
    </div>
    <div class="form-group">
        
        <label for="SessionFlag">SessionFlag:</label>
        <input type="text" value="{{ $prp_accounttransaction->SessionFlag}}" class="form-control" id="SessionFlag" name="SessionFlag">
    </div>
    <div class="form-group">
        
        <label for="CASStatus">CASStatus:</label>
        <input type="text" value="{{ $prp_accounttransaction->CASStatus}}" class="form-control" id="CASStatus" name="CASStatus">
    </div>
    <div class="form-group">
        
        <label for="IsAutoRenew">IsAutoRenew:</label>
        <input type="text" value="{{ $prp_accounttransaction->IsAutoRenew}}" class="form-control" id="IsAutoRenew" name="IsAutoRenew">
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
    <strong>No prp_accounttransactions Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')