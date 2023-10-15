@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">sms_channel</h4>

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
>Add sms_channel </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add sms_channel</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/sms_channel/add-sms_channel-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="ChannelName">ChannelName:</label>
        <input type="text" class="form-control" id="ChannelName" name="ChannelName">
    </div>
    <div class="form-group">
        
        <label for="CasCodeGospel">CasCodeGospel:</label>
        <input type="text" class="form-control" id="CasCodeGospel" name="CasCodeGospel">
    </div>
    <div class="form-group">
        
        <label for="CasCode">CasCode:</label>
        <input type="text" class="form-control" id="CasCode" name="CasCode">
    </div>
    <div class="form-group">
        
        <label for="LogoExt">LogoExt:</label>
        <input type="text" class="form-control" id="LogoExt" name="LogoExt">
    </div>
    <div class="form-group">
        
        <label for="Price">Price:</label>
        <input type="text" class="form-control" id="Price" name="Price">
    </div>
    <div class="form-group">
        
        <label for="Price2">Price2:</label>
        <input type="text" class="form-control" id="Price2" name="Price2">
    </div>
    <div class="form-group">
        
        <label for="BillingCycle">BillingCycle:</label>
        <input type="text" class="form-control" id="BillingCycle" name="BillingCycle">
    </div>
    <div class="form-group">
        
        <label for="BroadcasterId">BroadcasterId:</label>
        <input type="text" class="form-control" id="BroadcasterId" name="BroadcasterId">
    </div>
    <div class="form-group">
        
        <label for="BRate">BRate:</label>
        <input type="text" class="form-control" id="BRate" name="BRate">
    </div>
    <div class="form-group">
        
        <label for="CategoryId">CategoryId:</label>
        <input type="text" class="form-control" id="CategoryId" name="CategoryId">
    </div>
    <div class="form-group">
        
        <label for="ChannelType">ChannelType:</label>
        <input type="text" class="form-control" id="ChannelType" name="ChannelType">
    </div>
    <div class="form-group">
        
        <label for="IsAlacarte">IsAlacarte:</label>
        <input type="text" class="form-control" id="IsAlacarte" name="IsAlacarte">
    </div>
    <div class="form-group">
        
        <label for="Description">Description:</label>
        <input type="text" class="form-control" id="Description" name="Description">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" class="form-control" id="Status" name="Status">
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
    <div class="form-group">
        
        <label for="TSIDGospel">TSIDGospel:</label>
        <input type="text" class="form-control" id="TSIDGospel" name="TSIDGospel">
    </div>
    <div class="form-group">
        
        <label for="TSID">TSID:</label>
        <input type="text" class="form-control" id="TSID" name="TSID">
    </div>
    <div class="form-group">
        
        <label for="CasCodeTelelynx">CasCodeTelelynx:</label>
        <input type="text" class="form-control" id="CasCodeTelelynx" name="CasCodeTelelynx">
    </div>
    <div class="form-group">
        
        <label for="PcrId">PcrId:</label>
        <input type="text" class="form-control" id="PcrId" name="PcrId">
    </div>
    <div class="form-group">
        
        <label for="ComponentPidAudio">ComponentPidAudio:</label>
        <input type="text" class="form-control" id="ComponentPidAudio" name="ComponentPidAudio">
    </div>
    <div class="form-group">
        
        <label for="ComponentPidVideo">ComponentPidVideo:</label>
        <input type="text" class="form-control" id="ComponentPidVideo" name="ComponentPidVideo">
    </div>
    <div class="form-group">
        
        <label for="SymbolRate">SymbolRate:</label>
        <input type="text" class="form-control" id="SymbolRate" name="SymbolRate">
    </div>
    <div class="form-group">
        
        <label for="EcmPidAudio">EcmPidAudio:</label>
        <input type="text" class="form-control" id="EcmPidAudio" name="EcmPidAudio">
    </div>
    <div class="form-group">
        
        <label for="EcmPidVideo">EcmPidVideo:</label>
        <input type="text" class="form-control" id="EcmPidVideo" name="EcmPidVideo">
    </div>
    <div class="form-group">
        
        <label for="QAM">QAM:</label>
        <input type="text" class="form-control" id="QAM" name="QAM">
    </div>
    <div class="form-group">
        
        <label for="Serviceid">Serviceid:</label>
        <input type="text" class="form-control" id="Serviceid" name="Serviceid">
    </div>
    <div class="form-group">
        
        <label for="Frequency">Frequency:</label>
        <input type="text" class="form-control" id="Frequency" name="Frequency">
    </div>
    <div class="form-group">
        
        <label for="CasCodeNSTV">CasCodeNSTV:</label>
        <input type="text" class="form-control" id="CasCodeNSTV" name="CasCodeNSTV">
    </div>
    <div class="form-group">
        
        <label for="CasCodeKingvon">CasCodeKingvon:</label>
        <input type="text" class="form-control" id="CasCodeKingvon" name="CasCodeKingvon">
    </div>
    <div class="form-group">
        
        <label for="CasCodeCatVision">CasCodeCatVision:</label>
        <input type="text" class="form-control" id="CasCodeCatVision" name="CasCodeCatVision">
    </div>
    <div class="form-group">
        
        <label for="CasCodeBCas">CasCodeBCas:</label>
        <input type="text" class="form-control" id="CasCodeBCas" name="CasCodeBCas">
    </div>
    <div class="form-group">
        
        <label for="LCNNO">LCNNO:</label>
        <input type="text" class="form-control" id="LCNNO" name="LCNNO">
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
@if(count($sms_channel) > 0)	
        <nav aria-label="Page navigation">{{ $sms_channel->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($sms_channel as $sms_channel)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>Id : {{$sms_channel->Id}}</h5>
            <h5 class='card-title'>ChannelName : {{$sms_channel->ChannelName}}</h5>
            <h5 class='card-title'>CasCodeGospel : {{$sms_channel->CasCodeGospel}}</h5>
            <h5 class='card-title'>CasCode : {{$sms_channel->CasCode}}</h5>
            <h5 class='card-title'>LogoExt : {{$sms_channel->LogoExt}}</h5>
            <h5 class='card-title'>Price : {{$sms_channel->Price}}</h5>
            <h5 class='card-title'>Price2 : {{$sms_channel->Price2}}</h5>
            <h5 class='card-title'>BillingCycle : {{$sms_channel->BillingCycle}}</h5>
            <h5 class='card-title'>BroadcasterId : {{$sms_channel->BroadcasterId}}</h5>
            <h5 class='card-title'>BRate : {{$sms_channel->BRate}}</h5>
            <h5 class='card-title'>CategoryId : {{$sms_channel->CategoryId}}</h5>
            <h5 class='card-title'>ChannelType : {{$sms_channel->ChannelType}}</h5>
            <h5 class='card-title'>IsAlacarte : {{$sms_channel->IsAlacarte}}</h5>
            <h5 class='card-title'>Description : {{$sms_channel->Description}}</h5>
            <h5 class='card-title'>Status : {{$sms_channel->Status}}</h5>
            <h5 class='card-title'>CreatedOn : {{$sms_channel->CreatedOn}}</h5>
            <h5 class='card-title'>CreatedBy : {{$sms_channel->CreatedBy}}</h5>
            <h5 class='card-title'>UpdatedOn : {{$sms_channel->UpdatedOn}}</h5>
            <h5 class='card-title'>UpdatedBy : {{$sms_channel->UpdatedBy}}</h5>
            <h5 class='card-title'>Deleted : {{$sms_channel->Deleted}}</h5>
            <h5 class='card-title'>Remark : {{$sms_channel->Remark}}</h5>
            <h5 class='card-title'>sms_id : {{$sms_channel->sms_id}}</h5>
            <h5 class='card-title'>TSIDGospel : {{$sms_channel->TSIDGospel}}</h5>
            <h5 class='card-title'>TSID : {{$sms_channel->TSID}}</h5>
            <h5 class='card-title'>CasCodeTelelynx : {{$sms_channel->CasCodeTelelynx}}</h5>
            <h5 class='card-title'>PcrId : {{$sms_channel->PcrId}}</h5>
            <h5 class='card-title'>ComponentPidAudio : {{$sms_channel->ComponentPidAudio}}</h5>
            <h5 class='card-title'>ComponentPidVideo : {{$sms_channel->ComponentPidVideo}}</h5>
            <h5 class='card-title'>SymbolRate : {{$sms_channel->SymbolRate}}</h5>
            <h5 class='card-title'>EcmPidAudio : {{$sms_channel->EcmPidAudio}}</h5>
            <h5 class='card-title'>EcmPidVideo : {{$sms_channel->EcmPidVideo}}</h5>
            <h5 class='card-title'>QAM : {{$sms_channel->QAM}}</h5>
            <h5 class='card-title'>Serviceid : {{$sms_channel->Serviceid}}</h5>
            <h5 class='card-title'>Frequency : {{$sms_channel->Frequency}}</h5>
            <h5 class='card-title'>CasCodeNSTV : {{$sms_channel->CasCodeNSTV}}</h5>
            <h5 class='card-title'>CasCodeKingvon : {{$sms_channel->CasCodeKingvon}}</h5>
            <h5 class='card-title'>CasCodeCatVision : {{$sms_channel->CasCodeCatVision}}</h5>
            <h5 class='card-title'>CasCodeBCas : {{$sms_channel->CasCodeBCas}}</h5>
            <h5 class='card-title'>LCNNO : {{$sms_channel->LCNNO}}</h5><a class='card-link' href='{{ Request::root() }}/sms_channel/change-status-sms_channel/{{ $sms_channel->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($sms_channel->status == 0)
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
                     href='{{ Request::root() }}/sms_channel/delete-sms_channel/{{ $sms_channel->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit sms_channel</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/sms_channel/edit-sms_channel-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $sms_channel->id ?>'   name='sms_channel_id'>

    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" value="{{ $sms_channel->Id}}" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="ChannelName">ChannelName:</label>
        <input type="text" value="{{ $sms_channel->ChannelName}}" class="form-control" id="ChannelName" name="ChannelName">
    </div>
    <div class="form-group">
        
        <label for="CasCodeGospel">CasCodeGospel:</label>
        <input type="text" value="{{ $sms_channel->CasCodeGospel}}" class="form-control" id="CasCodeGospel" name="CasCodeGospel">
    </div>
    <div class="form-group">
        
        <label for="CasCode">CasCode:</label>
        <input type="text" value="{{ $sms_channel->CasCode}}" class="form-control" id="CasCode" name="CasCode">
    </div>
    <div class="form-group">
        
        <label for="LogoExt">LogoExt:</label>
        <input type="text" value="{{ $sms_channel->LogoExt}}" class="form-control" id="LogoExt" name="LogoExt">
    </div>
    <div class="form-group">
        
        <label for="Price">Price:</label>
        <input type="text" value="{{ $sms_channel->Price}}" class="form-control" id="Price" name="Price">
    </div>
    <div class="form-group">
        
        <label for="Price2">Price2:</label>
        <input type="text" value="{{ $sms_channel->Price2}}" class="form-control" id="Price2" name="Price2">
    </div>
    <div class="form-group">
        
        <label for="BillingCycle">BillingCycle:</label>
        <input type="text" value="{{ $sms_channel->BillingCycle}}" class="form-control" id="BillingCycle" name="BillingCycle">
    </div>
    <div class="form-group">
        
        <label for="BroadcasterId">BroadcasterId:</label>
        <input type="text" value="{{ $sms_channel->BroadcasterId}}" class="form-control" id="BroadcasterId" name="BroadcasterId">
    </div>
    <div class="form-group">
        
        <label for="BRate">BRate:</label>
        <input type="text" value="{{ $sms_channel->BRate}}" class="form-control" id="BRate" name="BRate">
    </div>
    <div class="form-group">
        
        <label for="CategoryId">CategoryId:</label>
        <input type="text" value="{{ $sms_channel->CategoryId}}" class="form-control" id="CategoryId" name="CategoryId">
    </div>
    <div class="form-group">
        
        <label for="ChannelType">ChannelType:</label>
        <input type="text" value="{{ $sms_channel->ChannelType}}" class="form-control" id="ChannelType" name="ChannelType">
    </div>
    <div class="form-group">
        
        <label for="IsAlacarte">IsAlacarte:</label>
        <input type="text" value="{{ $sms_channel->IsAlacarte}}" class="form-control" id="IsAlacarte" name="IsAlacarte">
    </div>
    <div class="form-group">
        
        <label for="Description">Description:</label>
        <input type="text" value="{{ $sms_channel->Description}}" class="form-control" id="Description" name="Description">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" value="{{ $sms_channel->Status}}" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="CreatedOn">CreatedOn:</label>
        <input type="text" value="{{ $sms_channel->CreatedOn}}" class="form-control" id="CreatedOn" name="CreatedOn">
    </div>
    <div class="form-group">
        
        <label for="CreatedBy">CreatedBy:</label>
        <input type="text" value="{{ $sms_channel->CreatedBy}}" class="form-control" id="CreatedBy" name="CreatedBy">
    </div>
    <div class="form-group">
        
        <label for="UpdatedOn">UpdatedOn:</label>
        <input type="text" value="{{ $sms_channel->UpdatedOn}}" class="form-control" id="UpdatedOn" name="UpdatedOn">
    </div>
    <div class="form-group">
        
        <label for="UpdatedBy">UpdatedBy:</label>
        <input type="text" value="{{ $sms_channel->UpdatedBy}}" class="form-control" id="UpdatedBy" name="UpdatedBy">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" value="{{ $sms_channel->Deleted}}" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $sms_channel->Remark}}" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="sms_id">sms_id:</label>
        <input type="text" value="{{ $sms_channel->sms_id}}" class="form-control" id="sms_id" name="sms_id">
    </div>
    <div class="form-group">
        
        <label for="TSIDGospel">TSIDGospel:</label>
        <input type="text" value="{{ $sms_channel->TSIDGospel}}" class="form-control" id="TSIDGospel" name="TSIDGospel">
    </div>
    <div class="form-group">
        
        <label for="TSID">TSID:</label>
        <input type="text" value="{{ $sms_channel->TSID}}" class="form-control" id="TSID" name="TSID">
    </div>
    <div class="form-group">
        
        <label for="CasCodeTelelynx">CasCodeTelelynx:</label>
        <input type="text" value="{{ $sms_channel->CasCodeTelelynx}}" class="form-control" id="CasCodeTelelynx" name="CasCodeTelelynx">
    </div>
    <div class="form-group">
        
        <label for="PcrId">PcrId:</label>
        <input type="text" value="{{ $sms_channel->PcrId}}" class="form-control" id="PcrId" name="PcrId">
    </div>
    <div class="form-group">
        
        <label for="ComponentPidAudio">ComponentPidAudio:</label>
        <input type="text" value="{{ $sms_channel->ComponentPidAudio}}" class="form-control" id="ComponentPidAudio" name="ComponentPidAudio">
    </div>
    <div class="form-group">
        
        <label for="ComponentPidVideo">ComponentPidVideo:</label>
        <input type="text" value="{{ $sms_channel->ComponentPidVideo}}" class="form-control" id="ComponentPidVideo" name="ComponentPidVideo">
    </div>
    <div class="form-group">
        
        <label for="SymbolRate">SymbolRate:</label>
        <input type="text" value="{{ $sms_channel->SymbolRate}}" class="form-control" id="SymbolRate" name="SymbolRate">
    </div>
    <div class="form-group">
        
        <label for="EcmPidAudio">EcmPidAudio:</label>
        <input type="text" value="{{ $sms_channel->EcmPidAudio}}" class="form-control" id="EcmPidAudio" name="EcmPidAudio">
    </div>
    <div class="form-group">
        
        <label for="EcmPidVideo">EcmPidVideo:</label>
        <input type="text" value="{{ $sms_channel->EcmPidVideo}}" class="form-control" id="EcmPidVideo" name="EcmPidVideo">
    </div>
    <div class="form-group">
        
        <label for="QAM">QAM:</label>
        <input type="text" value="{{ $sms_channel->QAM}}" class="form-control" id="QAM" name="QAM">
    </div>
    <div class="form-group">
        
        <label for="Serviceid">Serviceid:</label>
        <input type="text" value="{{ $sms_channel->Serviceid}}" class="form-control" id="Serviceid" name="Serviceid">
    </div>
    <div class="form-group">
        
        <label for="Frequency">Frequency:</label>
        <input type="text" value="{{ $sms_channel->Frequency}}" class="form-control" id="Frequency" name="Frequency">
    </div>
    <div class="form-group">
        
        <label for="CasCodeNSTV">CasCodeNSTV:</label>
        <input type="text" value="{{ $sms_channel->CasCodeNSTV}}" class="form-control" id="CasCodeNSTV" name="CasCodeNSTV">
    </div>
    <div class="form-group">
        
        <label for="CasCodeKingvon">CasCodeKingvon:</label>
        <input type="text" value="{{ $sms_channel->CasCodeKingvon}}" class="form-control" id="CasCodeKingvon" name="CasCodeKingvon">
    </div>
    <div class="form-group">
        
        <label for="CasCodeCatVision">CasCodeCatVision:</label>
        <input type="text" value="{{ $sms_channel->CasCodeCatVision}}" class="form-control" id="CasCodeCatVision" name="CasCodeCatVision">
    </div>
    <div class="form-group">
        
        <label for="CasCodeBCas">CasCodeBCas:</label>
        <input type="text" value="{{ $sms_channel->CasCodeBCas}}" class="form-control" id="CasCodeBCas" name="CasCodeBCas">
    </div>
    <div class="form-group">
        
        <label for="LCNNO">LCNNO:</label>
        <input type="text" value="{{ $sms_channel->LCNNO}}" class="form-control" id="LCNNO" name="LCNNO">
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
    <strong>No sms_channels Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')