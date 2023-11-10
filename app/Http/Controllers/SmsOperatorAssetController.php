<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\SmsOperatorAsset as SmsOperatorAsset;
use App\Models\PRPBOUQUE as PRPBOUQUE;
use App\Models\PRPDEMOBOUQUE as PRPDEMOBOUQUE;
use App\Models\SMSCHANNEL as SMSCHANNEL;
use App\Models\SMSPACKAGE as SMSPACKAGE;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class SmsOperatorAssetController extends Controller {

    public function index(Request $request)
    {
        $data['sms_operator_assets'] = SmsOperatorAsset::all();
        $data['sms_operator_assets'] = SmsOperatorAsset::paginate($request->get('pagination_limit', 5));
    $data['PRP_BOUQUE'] = PRPBOUQUE::list();
    $data['PRP_DEMOBOUQUE'] = PRPDEMOBOUQUE::list();
    $data['SMS_CHANNEL'] = SMSCHANNEL::list();
    $data['SMS_PACKAGE'] = SMSPACKAGE::list();
        $data['columnNames'] = ['Id','OperatorId','PackageId','AlacarteId','BouqueId','DemoBouqueId','Description','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark'];
        return view('sms_operator_assets/index', $data);
    }

    public function add()
    {
        return view('sms_operator_assets/add');
    }

    public function addPost()
    {
        $SmsOperatorAsset_data = array(
             'Id' => Input::get('Id'),
             'OperatorId' => Input::get('OperatorId'),
             'PackageId' => Input::get('PackageId'),
             'AlacarteId' => Input::get('AlacarteId'),
             'BouqueId' => Input::get('BouqueId'),
             'DemoBouqueId' => Input::get('DemoBouqueId'),
             'Description' => Input::get('Description'),
             'CreatedOn' => Input::get('CreatedOn'),
             'CreatedBy' => Input::get('CreatedBy'),
             'UpdatedOn' => Input::get('UpdatedOn'),
             'UpdatedBy' => Input::get('UpdatedBy'),
             'Deleted' => Input::get('Deleted'),
             'Remark' => Input::get('Remark'),
        );
        $SmsOperatorAsset_id = SmsOperatorAsset::insert($SmsOperatorAsset_data);
        return redirect('sms_operator_assets')->with('message', 'SmsOperatorAsset successfully added');
    }

    public function delete($id)
    {
        $SmsOperatorAsset = SmsOperatorAsset::find($id);
        $SmsOperatorAsset->delete();
        return redirect('sms_operator_assets')->with('message', 'SmsOperatorAsset deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_operator_assets'] = SmsOperatorAsset::find($id);
        return view('sms_operator_assets/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_operator_assets_id');

        $data = array(
          'Id' => Input::get('Id'),
          'OperatorId' => Input::get('OperatorId'),
          'PackageId' => Input::get('PackageId'),
          'AlacarteId' => Input::get('AlacarteId'),
          'BouqueId' => Input::get('BouqueId'),
          'DemoBouqueId' => Input::get('DemoBouqueId'),
          'Description' => Input::get('Description'),
          'CreatedOn' => Input::get('CreatedOn'),
          'CreatedBy' => Input::get('CreatedBy'),
          'UpdatedOn' => Input::get('UpdatedOn'),
          'UpdatedBy' => Input::get('UpdatedBy'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
        );
        SmsOperatorAsset::where('id', '=', $id)->update($data);
        return redirect('sms_operator_assets')->with('message', 'SmsOperatorAsset Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsOperatorAsset = SmsOperatorAsset::find($id);
        $SmsOperatorAsset->status = !$SmsOperatorAsset->status;
        $SmsOperatorAsset->save();
        return redirect('sms_operator_assets')->with('message', 'Change SmsOperatorAsset status successfully');
    }

    public function view($id)
    {
        $data['SmsOperatorAsset'] = SmsOperatorAsset::find($id);
        return view('sms_operator_assets/view', $data);
    }

    // Add other methods here...
}
