<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\SmsSubscriberaccount as SmsSubscriberaccount;
use App\Models\SmsSubscriber as SMSSUBSCRIBERS;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class SmsSubscriberaccountController extends Controller {

    public function index(Request $request)
    {
        $data['sms_subscriberaccounts'] = SmsSubscriberaccount::all();
        $data['sms_subscriberaccounts'] = SmsSubscriberaccount::paginate($request->get('pagination_limit', 5));
    $data['SMS_SUBSCRIBERS'] = SMSSUBSCRIBERS::list();
        $data['columnNames'] = ['Id','SubscriberId','ConnectionId','IsPrimary','ApplicableRate','TimeShift','PairingId','BillingSMonth','ActivationDate','DeactivationDate','ExpiryDate','Description','ActionTaken','Status','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark','sms_id','isblacklisted','blacklistfilename','PrePaidFlag','Acct_Type'];
        return view('sms_subscriberaccounts/index', $data);
    }

    public function add()
    {
        return view('sms_subscriberaccounts/add');
    }

    public function addPost()
    {
        $SmsSubscriberaccount_data = array(
             'Id' => Input::get('Id'),
             'SubscriberId' => Input::get('SubscriberId'),
             'ConnectionId' => Input::get('ConnectionId'),
             'IsPrimary' => Input::get('IsPrimary'),
             'ApplicableRate' => Input::get('ApplicableRate'),
             'TimeShift' => Input::get('TimeShift'),
             'PairingId' => Input::get('PairingId'),
             'BillingSMonth' => Input::get('BillingSMonth'),
             'ActivationDate' => Input::get('ActivationDate'),
             'DeactivationDate' => Input::get('DeactivationDate'),
             'ExpiryDate' => Input::get('ExpiryDate'),
             'Description' => Input::get('Description'),
             'ActionTaken' => Input::get('ActionTaken'),
             'Status' => Input::get('Status'),
             'CreatedOn' => Input::get('CreatedOn'),
             'CreatedBy' => Input::get('CreatedBy'),
             'UpdatedOn' => Input::get('UpdatedOn'),
             'UpdatedBy' => Input::get('UpdatedBy'),
             'Deleted' => Input::get('Deleted'),
             'Remark' => Input::get('Remark'),
             'sms_id' => Input::get('sms_id'),
             'isblacklisted' => Input::get('isblacklisted'),
             'blacklistfilename' => Input::get('blacklistfilename'),
             'PrePaidFlag' => Input::get('PrePaidFlag'),
             'Acct_Type' => Input::get('Acct_Type'),
        );
        $SmsSubscriberaccount_id = SmsSubscriberaccount::insert($SmsSubscriberaccount_data);
        return redirect('sms_subscriberaccounts')->with('message', 'SmsSubscriberaccount successfully added');
    }

    public function delete($id)
    {
        $SmsSubscriberaccount = SmsSubscriberaccount::find($id);
        $SmsSubscriberaccount->delete();
        return redirect('sms_subscriberaccounts')->with('message', 'SmsSubscriberaccount deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_subscriberaccounts'] = SmsSubscriberaccount::find($id);
        return view('sms_subscriberaccounts/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_subscriberaccounts_id');

        $data = array(
          'Id' => Input::get('Id'),
          'SubscriberId' => Input::get('SubscriberId'),
          'ConnectionId' => Input::get('ConnectionId'),
          'IsPrimary' => Input::get('IsPrimary'),
          'ApplicableRate' => Input::get('ApplicableRate'),
          'TimeShift' => Input::get('TimeShift'),
          'PairingId' => Input::get('PairingId'),
          'BillingSMonth' => Input::get('BillingSMonth'),
          'ActivationDate' => Input::get('ActivationDate'),
          'DeactivationDate' => Input::get('DeactivationDate'),
          'ExpiryDate' => Input::get('ExpiryDate'),
          'Description' => Input::get('Description'),
          'ActionTaken' => Input::get('ActionTaken'),
          'Status' => Input::get('Status'),
          'CreatedOn' => Input::get('CreatedOn'),
          'CreatedBy' => Input::get('CreatedBy'),
          'UpdatedOn' => Input::get('UpdatedOn'),
          'UpdatedBy' => Input::get('UpdatedBy'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
          'sms_id' => Input::get('sms_id'),
          'isblacklisted' => Input::get('isblacklisted'),
          'blacklistfilename' => Input::get('blacklistfilename'),
          'PrePaidFlag' => Input::get('PrePaidFlag'),
          'Acct_Type' => Input::get('Acct_Type'),
        );
        SmsSubscriberaccount::where('id', '=', $id)->update($data);
        return redirect('sms_subscriberaccounts')->with('message', 'SmsSubscriberaccount Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsSubscriberaccount = SmsSubscriberaccount::find($id);
        $SmsSubscriberaccount->status = !$SmsSubscriberaccount->status;
        $SmsSubscriberaccount->save();
        return redirect('sms_subscriberaccounts')->with('message', 'Change SmsSubscriberaccount status successfully');
    }

    public function view($id)
    {
        $data['SmsSubscriberaccount'] = SmsSubscriberaccount::find($id);
        return view('sms_subscriberaccounts/view', $data);
    }

    // Add other methods here...
}
