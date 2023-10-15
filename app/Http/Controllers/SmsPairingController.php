<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\SmsPairing as SmsPairing;
use App\Models\SmsSmartcard as SMSSMARTCARDS;
use App\Models\SmsStb as SMSSTBS;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class SmsPairingController extends Controller {

    public function index(Request $request)
    {
        $data['sms_pairing'] = SmsPairing::all();
        $data['sms_pairing'] = SmsPairing::paginate($request->get('pagination_limit', 5));
    $data['SMS_SMARTCARDS'] = SMSSMARTCARDS::list();
    $data['SMS_STBS'] = SMSSTBS::list();
        $data['columnNames'] = ['Id','SmartCardId','StbId','Status','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark','IsLocked','LockedOn','LockedFrom','sms_id','AllocatedOperatorId'];
        return view('sms_pairing/index', $data);
    }

    public function add()
    {
        return view('sms_pairing/add');
    }

    public function addPost()
    {
        $SmsPairing_data = array(
             'Id' => Input::get('Id'),
             'SmartCardId' => Input::get('SmartCardId'),
             'StbId' => Input::get('StbId'),
             'Status' => Input::get('Status'),
             'CreatedOn' => Input::get('CreatedOn'),
             'CreatedBy' => Input::get('CreatedBy'),
             'UpdatedOn' => Input::get('UpdatedOn'),
             'UpdatedBy' => Input::get('UpdatedBy'),
             'Deleted' => Input::get('Deleted'),
             'Remark' => Input::get('Remark'),
             'IsLocked' => Input::get('IsLocked'),
             'LockedOn' => Input::get('LockedOn'),
             'LockedFrom' => Input::get('LockedFrom'),
             'sms_id' => Input::get('sms_id'),
             'AllocatedOperatorId' => Input::get('AllocatedOperatorId'),
        );
        $SmsPairing_id = SmsPairing::insert($SmsPairing_data);
        return redirect('sms_pairing')->with('message', 'SmsPairing successfully added');
    }

    public function delete($id)
    {
        $SmsPairing = SmsPairing::find($id);
        $SmsPairing->delete();
        return redirect('sms_pairing')->with('message', 'SmsPairing deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_pairing'] = SmsPairing::find($id);
        return view('sms_pairing/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_pairing_id');

        $data = array(
          'Id' => Input::get('Id'),
          'SmartCardId' => Input::get('SmartCardId'),
          'StbId' => Input::get('StbId'),
          'Status' => Input::get('Status'),
          'CreatedOn' => Input::get('CreatedOn'),
          'CreatedBy' => Input::get('CreatedBy'),
          'UpdatedOn' => Input::get('UpdatedOn'),
          'UpdatedBy' => Input::get('UpdatedBy'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
          'IsLocked' => Input::get('IsLocked'),
          'LockedOn' => Input::get('LockedOn'),
          'LockedFrom' => Input::get('LockedFrom'),
          'sms_id' => Input::get('sms_id'),
          'AllocatedOperatorId' => Input::get('AllocatedOperatorId'),
        );
        SmsPairing::where('id', '=', $id)->update($data);
        return redirect('sms_pairing')->with('message', 'SmsPairing Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsPairing = SmsPairing::find($id);
        $SmsPairing->status = !$SmsPairing->status;
        $SmsPairing->save();
        return redirect('sms_pairing')->with('message', 'Change SmsPairing status successfully');
    }

    public function view($id)
    {
        $data['SmsPairing'] = SmsPairing::find($id);
        return view('sms_pairing/view', $data);
    }

    // Add other methods here...
}
