<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\SmsSmartcard as SmsSmartcard;
use App\Models\SMSSTBSCBRAND as SMSSTBSCBRAND;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class SmsSmartcardController extends Controller {

    public function index(Request $request)
    {
        $data['sms_smartcards'] = SmsSmartcard::all();
        $data['sms_smartcards'] = SmsSmartcard::paginate($request->get('pagination_limit', 5));
    $data['SMS_STBSCBRAND'] = SMSSTBSCBRAND::list();
        $data['columnNames'] = ['Id','SmartcardNo','Status','BrandId','UploadLogId','DocExtension','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark','IsLocked','LockedOn','LockedFrom','sms_id','PONumber','PODate','InvNumber','InvDate'];
        return view('sms_smartcards/index', $data);
    }

    public function add()
    {
        return view('sms_smartcards/add');
    }

    public function addPost()
    {
        $SmsSmartcard_data = array(
             'Id' => Input::get('Id'),
             'SmartcardNo' => Input::get('SmartcardNo'),
             'Status' => Input::get('Status'),
             'BrandId' => Input::get('BrandId'),
             'UploadLogId' => Input::get('UploadLogId'),
             'DocExtension' => Input::get('DocExtension'),
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
             'PONumber' => Input::get('PONumber'),
             'PODate' => Input::get('PODate'),
             'InvNumber' => Input::get('InvNumber'),
             'InvDate' => Input::get('InvDate'),
        );
        $SmsSmartcard_id = SmsSmartcard::insert($SmsSmartcard_data);
        return redirect('sms_smartcards')->with('message', 'SmsSmartcard successfully added');
    }

    public function delete($id)
    {
        $SmsSmartcard = SmsSmartcard::find($id);
        $SmsSmartcard->delete();
        return redirect('sms_smartcards')->with('message', 'SmsSmartcard deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_smartcards'] = SmsSmartcard::find($id);
        return view('sms_smartcards/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_smartcards_id');

        $data = array(
          'Id' => Input::get('Id'),
          'SmartcardNo' => Input::get('SmartcardNo'),
          'Status' => Input::get('Status'),
          'BrandId' => Input::get('BrandId'),
          'UploadLogId' => Input::get('UploadLogId'),
          'DocExtension' => Input::get('DocExtension'),
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
          'PONumber' => Input::get('PONumber'),
          'PODate' => Input::get('PODate'),
          'InvNumber' => Input::get('InvNumber'),
          'InvDate' => Input::get('InvDate'),
        );
        SmsSmartcard::where('id', '=', $id)->update($data);
        return redirect('sms_smartcards')->with('message', 'SmsSmartcard Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsSmartcard = SmsSmartcard::find($id);
        $SmsSmartcard->status = !$SmsSmartcard->status;
        $SmsSmartcard->save();
        return redirect('sms_smartcards')->with('message', 'Change SmsSmartcard status successfully');
    }

    public function view($id)
    {
        $data['SmsSmartcard'] = SmsSmartcard::find($id);
        return view('sms_smartcards/view', $data);
    }

    // Add other methods here...
}
