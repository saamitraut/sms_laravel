@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">sms_stbscbrand</h4>

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
>Add sms_stbscbrand </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add sms_stbscbrand</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/sms_stbscbrand/add-sms_stbscbrand-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="BrandTitle">BrandTitle:</label>
        <input type="text" class="form-control" id="BrandTitle" name="BrandTitle">
    </div>
    <div class="form-group">
        
        <label for="Price">Price:</label>
        <input type="text" class="form-control" id="Price" name="Price">
    </div>
    <div class="form-group">
        
        <label for="BoxType">BoxType:</label>
        <input type="text" class="form-control" id="BoxType" name="BoxType">
    </div>
    <div class="form-group">
        
        <label for="TimeShift">TimeShift:</label>
        <input type="text" class="form-control" id="TimeShift" name="TimeShift">
    </div>
    <div class="form-group">
        
        <label for="Maxlength">Maxlength:</label>
        <input type="text" class="form-control" id="Maxlength" name="Maxlength">
    </div>
    <div class="form-group">
        
        <label for="SignificantDigits">SignificantDigits:</label>
        <input type="text" class="form-control" id="SignificantDigits" name="SignificantDigits">
    </div>
    <div class="form-group">
        
        <label for="CharAllowed">CharAllowed:</label>
        <input type="text" class="form-control" id="CharAllowed" name="CharAllowed">
    </div>
    <div class="form-group">
        
        <label for="FORSMARTCARD">FORSMARTCARD:</label>
        <input type="text" class="form-control" id="FORSMARTCARD" name="FORSMARTCARD">
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
        
        <label for="CASTYPEID">CASTYPEID:</label>
        <input type="text" class="form-control" id="CASTYPEID" name="CASTYPEID">
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
@if(count($sms_stbscbrand) > 0)	
        <nav aria-label="Page navigation">{{ $sms_stbscbrand->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($sms_stbscbrand as $sms_stbscbrand)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>Id : {{$sms_stbscbrand->Id}}</h5>
            <h5 class='card-title'>BrandTitle : {{$sms_stbscbrand->BrandTitle}}</h5>
            <h5 class='card-title'>Price : {{$sms_stbscbrand->Price}}</h5>
            <h5 class='card-title'>BoxType : {{$sms_stbscbrand->BoxType}}</h5>
            <h5 class='card-title'>TimeShift : {{$sms_stbscbrand->TimeShift}}</h5>
            <h5 class='card-title'>Maxlength : {{$sms_stbscbrand->Maxlength}}</h5>
            <h5 class='card-title'>SignificantDigits : {{$sms_stbscbrand->SignificantDigits}}</h5>
            <h5 class='card-title'>CharAllowed : {{$sms_stbscbrand->CharAllowed}}</h5>
            <h5 class='card-title'>FORSMARTCARD : {{$sms_stbscbrand->FORSMARTCARD}}</h5>
            <h5 class='card-title'>Status : {{$sms_stbscbrand->Status}}</h5>
            <h5 class='card-title'>CreatedOn : {{$sms_stbscbrand->CreatedOn}}</h5>
            <h5 class='card-title'>CreatedBy : {{$sms_stbscbrand->CreatedBy}}</h5>
            <h5 class='card-title'>UpdatedOn : {{$sms_stbscbrand->UpdatedOn}}</h5>
            <h5 class='card-title'>UpdatedBy : {{$sms_stbscbrand->UpdatedBy}}</h5>
            <h5 class='card-title'>Deleted : {{$sms_stbscbrand->Deleted}}</h5>
            <h5 class='card-title'>Remark : {{$sms_stbscbrand->Remark}}</h5>
            <h5 class='card-title'>sms_id : {{$sms_stbscbrand->sms_id}}</h5>
            <h5 class='card-title'>CASTYPEID : {{$sms_stbscbrand->CASTYPEID}}</h5><a class='card-link' href='{{ Request::root() }}/sms_stbscbrand/change-status-sms_stbscbrand/{{ $sms_stbscbrand->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($sms_stbscbrand->status == 0)
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
                     href='{{ Request::root() }}/sms_stbscbrand/delete-sms_stbscbrand/{{ $sms_stbscbrand->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit sms_stbscbrand</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/sms_stbscbrand/edit-sms_stbscbrand-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $sms_stbscbrand->id ?>'   name='sms_stbscbrand_id'>

    <div class="form-group">
        
        <label for="Id">Id:</label>
        <input type="text" value="{{ $sms_stbscbrand->Id}}" class="form-control" id="Id" name="Id">
    </div>
    <div class="form-group">
        
        <label for="BrandTitle">BrandTitle:</label>
        <input type="text" value="{{ $sms_stbscbrand->BrandTitle}}" class="form-control" id="BrandTitle" name="BrandTitle">
    </div>
    <div class="form-group">
        
        <label for="Price">Price:</label>
        <input type="text" value="{{ $sms_stbscbrand->Price}}" class="form-control" id="Price" name="Price">
    </div>
    <div class="form-group">
        
        <label for="BoxType">BoxType:</label>
        <input type="text" value="{{ $sms_stbscbrand->BoxType}}" class="form-control" id="BoxType" name="BoxType">
    </div>
    <div class="form-group">
        
        <label for="TimeShift">TimeShift:</label>
        <input type="text" value="{{ $sms_stbscbrand->TimeShift}}" class="form-control" id="TimeShift" name="TimeShift">
    </div>
    <div class="form-group">
        
        <label for="Maxlength">Maxlength:</label>
        <input type="text" value="{{ $sms_stbscbrand->Maxlength}}" class="form-control" id="Maxlength" name="Maxlength">
    </div>
    <div class="form-group">
        
        <label for="SignificantDigits">SignificantDigits:</label>
        <input type="text" value="{{ $sms_stbscbrand->SignificantDigits}}" class="form-control" id="SignificantDigits" name="SignificantDigits">
    </div>
    <div class="form-group">
        
        <label for="CharAllowed">CharAllowed:</label>
        <input type="text" value="{{ $sms_stbscbrand->CharAllowed}}" class="form-control" id="CharAllowed" name="CharAllowed">
    </div>
    <div class="form-group">
        
        <label for="FORSMARTCARD">FORSMARTCARD:</label>
        <input type="text" value="{{ $sms_stbscbrand->FORSMARTCARD}}" class="form-control" id="FORSMARTCARD" name="FORSMARTCARD">
    </div>
    <div class="form-group">
        
        <label for="Status">Status:</label>
        <input type="text" value="{{ $sms_stbscbrand->Status}}" class="form-control" id="Status" name="Status">
    </div>
    <div class="form-group">
        
        <label for="CreatedOn">CreatedOn:</label>
        <input type="text" value="{{ $sms_stbscbrand->CreatedOn}}" class="form-control" id="CreatedOn" name="CreatedOn">
    </div>
    <div class="form-group">
        
        <label for="CreatedBy">CreatedBy:</label>
        <input type="text" value="{{ $sms_stbscbrand->CreatedBy}}" class="form-control" id="CreatedBy" name="CreatedBy">
    </div>
    <div class="form-group">
        
        <label for="UpdatedOn">UpdatedOn:</label>
        <input type="text" value="{{ $sms_stbscbrand->UpdatedOn}}" class="form-control" id="UpdatedOn" name="UpdatedOn">
    </div>
    <div class="form-group">
        
        <label for="UpdatedBy">UpdatedBy:</label>
        <input type="text" value="{{ $sms_stbscbrand->UpdatedBy}}" class="form-control" id="UpdatedBy" name="UpdatedBy">
    </div>
    <div class="form-group">
        
        <label for="Deleted">Deleted:</label>
        <input type="text" value="{{ $sms_stbscbrand->Deleted}}" class="form-control" id="Deleted" name="Deleted">
    </div>
    <div class="form-group">
        
        <label for="Remark">Remark:</label>
        <input type="text" value="{{ $sms_stbscbrand->Remark}}" class="form-control" id="Remark" name="Remark">
    </div>
    <div class="form-group">
        
        <label for="sms_id">sms_id:</label>
        <input type="text" value="{{ $sms_stbscbrand->sms_id}}" class="form-control" id="sms_id" name="sms_id">
    </div>
    <div class="form-group">
        
        <label for="CASTYPEID">CASTYPEID:</label>
        <input type="text" value="{{ $sms_stbscbrand->CASTYPEID}}" class="form-control" id="CASTYPEID" name="CASTYPEID">
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
    <strong>No sms_stbscbrands Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')