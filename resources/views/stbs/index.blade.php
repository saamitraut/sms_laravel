@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">stbs</h4>

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
>Add stbs </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add stbs</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/stbs/add-stbs-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="STBNo">STBNo:</label>
        <input type="text" class="form-control" id="STBNo" name="STBNo">
    </div>
    <div class="form-group">
        
        <label for="SmartcardNo">SmartcardNo:</label>
        <input type="text" class="form-control" id="SmartcardNo" name="SmartcardNo">
    </div>
    <div class="form-group">
        
        <label for="amount">amount:</label>
        <input type="text" class="form-control" id="amount" name="amount">
    </div>
    <div class="form-group">
        
        <label for="DeactivationDate">DeactivationDate:</label>
        <input type="text" class="form-control" id="DeactivationDate" name="DeactivationDate">
    </div>
    <div class="form-group">
        
        <label for="accountid">accountid:</label>
        <input type="text" class="form-control" id="accountid" name="accountid">
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
@if(count($stbs) > 0)	
        <nav aria-label="Page navigation">{{ $stbs->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($stbs as $stb)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>STBNo : {{$stb->STBNo}}</h5>
            <h5 class='card-title'>SmartcardNo : {{$stb->SmartcardNo}}</h5>
            <h5 class='card-title'>amount : {{$stb->amount}}</h5>
            <h5 class='card-title'>DeactivationDate : {{$stb->DeactivationDate}}</h5>
            <h5 class='card-title'>accountid : {{$stb->accountid}}</h5><a class='card-link' href='{{ Request::root() }}/stbs/change-status-stbs/{{ $stb->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($stb->status == 0)
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
                     href='{{ Request::root() }}/stbs/delete-stbs/{{ $stb->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit stbs</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/stbs/edit-stbs-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $stb->id ?>'   name='stbs_id'>

    <div class="form-group">
        
        <label for="STBNo">STBNo:</label>
        <input type="text" value="{{ $stb->STBNo}}" class="form-control" id="STBNo" name="STBNo">
    </div>
    <div class="form-group">
        
        <label for="SmartcardNo">SmartcardNo:</label>
        <input type="text" value="{{ $stb->SmartcardNo}}" class="form-control" id="SmartcardNo" name="SmartcardNo">
    </div>
    <div class="form-group">
        
        <label for="amount">amount:</label>
        <input type="text" value="{{ $stb->amount}}" class="form-control" id="amount" name="amount">
    </div>
    <div class="form-group">
        
        <label for="DeactivationDate">DeactivationDate:</label>
        <input type="text" value="{{ $stb->DeactivationDate}}" class="form-control" id="DeactivationDate" name="DeactivationDate">
    </div>
    <div class="form-group">
        
        <label for="accountid">accountid:</label>
        <input type="text" value="{{ $stb->accountid}}" class="form-control" id="accountid" name="accountid">
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
    <strong>No stbss Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')