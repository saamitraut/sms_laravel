<?php 
namespace App\Http\Controllers;
use App\Models\PrpBouque as PrpBouque;
use App\Models\PackageType as PackageType;
use App\Models\SmsBroadcaster as SmsBroadcaster;
use App\Models\SmsPackage as SmsPackage;
use App\Models\SmsChannel as SmsChannel;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use App\Models\PrpBouqueAsset as PrpBouqueAsset;
use Hash;

class PrpBouqueController extends Controller {
	

    public function index(Request $request)
    {
        $data['prp_bouque'] = PrpBouque::orderBy('Id', 'desc')->paginate($request->get('pagination_limit', 5));
        $data['columnNames'] = ['Id','BouqueCode','BouqueName','Rate','LCOSharing','BType','Status','AType','Description','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark','isRio','RIOAlaCarte1Count','RIOAlaCarte2Count','PackageTypeId','MRP','broadcaster_id'];
        
		$data['broadcasters_with_packages'] = SmsBroadcaster::has('packages')->orderBy('BROADCASTERNAME')->get();
		// $broadcasters_with_packages = SmsBroadcaster::has('packages')->orderBy('BROADCASTERNAME')->get();
		// dd($broadcasters_with_packages->first()->packages);
		
		$data['broadcasters_with_channels'] = SmsBroadcaster::has('channels')->orderBy('BROADCASTERNAME')->get();
		
		
		$data['package_types'] = PackageType::all();		
		$data['broadcasters']=SmsBroadcaster::all();		
		$data['packages']=SmsPackage::all();
		$data['channels']=SmsChannel::all(); 		
		
		// searching purpose
        if (request()->has('package_type')) {          
			$data['prp_bouque']=PrpBouque::where('PackageTypeId', '=', request()->input('package_type'))->paginate($request->get('pagination_limit', 5));
			// dd($data);
        }
		
		return view('prp_bouque/index', $data); 	
	}

    public function add()
    {
        return view('prp_bouque/add');
    }

    public function addPost(Request $request  )
    {
        
		$PrpBouque_data = array(
             'BouqueCode' => Input::get('BouqueCode'),
             'BouqueName' => Input::get('BouqueName'),
             'Rate' => Input::get('Rate'),
             'LCOSharing' => Input::get('LCOSharing'),
             'BType' => Input::get('BType'),
             'Status' => Input::get('Status'),
             'AType' => Input::get('AType'),
             'Description' => Input::get('Description'),
             'PackageTypeId' => Input::get('PackageTypeId'),
             'broadcaster_id' => Input::get('broadcaster_id'),
			 'CreatedBy' => $request->user()->id
        );
        
		if(PrpBouque::insert($PrpBouque_data)){
			
			$PrpBouque = PrpBouque::where('BouqueCode', Input::get('BouqueCode'))->first();
			
			$packages = $request->input('packages');

			foreach($packages as $package){
				$PrpBouqueAsset_data = array(
					 'BouqueId' => $PrpBouque->Id,
					 'PackageId' => $package,
					 'CreatedBy' => $request->user()->id,
					 'CreatedOn' => \Illuminate\Support\Carbon::now()
				);			
				PrpBouqueAsset::insert($PrpBouqueAsset_data);
			}
			
			$channels = $request->input('channels');

			foreach($channels as $channel){
				$PrpBouqueAsset_data = array(
					 'ChannelId' => $channel,
					 'BouqueId' => $PrpBouque->Id,
					 'CreatedBy' => $request->user()->id,
					 'CreatedOn' => \Illuminate\Support\Carbon::now()
				);			
				PrpBouqueAsset::insert($PrpBouqueAsset_data);
			}
			
			return redirect('prp_bouque')->with('message', 'PrpBouque successfully added');
		}else{
			return redirect('prp_bouque')->with('message', 'PrpBouque could not be added');
		}
    }
	
    public function delete($id)
    {
        $PrpBouque = PrpBouque::find($id);
        $PrpBouque->delete();
        return redirect('prp_bouque')->with('message', 'PrpBouque deleted successfully.');
    }

    public function edit($id)
    {
        $data['prp_bouque'] = PrpBouque::find($id);
        return view('prp_bouque/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('prp_bouque_id');

        $data = array(
          'Id' => Input::get('Id'),
          'BouqueCode' => Input::get('BouqueCode'),
          'BouqueName' => Input::get('BouqueName'),
          'Rate' => Input::get('Rate'),
          'LCOSharing' => Input::get('LCOSharing'),
          'BType' => Input::get('BType'),
          'Status' => Input::get('Status'),
          'AType' => Input::get('AType'),
          'Description' => Input::get('Description'),
          'CreatedOn' => Input::get('CreatedOn'),
          'CreatedBy' => Input::get('CreatedBy'),
          'UpdatedOn' => Input::get('UpdatedOn'),
          'UpdatedBy' => Input::get('UpdatedBy'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
          'isRio' => Input::get('isRio'),
          'RIOAlaCarte1Count' => Input::get('RIOAlaCarte1Count'),
          'RIOAlaCarte2Count' => Input::get('RIOAlaCarte2Count'),
          'PackageTypeId' => Input::get('PackageTypeId'),
          'MRP' => Input::get('MRP'),
          'broadcaster_id' => Input::get('broadcaster_id'),
        );
        PrpBouque::where('id', '=', $id)->update($data);
        return redirect('prp_bouque')->with('message', 'PrpBouque Updated successfully');
    }

    public function changeStatus($id)
    {
        $PrpBouque = PrpBouque::find($id);
        $PrpBouque->Status = !$PrpBouque->Status;
        $PrpBouque->save();
        return redirect('prp_bouque')->with('message', 'Change PrpBouque status successfully');
    }

    public function view($id)
    {
        $data['PrpBouque'] = PrpBouque::find($id);
        return view('prp_bouque/view', $data);
    }

    // Add other methods here...
}
