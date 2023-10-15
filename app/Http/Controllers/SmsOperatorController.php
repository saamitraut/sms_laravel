<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\SmsOperator as SmsOperator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class SmsOperatorController extends Controller {

    public function index(Request $request)
    {
        $data['sms_operator'] = SmsOperator::all();
        $data['sms_operator'] = SmsOperator::paginate($request->get('pagination_limit', 5));
        $data['columnNames'] = ['ID','NAME','CODE','CONTACTPERSON','ParentId','TobeBilled','BillingFrom','ADDRESS','MOBILE','Email','PHONE','STATUS','CREATEDON','UPDATEDON','CREATEDBY','UPDATEDBY','LogInId','Password','Deleted','Remark','sms_id','branch','AreaId','PanNo','SerTaxNo'];
        return view('sms_operator/index', $data);
    }

    public function add()
    {
        return view('sms_operator/add');
    }

    public function addPost()
    {
        $SmsOperator_data = array(
             'ID' => Input::get('ID'),
             'NAME' => Input::get('NAME'),
             'CODE' => Input::get('CODE'),
             'CONTACTPERSON' => Input::get('CONTACTPERSON'),
             'ParentId' => Input::get('ParentId'),
             'TobeBilled' => Input::get('TobeBilled'),
             'BillingFrom' => Input::get('BillingFrom'),
             'ADDRESS' => Input::get('ADDRESS'),
             'MOBILE' => Input::get('MOBILE'),
             'Email' => Input::get('Email'),
             'PHONE' => Input::get('PHONE'),
             'STATUS' => Input::get('STATUS'),
             'CREATEDON' => Input::get('CREATEDON'),
             'UPDATEDON' => Input::get('UPDATEDON'),
             'CREATEDBY' => Input::get('CREATEDBY'),
             'UPDATEDBY' => Input::get('UPDATEDBY'),
             'LogInId' => Input::get('LogInId'),
             'Password' => Input::get('Password'),
             'Deleted' => Input::get('Deleted'),
             'Remark' => Input::get('Remark'),
             'sms_id' => Input::get('sms_id'),
             'branch' => Input::get('branch'),
             'AreaId' => Input::get('AreaId'),
             'PanNo' => Input::get('PanNo'),
             'SerTaxNo' => Input::get('SerTaxNo'),
        );
        $SmsOperator_id = SmsOperator::insert($SmsOperator_data);
        return redirect('sms_operator')->with('message', 'SmsOperator successfully added');
    }

    public function delete($id)
    {
        $SmsOperator = SmsOperator::find($id);
        $SmsOperator->delete();
        return redirect('sms_operator')->with('message', 'SmsOperator deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_operator'] = SmsOperator::find($id);
        return view('sms_operator/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_operator_id');

        $data = array(
          'ID' => Input::get('ID'),
          'NAME' => Input::get('NAME'),
          'CODE' => Input::get('CODE'),
          'CONTACTPERSON' => Input::get('CONTACTPERSON'),
          'ParentId' => Input::get('ParentId'),
          'TobeBilled' => Input::get('TobeBilled'),
          'BillingFrom' => Input::get('BillingFrom'),
          'ADDRESS' => Input::get('ADDRESS'),
          'MOBILE' => Input::get('MOBILE'),
          'Email' => Input::get('Email'),
          'PHONE' => Input::get('PHONE'),
          'STATUS' => Input::get('STATUS'),
          'CREATEDON' => Input::get('CREATEDON'),
          'UPDATEDON' => Input::get('UPDATEDON'),
          'CREATEDBY' => Input::get('CREATEDBY'),
          'UPDATEDBY' => Input::get('UPDATEDBY'),
          'LogInId' => Input::get('LogInId'),
          'Password' => Input::get('Password'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
          'sms_id' => Input::get('sms_id'),
          'branch' => Input::get('branch'),
          'AreaId' => Input::get('AreaId'),
          'PanNo' => Input::get('PanNo'),
          'SerTaxNo' => Input::get('SerTaxNo'),
        );
        SmsOperator::where('id', '=', $id)->update($data);
        return redirect('sms_operator')->with('message', 'SmsOperator Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsOperator = SmsOperator::find($id);
        $SmsOperator->status = !$SmsOperator->status;
        $SmsOperator->save();
        return redirect('sms_operator')->with('message', 'Change SmsOperator status successfully');
    }

    public function view($id)
    {
        $data['SmsOperator'] = SmsOperator::find($id);
        return view('sms_operator/view', $data);
    }

    // Add other methods here...
}
