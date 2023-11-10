<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\SmsBroadcaster as SmsBroadcaster;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class SmsBroadcasterController extends Controller {

    public function index(Request $request)
    {
        $data['sms_broadcaster'] = SmsBroadcaster::orderBy('Id', 'desc')->paginate($request->get('pagination_limit', 5));
        $data['columnNames'] = ['ID','BROADCASTERNAME','BROADCASTERDESC','CREATEDON','UPDATEDON','CREATEDBY','UPDATEDBY','STATUS','Deleted','Remark','sms_id'];
        return view('sms_broadcaster/index', $data);
    }

    public function add()
    {
        return view('sms_broadcaster/add');
    }

    public function addPost(Request $request)
    {
		$SmsBroadcaster_data = array(
             'BROADCASTERNAME' => Input::get('BROADCASTERNAME'),
             'BROADCASTERDESC' => Input::get('BROADCASTERDESC'),
             'CREATEDBY' => $request->user()->id,
             'STATUS' => Input::get('STATUS'),
             'Remark' => Input::get('Remark'),
			 'CreatedOn' => \Illuminate\Support\Carbon::now()
        );
        $no_of_rows_inserted = SmsBroadcaster::insert($SmsBroadcaster_data);
        
		if($no_of_rows_inserted){
			return redirect('sms_broadcaster')->with('message', 'SmsBroadcaster successfully added');
		}else{
			return redirect('sms_broadcaster')->with('message', 'SmsBroadcaster could not be added');
		}
    }

    public function delete($id)
    {
        $SmsBroadcaster = SmsBroadcaster::find($id);
        $SmsBroadcaster->delete();
        return redirect('sms_broadcaster')->with('message', 'SmsBroadcaster deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_broadcaster'] = SmsBroadcaster::find($id);
        return view('sms_broadcaster/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_broadcaster_id');

        $data = array(
          'ID' => Input::get('ID'),
          'BROADCASTERNAME' => Input::get('BROADCASTERNAME'),
          'BROADCASTERDESC' => Input::get('BROADCASTERDESC'),
          'CREATEDON' => Input::get('CREATEDON'),
          'UPDATEDON' => Input::get('UPDATEDON'),
          'CREATEDBY' => Input::get('CREATEDBY'),
          'UPDATEDBY' => Input::get('UPDATEDBY'),
          'STATUS' => Input::get('STATUS'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
          'sms_id' => Input::get('sms_id'),
        );
        SmsBroadcaster::where('id', '=', $id)->update($data);
        return redirect('sms_broadcaster')->with('message', 'SmsBroadcaster Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsBroadcaster = SmsBroadcaster::find($id);
        $SmsBroadcaster->status = !$SmsBroadcaster->status;
        $SmsBroadcaster->save();
        return redirect('sms_broadcaster')->with('message', 'Change SmsBroadcaster status successfully');
    }

    public function view($id)
    {
        $data['SmsBroadcaster'] = SmsBroadcaster::find($id);
        return view('sms_broadcaster/view', $data);
    }

    // Add other methods here...
}
