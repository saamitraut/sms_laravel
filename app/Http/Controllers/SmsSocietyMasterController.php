<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\SmsSocietyMaster as SmsSocietyMaster;
use App\Models\SMSAREACODE as SMSAREACODE;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class SmsSocietyMasterController extends Controller {

    public function index(Request $request)
    {
        $data['sms_society_master'] = SmsSocietyMaster::all();
        $data['sms_society_master'] = SmsSocietyMaster::paginate($request->get('pagination_limit', 5));
    $data['SMS_AREACODE'] = SMSAREACODE::list();
        $data['columnNames'] = ['Id','SocietyCode','SocietyName','AreaId','Status','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark','sms_id'];
        return view('sms_society_master/index', $data);
    }

    public function add()
    {
        return view('sms_society_master/add');
    }

    public function addPost()
    {
        $SmsSocietyMaster_data = array(
             'Id' => Input::get('Id'),
             'SocietyCode' => Input::get('SocietyCode'),
             'SocietyName' => Input::get('SocietyName'),
             'AreaId' => Input::get('AreaId'),
             'Status' => Input::get('Status'),
             'CreatedOn' => Input::get('CreatedOn'),
             'CreatedBy' => Input::get('CreatedBy'),
             'UpdatedOn' => Input::get('UpdatedOn'),
             'UpdatedBy' => Input::get('UpdatedBy'),
             'Deleted' => Input::get('Deleted'),
             'Remark' => Input::get('Remark'),
             'sms_id' => Input::get('sms_id'),
        );
        $SmsSocietyMaster_id = SmsSocietyMaster::insert($SmsSocietyMaster_data);
        return redirect('sms_society_master')->with('message', 'SmsSocietyMaster successfully added');
    }

    public function delete($id)
    {
        $SmsSocietyMaster = SmsSocietyMaster::find($id);
        $SmsSocietyMaster->delete();
        return redirect('sms_society_master')->with('message', 'SmsSocietyMaster deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_society_master'] = SmsSocietyMaster::find($id);
        return view('sms_society_master/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_society_master_id');

        $data = array(
          'Id' => Input::get('Id'),
          'SocietyCode' => Input::get('SocietyCode'),
          'SocietyName' => Input::get('SocietyName'),
          'AreaId' => Input::get('AreaId'),
          'Status' => Input::get('Status'),
          'CreatedOn' => Input::get('CreatedOn'),
          'CreatedBy' => Input::get('CreatedBy'),
          'UpdatedOn' => Input::get('UpdatedOn'),
          'UpdatedBy' => Input::get('UpdatedBy'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
          'sms_id' => Input::get('sms_id'),
        );
        SmsSocietyMaster::where('id', '=', $id)->update($data);
        return redirect('sms_society_master')->with('message', 'SmsSocietyMaster Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsSocietyMaster = SmsSocietyMaster::find($id);
        $SmsSocietyMaster->status = !$SmsSocietyMaster->status;
        $SmsSocietyMaster->save();
        return redirect('sms_society_master')->with('message', 'Change SmsSocietyMaster status successfully');
    }

    public function view($id)
    {
        $data['SmsSocietyMaster'] = SmsSocietyMaster::find($id);
        return view('sms_society_master/view', $data);
    }

    // Add other methods here...
}
