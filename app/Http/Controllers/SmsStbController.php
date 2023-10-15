<?php 
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\SmsStb as SmsStb;
use App\Models\SMSSTBSCBRAND as SMSSTBSCBRAND;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class SmsStbController extends Controller {

    public function index(Request $request)
    {
        $data['sms_stbs'] = SmsStb::all();
        $data['sms_stbs'] = SmsStb::paginate($request->get('pagination_limit', 5));
    $data['SMS_STBSCBRAND'] = SMSSTBSCBRAND::list();
        $data['columnNames'] = ['Id','STBNo','MACADDRESS','Status','BrandId','UploadLogId','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark','IsLocked','LockedOn','LockedFrom','sms_id','DocExtension','CHIPID','Checkcode','Authcode','PONumber','PODate','InvNumber','InvDate','NSTVSTBTrackNo'];
        return view('sms_stbs/index', $data);
    }

    public function add()
    {
        return view('sms_stbs/add');
    }

    public function addPost()
    {
        $SmsStb_data = array(
             'Id' => Input::get('Id'),
             'STBNo' => Input::get('STBNo'),
             'MACADDRESS' => Input::get('MACADDRESS'),
             'Status' => Input::get('Status'),
             'BrandId' => Input::get('BrandId'),
             'UploadLogId' => Input::get('UploadLogId'),
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
             'DocExtension' => Input::get('DocExtension'),
             'CHIPID' => Input::get('CHIPID'),
             'Checkcode' => Input::get('Checkcode'),
             'Authcode' => Input::get('Authcode'),
             'PONumber' => Input::get('PONumber'),
             'PODate' => Input::get('PODate'),
             'InvNumber' => Input::get('InvNumber'),
             'InvDate' => Input::get('InvDate'),
             'NSTVSTBTrackNo' => Input::get('NSTVSTBTrackNo'),
        );
        $SmsStb_id = SmsStb::insert($SmsStb_data);
        return redirect('sms_stbs')->with('message', 'SmsStb successfully added');
    }

    public function delete($id)
    {
        $SmsStb = SmsStb::find($id);
        $SmsStb->delete();
        return redirect('sms_stbs')->with('message', 'SmsStb deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_stbs'] = SmsStb::find($id);
        return view('sms_stbs/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_stbs_id');

        $data = array(
          'Id' => Input::get('Id'),
          'STBNo' => Input::get('STBNo'),
          'MACADDRESS' => Input::get('MACADDRESS'),
          'Status' => Input::get('Status'),
          'BrandId' => Input::get('BrandId'),
          'UploadLogId' => Input::get('UploadLogId'),
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
          'DocExtension' => Input::get('DocExtension'),
          'CHIPID' => Input::get('CHIPID'),
          'Checkcode' => Input::get('Checkcode'),
          'Authcode' => Input::get('Authcode'),
          'PONumber' => Input::get('PONumber'),
          'PODate' => Input::get('PODate'),
          'InvNumber' => Input::get('InvNumber'),
          'InvDate' => Input::get('InvDate'),
          'NSTVSTBTrackNo' => Input::get('NSTVSTBTrackNo'),
        );
        SmsStb::where('id', '=', $id)->update($data);
        return redirect('sms_stbs')->with('message', 'SmsStb Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsStb = SmsStb::find($id);
        $SmsStb->status = !$SmsStb->status;
        $SmsStb->save();
        return redirect('sms_stbs')->with('message', 'Change SmsStb status successfully');
    }

    public function view($id)
    {
        $data['SmsStb'] = SmsStb::find($id);
        return view('sms_stbs/view', $data);
    }

    // Add other methods here...
}
