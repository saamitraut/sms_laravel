@include('includes.header')

<!-- Content wrapper -->
<div class="content-wrapper">
<!-- Content starts -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">students</h4>

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
>Add students </button>
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
                <h5 class="modal-title" id="exampleModalLabel1">Add students</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/students/add-students-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div class="form-group">
        
        <label for="name">name:</label>
        <input type="text" class="form-control" id="name" name="name">
    </div>
    <div class="form-group">
        
        <label for="state_id">state_id:</label>
        <select onchange="showStock1(this)" id="state_id" name="state_id" class="form-select">
            <option value="0">Select state</option>
            @foreach($states as $state)
                <option value="{{$state['id']}}">{{ $state['name'] }}</option>
            @endforeach
        </select></div>
    <div class="form-group">
        
        <label for="color_id">color_id:</label>
        <select onchange="showStock1(this)" id="color_id" name="color_id" class="form-select">
            <option value="0">Select color</option>
            @foreach($colors as $color)
                <option value="{{$color['id']}}">{{ $color['name'] }}</option>
            @endforeach
        </select></div>
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
@if(count($students) > 0)	
        <nav aria-label="Page navigation">{{ $students->links() }}	</nav>
        <?php $i = 1; ?>
        @foreach($students as $student)
        <div class='card mb-4'>
            <div class='card-body'>
            <h5 class='card-title'>name : {{$student->name}}</h5>
                <h5 class='card-title'>name : {{$states[$student->state_id]['name']}} </h5>
                <h5 class='card-title'>name : {{$colors[$student->color_id]['name']}} </h5><a class='card-link' href='{{ Request::root() }}/students/change-status-students/{{ $student->id }}'>
                     <i class='bx bx-windows me-1'></i>
                     @if ($student->status == 0)
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
                     href='{{ Request::root() }}/students/delete-students/{{ $student->id }}'
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
                <h5 class='modal-title' id='exampleModalLabel1'>Edit students</h5>
                <button
                    type='button'
                    class='btn-close'
                    data-bs-dismiss='modal'
                    aria-label='Close'
                ></button>
            </div>
            <div class='modal-body'>
            <form role='form' method='post' action='{{Request::root()}}/students/edit-students-post' enctype='multipart/form-data'>
                    <input type='hidden' name='_token' value='{{ csrf_token() }}'>
                    <input type='hidden' value='<?php echo $student->id ?>'   name='students_id'>

    <div class="form-group">
        
        <label for="name">name:</label>
        <input type="text" value="{{ $student->name}}" class="form-control" id="name" name="name">
    </div>
    <div class="form-group">
        
        <label for="state_id">state_id:</label>
        <select onchange="showStock1(this)" id="state_id" name="state_id" class="form-select">
            <option value="0">Select state</option>
            @foreach($states as $state)
                <option value="{{$state['id']}}" @if($student->state_id == $state['id']) selected @endif >{{ $state['name'] }}</option>
            @endforeach
        </select></div>
    <div class="form-group">
        
        <label for="color_id">color_id:</label>
        <select onchange="showStock1(this)" id="color_id" name="color_id" class="form-select">
            <option value="0">Select color</option>
            @foreach($colors as $color)
                <option value="{{$color['id']}}" @if($student->color_id == $color['id']) selected @endif >{{ $color['name'] }}</option>
            @endforeach
        </select></div>

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
    <strong>No studentss Found!</strong>
</div>
@endif

<!-- ... (pagination) ... -->

</div></div>

@include('includes.footer')