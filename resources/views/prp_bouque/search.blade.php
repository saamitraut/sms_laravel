<!-- Search Modal -->
<div class="modal fade" id="search" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel1">Search PackageType </h5>
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <div class="modal-body">
          <form role="form" method="post" action="/prp_bouque/" >
              <input type="hidden" name="_token" value="{{ csrf_token() }}">
                <div class="mb-3">
                        <label for="package_type" class="form-label">PackageType</label>
                        <select id="package_type" name="package_type" class="form-select">
						 <option>Default select</option>
						@foreach ($package_types as $package_type)
						<option value="{{$package_type->id}}">{{$package_type->name}}</option>
						@endforeach
                        </select></div>
			  <div class="mb-3">
                        <label for="broadcaster" class="form-label">Broadcaster</label>
                        <select id="broadcaster" name="broadcaster" class="form-select">
						 <option>Default select</option>
						@foreach ($broadcasters as $broadcaster) 
						<option value="{{$broadcaster->ID}}">{{$broadcaster->BROADCASTERNAME}}</option>
						@endforeach
                        </select>
              </div>
			  <div>
                        <label for="defaultFormControlInput" class="form-label">Name</label>
                        <input type="text" class="form-control" id="defaultFormControlInput" placeholder="John Doe" aria-describedby="defaultFormControlHelp">
                        <div id="defaultFormControlHelp" class="form-text">
                          We'll never share your details with anyone else.
                        </div>
                      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
          Close
        </button>
        <button type="submit" class="btn btn-primary">Search</button> </form>
      </div>
    </div>
  </div>
</div>
<!-- Search Modal end-->