<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\SmsAcces as SmsAcces;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class SmsAccesController extends Controller {

    public function index(Request $request)
    {
        $data['sms_access'] = SmsAcces::all();
        $data['sms_access'] = SmsAcces::paginate($request->get('pagination_limit', 5));
        $data['columnNames'] = ['ID','NAME','LOGINID','PASSWORD','USERTYPE','STATUS','CREATEDON','UPDATEDON','CREATEDBY','UPDATEDBY','OperatorID','Remark','deleted','sms_id'];
        return view('sms_access/index', $data);
    }

    public function add()
    {
        return view('sms_access/add');
    }

    public function addPost()
    {
        $SmsAcces_data = array(
             'ID' => Input::get('ID'),
             'NAME' => Input::get('NAME'),
             'LOGINID' => Input::get('LOGINID'),
             'PASSWORD' => Input::get('PASSWORD'),
             'USERTYPE' => Input::get('USERTYPE'),
             'STATUS' => Input::get('STATUS'),
             'CREATEDON' => Input::get('CREATEDON'),
             'UPDATEDON' => Input::get('UPDATEDON'),
             'CREATEDBY' => Input::get('CREATEDBY'),
             'UPDATEDBY' => Input::get('UPDATEDBY'),
             'OperatorID' => Input::get('OperatorID'),
             'Remark' => Input::get('Remark'),
             'deleted' => Input::get('deleted'),
             'sms_id' => Input::get('sms_id'),
        );
        $SmsAcces_id = SmsAcces::insert($SmsAcces_data);
        return redirect('sms_access')->with('message', 'SmsAcces successfully added');
    }

    public function delete($id)
    {
        $SmsAcces = SmsAcces::find($id);
        $SmsAcces->delete();
        return redirect('sms_access')->with('message', 'SmsAcces deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_access'] = SmsAcces::find($id);
        return view('sms_access/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_access_id');

        $data = array(
          'ID' => Input::get('ID'),
          'NAME' => Input::get('NAME'),
          'LOGINID' => Input::get('LOGINID'),
          'PASSWORD' => Input::get('PASSWORD'),
          'USERTYPE' => Input::get('USERTYPE'),
          'STATUS' => Input::get('STATUS'),
          'CREATEDON' => Input::get('CREATEDON'),
          'UPDATEDON' => Input::get('UPDATEDON'),
          'CREATEDBY' => Input::get('CREATEDBY'),
          'UPDATEDBY' => Input::get('UPDATEDBY'),
          'OperatorID' => Input::get('OperatorID'),
          'Remark' => Input::get('Remark'),
          'deleted' => Input::get('deleted'),
          'sms_id' => Input::get('sms_id'),
        );
        SmsAcces::where('id', '=', $id)->update($data);
        return redirect('sms_access')->with('message', 'SmsAcces Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsAcces = SmsAcces::find($id);
        $SmsAcces->status = !$SmsAcces->status;
        $SmsAcces->save();
        return redirect('sms_access')->with('message', 'Change SmsAcces status successfully');
    }

    public function view($id)
    {
        $data['SmsAcces'] = SmsAcces::find($id);
        return view('sms_access/view', $data);
    }

    // Add other methods here...
}
