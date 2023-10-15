<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\SmsAreacode as SmsAreacode;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class SmsAreacodeController extends Controller {

    public function index(Request $request)
    {
        $data['sms_areacode'] = SmsAreacode::all();
        $data['sms_areacode'] = SmsAreacode::paginate($request->get('pagination_limit', 5));
        $data['columnNames'] = ['ID','AREACODE','NAME','Status','OperatorId','CREATEDON','UPDATEDON','CREATEDBY','UPDATEDBY','Remark','Deleted','sms_id','AREACASCODE'];
        return view('sms_areacode/index', $data);
    }

    public function add()
    {
        return view('sms_areacode/add');
    }

    public function addPost()
    {
        $SmsAreacode_data = array(
             'ID' => Input::get('ID'),
             'AREACODE' => Input::get('AREACODE'),
             'NAME' => Input::get('NAME'),
             'Status' => Input::get('Status'),
             'OperatorId' => Input::get('OperatorId'),
             'CREATEDON' => Input::get('CREATEDON'),
             'UPDATEDON' => Input::get('UPDATEDON'),
             'CREATEDBY' => Input::get('CREATEDBY'),
             'UPDATEDBY' => Input::get('UPDATEDBY'),
             'Remark' => Input::get('Remark'),
             'Deleted' => Input::get('Deleted'),
             'sms_id' => Input::get('sms_id'),
             'AREACASCODE' => Input::get('AREACASCODE'),
        );
        $SmsAreacode_id = SmsAreacode::insert($SmsAreacode_data);
        return redirect('sms_areacode')->with('message', 'SmsAreacode successfully added');
    }

    public function delete($id)
    {
        $SmsAreacode = SmsAreacode::find($id);
        $SmsAreacode->delete();
        return redirect('sms_areacode')->with('message', 'SmsAreacode deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_areacode'] = SmsAreacode::find($id);
        return view('sms_areacode/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_areacode_id');

        $data = array(
          'ID' => Input::get('ID'),
          'AREACODE' => Input::get('AREACODE'),
          'NAME' => Input::get('NAME'),
          'Status' => Input::get('Status'),
          'OperatorId' => Input::get('OperatorId'),
          'CREATEDON' => Input::get('CREATEDON'),
          'UPDATEDON' => Input::get('UPDATEDON'),
          'CREATEDBY' => Input::get('CREATEDBY'),
          'UPDATEDBY' => Input::get('UPDATEDBY'),
          'Remark' => Input::get('Remark'),
          'Deleted' => Input::get('Deleted'),
          'sms_id' => Input::get('sms_id'),
          'AREACASCODE' => Input::get('AREACASCODE'),
        );
        SmsAreacode::where('id', '=', $id)->update($data);
        return redirect('sms_areacode')->with('message', 'SmsAreacode Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsAreacode = SmsAreacode::find($id);
        $SmsAreacode->status = !$SmsAreacode->status;
        $SmsAreacode->save();
        return redirect('sms_areacode')->with('message', 'Change SmsAreacode status successfully');
    }

    public function view($id)
    {
        $data['SmsAreacode'] = SmsAreacode::find($id);
        return view('sms_areacode/view', $data);
    }

    // Add other methods here...
}
