<?php 
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\SmsSubscriber as SmsSubscriber;
use App\Models\SMSOPERATOR as SMSOPERATOR;
use App\Models\SMSSOCIETYMASTER as SMSSOCIETYMASTER;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;
use Illuminate\Support\Carbon;
class SmsSubscriberController extends Controller {

    public function index(Request $request)
    {
        
		$sms_subscribers = SmsSubscriber::all();
		
		$carbon = Carbon::now();
		$data['date'] = $carbon->format('M d Y h:iA');	
		
		$data['sms_subscribers'] = SmsSubscriber::all();
        $data['sms_subscribers'] = SmsSubscriber::paginate($request->get('pagination_limit', 5));
		$data['SMS_OPERATOR'] = SMSOPERATOR::list();
		$data['SMS_SOCIETY_MASTER'] = SMSSOCIETYMASTER::list();
		// $data['SMS_SUBSCRIBERS'] = SmsSubscriber::list();
        $data['columnNames'] = ['Id','FormNo','CustomerId','OperatorId','SocietyId','MobileNo','Status','ProspectId','PCustomerId','OpTobeBilled','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark','sms_id'];
        return view('sms_subscribers/index', $data);
    }

    public function add()
    {
        return view('sms_subscribers/add');
    }

    public function addPost()
    {
        $SmsSubscriber_data = array(
             'Id' => Input::get('Id'),
             'FormNo' => Input::get('FormNo'),
             'CustomerId' => Input::get('CustomerId'),
             'OperatorId' => Input::get('OperatorId'),
             'SocietyId' => Input::get('SocietyId'),
             'MobileNo' => Input::get('MobileNo'),
             'Status' => Input::get('Status'),
             'ProspectId' => Input::get('ProspectId'),
             'PCustomerId' => Input::get('PCustomerId'),
             'OpTobeBilled' => Input::get('OpTobeBilled'),
             'CreatedOn' => Input::get('CreatedOn'),
             'CreatedBy' => Input::get('CreatedBy'),
             'UpdatedOn' => Input::get('UpdatedOn'),
             'UpdatedBy' => Input::get('UpdatedBy'),
             'Deleted' => Input::get('Deleted'),
             'Remark' => Input::get('Remark'),
             'sms_id' => Input::get('sms_id'),
        );
        $SmsSubscriber_id = SmsSubscriber::insert($SmsSubscriber_data);
        return redirect('sms_subscribers')->with('message', 'SmsSubscriber successfully added');
    }

    public function delete($id)
    {
        $SmsSubscriber = SmsSubscriber::find($id);
        $SmsSubscriber->delete();
        return redirect('sms_subscribers')->with('message', 'SmsSubscriber deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_subscribers'] = SmsSubscriber::find($id);
        return view('sms_subscribers/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_subscribers_id');

        $data = array(
          'Id' => Input::get('Id'),
          'FormNo' => Input::get('FormNo'),
          'CustomerId' => Input::get('CustomerId'),
          'OperatorId' => Input::get('OperatorId'),
          'SocietyId' => Input::get('SocietyId'),
          'MobileNo' => Input::get('MobileNo'),
          'Status' => Input::get('Status'),
          'ProspectId' => Input::get('ProspectId'),
          'PCustomerId' => Input::get('PCustomerId'),
          'OpTobeBilled' => Input::get('OpTobeBilled'),
          'CreatedOn' => Input::get('CreatedOn'),
          'CreatedBy' => Input::get('CreatedBy'),
          'UpdatedOn' => Input::get('UpdatedOn'),
          'UpdatedBy' => Input::get('UpdatedBy'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
          'sms_id' => Input::get('sms_id'),
        );
        SmsSubscriber::where('id', '=', $id)->update($data);
        return redirect('sms_subscribers')->with('message', 'SmsSubscriber Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsSubscriber = SmsSubscriber::find($id);
        $SmsSubscriber->status = !$SmsSubscriber->status;
        $SmsSubscriber->save();
        return redirect('sms_subscribers')->with('message', 'Change SmsSubscriber status successfully');
    }

    public function view($id)
    {
        $data['SmsSubscriber'] = SmsSubscriber::find($id);
        return view('sms_subscribers/view', $data);
    }

    // Add other methods here...
}
