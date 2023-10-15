<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\SmsSubscribersDetail as SmsSubscribersDetail;
use App\Models\SmsSubscriber as SmsSubscriber;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class SmsSubscribersDetailController extends Controller {

    public function index(Request $request)
    {
        $data['sms_subscribers_details'] = SmsSubscribersDetail::paginate($request->get('pagination_limit', 5));
		$data['columnNames'] = ['Id','SubscriberId','FName','LName','Mname','FlatNo','FloorNo','Wing','Building','Address','Gender','Verify','Zipcode','Email','Phone','DOB','OCCUPATION','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark','photoprooftype','photoprooffilename','addressprooftype','addressprooffilename','BillingAddress'];
        
		return view('sms_subscribers_details/index', $data);
    }

    public function add()
    {
        return view('sms_subscribers_details/add');
    }

    public function addPost()
    {
        $SmsSubscribersDetail_data = array(
             'Id' => Input::get('Id'),
             'SubscriberId' => Input::get('SubscriberId'),
             'FName' => Input::get('FName'),
             'LName' => Input::get('LName'),
             'Mname' => Input::get('Mname'),
             'FlatNo' => Input::get('FlatNo'),
             'FloorNo' => Input::get('FloorNo'),
             'Wing' => Input::get('Wing'),
             'Building' => Input::get('Building'),
             'Address' => Input::get('Address'),
             'Gender' => Input::get('Gender'),
             'Verify' => Input::get('Verify'),
             'Zipcode' => Input::get('Zipcode'),
             'Email' => Input::get('Email'),
             'Phone' => Input::get('Phone'),
             'DOB' => Input::get('DOB'),
             'OCCUPATION' => Input::get('OCCUPATION'),
             'CreatedOn' => Input::get('CreatedOn'),
             'CreatedBy' => Input::get('CreatedBy'),
             'UpdatedOn' => Input::get('UpdatedOn'),
             'UpdatedBy' => Input::get('UpdatedBy'),
             'Deleted' => Input::get('Deleted'),
             'Remark' => Input::get('Remark'),
             'photoprooftype' => Input::get('photoprooftype'),
             'photoprooffilename' => Input::get('photoprooffilename'),
             'addressprooftype' => Input::get('addressprooftype'),
             'addressprooffilename' => Input::get('addressprooffilename'),
             'BillingAddress' => Input::get('BillingAddress'),
        );
        $SmsSubscribersDetail_id = SmsSubscribersDetail::insert($SmsSubscribersDetail_data);
        return redirect('sms_subscribers_details')->with('message', 'SmsSubscribersDetail successfully added');
    }

    public function delete($id)
    {
        $SmsSubscribersDetail = SmsSubscribersDetail::find($id);
        $SmsSubscribersDetail->delete();
        return redirect('sms_subscribers_details')->with('message', 'SmsSubscribersDetail deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_subscribers_details'] = SmsSubscribersDetail::find($id);
        return view('sms_subscribers_details/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_subscribers_details_id');

        $data = array(
          'Id' => Input::get('Id'),
          'SubscriberId' => Input::get('SubscriberId'),
          'FName' => Input::get('FName'),
          'LName' => Input::get('LName'),
          'Mname' => Input::get('Mname'),
          'FlatNo' => Input::get('FlatNo'),
          'FloorNo' => Input::get('FloorNo'),
          'Wing' => Input::get('Wing'),
          'Building' => Input::get('Building'),
          'Address' => Input::get('Address'),
          'Gender' => Input::get('Gender'),
          'Verify' => Input::get('Verify'),
          'Zipcode' => Input::get('Zipcode'),
          'Email' => Input::get('Email'),
          'Phone' => Input::get('Phone'),
          'DOB' => Input::get('DOB'),
          'OCCUPATION' => Input::get('OCCUPATION'),
          'CreatedOn' => Input::get('CreatedOn'),
          'CreatedBy' => Input::get('CreatedBy'),
          'UpdatedOn' => Input::get('UpdatedOn'),
          'UpdatedBy' => Input::get('UpdatedBy'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
          'photoprooftype' => Input::get('photoprooftype'),
          'photoprooffilename' => Input::get('photoprooffilename'),
          'addressprooftype' => Input::get('addressprooftype'),
          'addressprooffilename' => Input::get('addressprooffilename'),
          'BillingAddress' => Input::get('BillingAddress'),
        );
        SmsSubscribersDetail::where('id', '=', $id)->update($data);
        return redirect('sms_subscribers_details')->with('message', 'SmsSubscribersDetail Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsSubscribersDetail = SmsSubscribersDetail::find($id);
        $SmsSubscribersDetail->status = !$SmsSubscribersDetail->status;
        $SmsSubscribersDetail->save();
        return redirect('sms_subscribers_details')->with('message', 'Change SmsSubscribersDetail status successfully');
    }

    public function view($id)
    {
        $data['SmsSubscribersDetail'] = SmsSubscribersDetail::find($id);
        return view('sms_subscribers_details/view', $data);
    }

    // Add other methods here...
}
