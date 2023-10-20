<?php 
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\PrpBouque as PrpBouque;
use App\Models\PackageType as PackageType;
use App\Models\SmsBroadcaster as SmsBroadcaster;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class PrpBouqueController extends Controller {

    public function index(Request $request)
    {
        // $data['prp_bouque'] = PrpBouque::all();
        $data['prp_bouque'] = PrpBouque::paginate($request->get('pagination_limit', 5));
        $data['columnNames'] = ['Id','BouqueCode','BouqueName','Rate','LCOSharing','BType','Status','AType','Description','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark','isRio','RIOAlaCarte1Count','RIOAlaCarte2Count','PackageTypeId','MRP','broadcaster_id'];
        
		$package_types = PackageType::all();		
		$data['package_types'] = $package_types;		
		$data['broadcasters']=SmsBroadcaster::all();
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

    public function addPost()
    {
        $PrpBouque_data = array(
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
        $PrpBouque_id = PrpBouque::insert($PrpBouque_data);
        return redirect('prp_bouque')->with('message', 'PrpBouque successfully added');
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
        $PrpBouque->status = !$PrpBouque->status;
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
