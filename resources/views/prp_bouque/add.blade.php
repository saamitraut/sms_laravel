<!-- add Modal -->
<div class="modal fade" id="addBouque" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Add prp_bouque</h5 >
                <button 
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                 <form role="form" method="post" action="/prp_bouque/add-prp_bouque-post" >
                          <input type="hidden" name="_token" value="{{ csrf_token() }}" >
           
    <div id="accordionIcon" class="accordion mt-3 accordion-without-arrow">
	<div class="accordion-item card" style="max-height: 300px;  overflow-y: auto;">
                      <h2 class="accordion-header text-body d-flex justify-content-between" id="accordionIconOne">
                        <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#basicDetails-1" aria-controls="basicDetails-1" aria-expanded="false">
                          Basic Details
                        </button>
                      </h2>

                      <div id="basicDetails-1" class="accordion-collapse collapse" data-bs-parent="#accordionIcon" style="">
                        <div class="accordion-body">
                         <div class="row">
		<div class="col-md-3"><div class="form-group">
			<label for="BouqueCode">BouqueCode:</label>
			<input type="text" class="form-control" id="BouqueCode" name="BouqueCode">
		</div></div>
		<div class="col-md-3"><div class="form-group">
			<label for="BouqueName">BouqueName:</label>
			<input type="text" class="form-control" id="BouqueName" name="BouqueName">
		</div></div>
		<div class="col-md-3"><div class="form-group">
			<label for="Rate">Rate:</label>
			<input type="text" class="form-control" id="Rate" name="Rate">
		</div></div>
		<div class="col-md-3"><div class="form-group">        
			<label for="LCOSharing">LCOSharing:</label>
			<input type="text" class="form-control" id="LCOSharing" name="LCOSharing">
		</div></div>
		
		<div class="col-md-3"><div class="form-group">
			<label for="BType">BoxType:</label>
			<select onchange="" id="BType" name="BType" class="form-select">
				<option value="0">Select BoxType</option>
					<option value="0">SD</option>
					<option value="1">HD</option>
			</select></div>
		</div>
			
		<div class="col-md-3"><div class="form-group">
			<label for="Status">Status:</label>
			<select onchange="" id="Status" name="Status" class="form-select">
				<option value="0">Select Status</option>
					<option value="0">InActive</option>
					<option value="1">Active</option>
			</select>
			</div>
		</div>
		<div class="col-md-3"><div class="form-group">
			<label for="AType">Allocation Type:</label>
			<select onchange="" id="AType" name="AType" class="form-select">
				<option value="0">Select AType</option>
					<option value="0">Secondary</option>
					<option value="1">Primary</option>
			</select>
		</div>
		</div>
		<div class="col-md-3"><div class="form-group">        
			<label for="PackageTypeId">PackageType:</label>
			<select onchange="" id="PackageTypeId" name="PackageTypeId" class="form-select">
				<option value="0">Select Type</option>
					<option value="1">DPO</option>
					<option value="2">Broadcaster</option>
					<option value="3">Alacarte</option>
			</select>
		</div></div>
		<div class="col-md-3"><div class="form-group">
			<label for="Description">Description:</label>
			<input type="text" class="form-control" id="Description" name="Description">
		</div></div>
	</div>
                        </div>
                      </div>
                    </div>
		
		<!--<div class="col-md-6"><div class="mb-3">
							<label for="broadcaster" class="form-label">Broadcaster</label>
							<select id="broadcaster_id" name="broadcaster_id" class="form-select">
							 <option  value="0">Select Broadcaster</option>
							
							@foreach ($broadcasters as $broadcaster) 
							<option value="{{$broadcaster->ID}}">{{$broadcaster->BROADCASTERNAME}}</option>
							@endforeach
							</select>
				  </div>
		</div>-->
		<div class="accordion-item card" style="max-height: 300px;  overflow-y: auto;">
                      <h2 class="accordion-header text-body d-flex justify-content-between" id="accordionIconOne">
                        <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#choosepackages-1" aria-controls="choosepackages-1" aria-expanded="false">
                          Choose Packages
                        </button>
                      </h2>

                      <div id="choosepackages-1" class="accordion-collapse collapse" data-bs-parent="#accordionIcon" style="">
                        <div class="accordion-body">
                          <div class="col-md-12">
                          <!--<div class="col-md-12" style="overflow-y: auto;height: 200px;">-->
						  
                          <small class="text-light fw-semibold">Packages</small>
                     <div id="accordionPackages" class="accordion mt-3 accordion-without-arrow"><div class="row">     
					@foreach($broadcasters_with_packages as $broadcaster)
					<div class="accordion-item card col-md-3">
                      <h2 class="accordion-header text-body d-flex justify-content-between" id="accordionIconOne">
                        <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#broadcasterPackages-{{$broadcaster->ID}}" aria-controls="accordionIcon-1" aria-expanded="false">
						{{$broadcaster->BROADCASTERNAME}}
                        </button>
                      </h2>
                      <div id="broadcasterPackages-{{$broadcaster->ID}}" class="accordion-collapse collapse" data-bs-parent="#accordionPackages" style="">
                        
						<div class="accordion-body">
                          @foreach($broadcaster->packages as $package)
						  <div class="form-check mt-3">
                            <input onclick="checkedPackagesCount()" class="form-check-input" name="packages[]" type="checkbox" value="{{$package->Id}}" data-package="{{$package->PackageName}}" id="defaultCheck1">
                            <label class="form-check-label" for="defaultCheck1"> {{$package->PackageName}} </label>
                          </div>
						  @endforeach
                        </div>
                      </div>
                    </div>
					@endforeach	
					</div></div>  
					</div>  
                        </div>
                      </div>
        </div>		
		
		
		
		<div class="accordion-item card" style="max-height: 300px;  overflow-y: auto;">
                      <h2 class="accordion-header text-body d-flex justify-content-between" id="accordionIconOne">
                        <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#choosechannels-1" aria-controls="choosechannels-1" aria-expanded="false">
                          Choose Channels
                        </button>
                      </h2>

                      <div id="choosechannels-1" class="accordion-collapse collapse" data-bs-parent="#accordionIcon" style="">
                        <div class="accordion-body">
                          <div class="col-md-12">
						  
                          <div class="row"><div class="col-md-3"><small class="text-light fw-semibold">Channels</small></div>
							<div class="col-md-3"><select id="ChooseBroadcaster" class="form-select  form-select-sm">
							  <option value="0">Choose Broadcaster</option>
							   @foreach($broadcasters_with_channels as $broadcaster)
								<option value="broadcasterC-{{$broadcaster->ID}}">{{$broadcaster->BROADCASTERNAME}}</option>
								@endforeach
							</select></div>
							</div>
							
                     <div id="accordionChannels" class="accordion mt-3 accordion-without-arrow"><div class="row">  
					@foreach($broadcasters_with_channels as $broadcaster)
					<div style="max-height: 300px;  overflow-y: auto; scrollbar-width: none;" class="accordion-item broadcasterC card" id="broadcasterC-{{$broadcaster->ID}}">
                      <h2 class="accordion-header text-body d-flex justify-content-between" id="accordionIconOne">
                        <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#broadcasterChannels-{{$broadcaster->ID}}" aria-controls="accordionIcon-1" aria-expanded="false">
						{{$broadcaster->BROADCASTERNAME}}
                        </button>
                      </h2>
					  
                      <div id="broadcasterChannels-{{$broadcaster->ID}}" class="accordion-collapse collapse" data-bs-parent="#accordionChannels" style="">
						<div class="accordion-body">
						<div class="form-check mt-3">
							<input type="checkbox" class="form-check-input" onclick="checkall({{$broadcaster->ID}},this)" id="checkAll{{$broadcaster->ID}}" />
							<label class="form-check-label" for="checkAll">Check All</label>
						</div>
						
						
						<div class="row">
                          @foreach($broadcaster->channels as $channel)
						  <div class="form-check mt-3 col-md-2">
                            <input onclick="checkedChannelsCount()" class="form-check-input {{$broadcaster->ID}}-checkbox" name="channels[]" type="checkbox" value="{{$channel->Id}}" id="defaultCheck1" data-channel="{{$channel->ChannelName}}">
                            <label class="form-check-label" for="defaultCheck1"> {{$channel->ChannelName}} </label>
                          </div>
						  @endforeach
                        </div> </div>
                      </div>
                    </div>
					@endforeach	
					</div></div>	  
					</div>  
                        </div>
                      </div>
        </div>
		
		<!--<div class="col-md-12" style="overflow-y: auto;height: 200px;">
                          <small class="text-light fw-semibold">Channels</small>
						  @foreach($channels as $channel)
						  <div class="form-check mt-3">
                            <input class="form-check-input" name="channels[]" type="checkbox" value="{{$channel->Id}}" id="defaultCheck1">
                            <label class="form-check-label" for="defaultCheck1"> {{$channel->ChannelName}} </label>
                          </div>
						  @endforeach
						</div>-->
	
                
				</div ></div>
                
				<div class="modal-footer">
				<div class="dropdown">            
					<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
					  Chosen packages <p class="card-text" ></p>
					</button>
					<div class="dropdown-menu" id="chosenpackages">
					</div>
				</div>
			  <div class="dropdown">            
				<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
				  Chosen channels <p class="card-text" ></p>
				</button>
				<div class="dropdown-menu" data-popper-placement="top-end" id="chosenchannels">
				</div>
			  </div>
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                        Close
                    </button>
                    <button type="submit" class="btn btn-primary">Save changes</button> </form>
                </div>
            </div>
        </div>
    
	</div>
<!-- add Modal end -->




<script>
 function checkedPackagesCount(){
	const checkedPackages = [];

	// Get all checkbox inputs with the name "packages[]"
	const checkboxes = document.querySelectorAll('input[name="packages[]"]');

	for (const checkbox of checkboxes) {
	  if (checkbox.checked) {
		  checkedPackages.push(checkbox.dataset.package)	  
	  }
	}
	 const chosenPackagesElement = document.getElementById('chosenpackages');

	// Clear the existing content of the element
	chosenPackagesElement.textContent = '';

	// Iterate over the checked package names and append them to the element
	for (const package of checkedPackages) {
	  const paragraphElement = document.createElement('p');
	  paragraphElement.classList.add('dropdown-item');
	  paragraphElement.textContent = package;

	  chosenPackagesElement.appendChild(paragraphElement);

	}

 }
 function checkedChannelsCount(){
	
	const checkedChannels = [];

	// Get all checkbox inputs with the name "packages[]"
	const checkboxes = document.querySelectorAll('input[name="channels[]"]');

	for (const checkbox of checkboxes) {
	  
	  if (checkbox.checked) {
		  checkedChannels.push(checkbox.dataset.channel)	  
	  }
	}
	 
	 const chosenChannelsElement = document.getElementById('chosenchannels');

	// Clear the existing content of the element
	
	chosenChannelsElement.textContent = '';

	// Iterate over the checked package names and append them to the element
	for (const channel of checkedChannels) {
	  
	  const paragraphElement = document.createElement('div');
	  paragraphElement.classList.add('dropdown-item');
	  paragraphElement.textContent = channel;

	  chosenChannelsElement.appendChild(paragraphElement);

	}

 }
 
 // Select all checkboxes
function checkall(broadcasterid,checkbox) {
  var checkboxes = document.getElementsByClassName(''+broadcasterid+'-checkbox');
  
  for (var i = 0; i < checkboxes.length; i++) {
    if(checkbox.checked){
		checkboxes[i].checked = true;
	}else{
		checkboxes[i].checked = false;
	}
  }
	checkedChannelsCount();
  
}
</script>

<script>
const bouqueDivs = document.querySelectorAll('.broadcasterC');

for (const bouqueDiv of bouqueDivs) {
  bouqueDiv.addEventListener('click', () => {
   setTimeout(() => {
      bouqueDiv.scrollIntoView();
    }, 500);
  });
}  
function move(id) {
  // Get the DIV element with the specified ID.
  const div = document.getElementById(id);
  // Get the parent element of the DIV.
  div.parentElement.prepend(div) 
}
document.getElementById('ChooseBroadcaster').addEventListener('change', function() {
  move(this.value);
});
</script>