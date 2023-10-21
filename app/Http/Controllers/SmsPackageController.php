<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\SmsPackage as SmsPackage;
use App\Models\SmsBroadcaster as SmsBroadcaster;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class SmsPackageController extends Controller {

    public function index(Request $request)
    {
        $data['sms_package'] = SmsPackage::paginate($request->get('pagination_limit', 5));
        $data['broadcasters'] = SmsBroadcaster::all();
		
        // $package=SmsPackage::find(1);
		// dd($package->broadcaster);
		
		$data['columnNames'] = ['Id','PackageName','CasCode','Price','Price2','BillingCycle','StartDate','EndDate','Status','Description','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark','PackageType','CasCodeGospel','IsPrepaid','CasCodeTelelynx','BranchId','DASType','CasCodeNSTV','CasCodeKingvon','CasCodeCatVision','CasCodeBCas'];
        return view('sms_package/index', $data);
    }

    public function add()
    {
        return view('sms_package/add');
    }

    public function addPost()
    {
        $SmsPackage_data = array(
             'Id' => Input::get('Id'),
             'PackageName' => Input::get('PackageName'),
             'CasCode' => Input::get('CasCode'),
             'Price' => Input::get('Price'),
             'Price2' => Input::get('Price2'),
             'BillingCycle' => Input::get('BillingCycle'),
             'StartDate' => Input::get('StartDate'),
             'EndDate' => Input::get('EndDate'),
             'Status' => Input::get('Status'),
             'Description' => Input::get('Description'),
             'CreatedOn' => Input::get('CreatedOn'),
             'CreatedBy' => Input::get('CreatedBy'),
             'UpdatedOn' => Input::get('UpdatedOn'),
             'UpdatedBy' => Input::get('UpdatedBy'),
             'Deleted' => Input::get('Deleted'),
             'Remark' => Input::get('Remark'),
             'PackageType' => Input::get('PackageType'),
             'CasCodeGospel' => Input::get('CasCodeGospel'),
             'IsPrepaid' => Input::get('IsPrepaid'),
             'CasCodeTelelynx' => Input::get('CasCodeTelelynx'),
             'BranchId' => Input::get('BranchId'),
             'DASType' => Input::get('DASType'),
             'CasCodeNSTV' => Input::get('CasCodeNSTV'),
             'CasCodeKingvon' => Input::get('CasCodeKingvon'),
             'CasCodeCatVision' => Input::get('CasCodeCatVision'),
             'CasCodeBCas' => Input::get('CasCodeBCas'),
			 'broadcaster_id' => Input::get('broadcaster_id'),
        );
        $SmsPackage_id = SmsPackage::insert($SmsPackage_data);
        
		return redirect('sms_package')->with('message', 'SmsPackage successfully added');
    }

    public function delete($id)
    {
        $SmsPackage = SmsPackage::find($id);
        $SmsPackage->delete();
        return redirect('sms_package')->with('message', 'SmsPackage deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_package'] = SmsPackage::find($id);
        return view('sms_package/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_package_id');

        $data = array(
          'PackageName' => Input::get('PackageName'),
          'CasCode' => Input::get('CasCode'),
          'Price' => Input::get('Price'),
          'Price2' => Input::get('Price2'),
          'BillingCycle' => Input::get('BillingCycle'),
          'StartDate' => Input::get('StartDate'),
          'EndDate' => Input::get('EndDate'),
          'Status' => Input::get('Status'),
          'Description' => Input::get('Description'),
          'CreatedOn' => Input::get('CreatedOn'),
          'CreatedBy' => Input::get('CreatedBy'),
          'UpdatedOn' => Input::get('UpdatedOn'),
          'UpdatedBy' => Input::get('UpdatedBy'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
          'PackageType' => Input::get('PackageType'),
          'CasCodeGospel' => Input::get('CasCodeGospel'),
          'IsPrepaid' => Input::get('IsPrepaid'),
          'CasCodeTelelynx' => Input::get('CasCodeTelelynx'),
          'BranchId' => Input::get('BranchId'),
          'DASType' => Input::get('DASType'),
          'CasCodeNSTV' => Input::get('CasCodeNSTV'),
          'CasCodeKingvon' => Input::get('CasCodeKingvon'),
          'CasCodeCatVision' => Input::get('CasCodeCatVision'),
          'CasCodeBCas' => Input::get('CasCodeBCas'),
          'broadcaster_id' => Input::get('broadcaster_id'),
        );
        // dd($data);
		SmsPackage::where('Id', '=', $id)->update($data);
        return redirect('sms_package')->with('message', 'SmsPackage Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsPackage = SmsPackage::find($id);
        $SmsPackage->status = !$SmsPackage->status;
        $SmsPackage->save();
        return redirect('sms_package')->with('message', 'Change SmsPackage status successfully');
    }

    public function view($id)
    {
        $data['SmsPackage'] = SmsPackage::find($id);
        return view('sms_package/view', $data);
    }

    // Add other methods here...
}
