<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\PrpAccounttransaction as PrpAccounttransaction;
//use App\Models\PRPACCOUNTTRANSACTION as PRPACCOUNTTRANSACTION;
use App\Models\PRPBOUQUE as PRPBOUQUE;
use App\Models\SmsSubscriberaccount as SMSSUBSCRIBERACCOUNTS;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class PrpAccounttransactionController extends Controller {

    public function index(Request $request)
    {
        $data['prp_accounttransaction'] = PrpAccounttransaction::all();
        $data['prp_accounttransaction'] = PrpAccounttransaction::paginate($request->get('pagination_limit', 5));
    $data['PRP_ACCOUNTTRANSACTION'] = PrpAccounttransaction::list();
    $data['PRP_BOUQUE'] = PRPBOUQUE::list();
    $data['SMS_SUBSCRIBERACCOUNTS'] = SMSSUBSCRIBERACCOUNTS::list();
        $data['columnNames'] = ['Id','AccountId','Rate','Amount','LCOSharing','NCFAmount','NCF_LCOSharing','BouqueId','Status','ActivationDate','DeactivationDate','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark','OperatorId','SessionFlag','CASStatus','IsAutoRenew'];
        return view('prp_accounttransaction/index', $data);
    }

    public function add()
    {
        return view('prp_accounttransaction/add');
    }

    public function addPost()
    {
        $PrpAccounttransaction_data = array(
             'Id' => Input::get('Id'),
             'AccountId' => Input::get('AccountId'),
             'Rate' => Input::get('Rate'),
             'Amount' => Input::get('Amount'),
             'LCOSharing' => Input::get('LCOSharing'),
             'NCFAmount' => Input::get('NCFAmount'),
             'NCF_LCOSharing' => Input::get('NCF_LCOSharing'),
             'BouqueId' => Input::get('BouqueId'),
             'Status' => Input::get('Status'),
             'ActivationDate' => Input::get('ActivationDate'),
             'DeactivationDate' => Input::get('DeactivationDate'),
             'CreatedOn' => Input::get('CreatedOn'),
             'CreatedBy' => Input::get('CreatedBy'),
             'UpdatedOn' => Input::get('UpdatedOn'),
             'UpdatedBy' => Input::get('UpdatedBy'),
             'Deleted' => Input::get('Deleted'),
             'Remark' => Input::get('Remark'),
             'OperatorId' => Input::get('OperatorId'),
             'SessionFlag' => Input::get('SessionFlag'),
             'CASStatus' => Input::get('CASStatus'),
             'IsAutoRenew' => Input::get('IsAutoRenew'),
        );
        $PrpAccounttransaction_id = PrpAccounttransaction::insert($PrpAccounttransaction_data);
        return redirect('prp_accounttransaction')->with('message', 'PrpAccounttransaction successfully added');
    }

    public function delete($id)
    {
        $PrpAccounttransaction = PrpAccounttransaction::find($id);
        $PrpAccounttransaction->delete();
        return redirect('prp_accounttransaction')->with('message', 'PrpAccounttransaction deleted successfully.');
    }

    public function edit($id)
    {
        $data['prp_accounttransaction'] = PrpAccounttransaction::find($id);
        return view('prp_accounttransaction/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('prp_accounttransaction_id');

        $data = array(
          'Id' => Input::get('Id'),
          'AccountId' => Input::get('AccountId'),
          'Rate' => Input::get('Rate'),
          'Amount' => Input::get('Amount'),
          'LCOSharing' => Input::get('LCOSharing'),
          'NCFAmount' => Input::get('NCFAmount'),
          'NCF_LCOSharing' => Input::get('NCF_LCOSharing'),
          'BouqueId' => Input::get('BouqueId'),
          'Status' => Input::get('Status'),
          'ActivationDate' => Input::get('ActivationDate'),
          'DeactivationDate' => Input::get('DeactivationDate'),
          'CreatedOn' => Input::get('CreatedOn'),
          'CreatedBy' => Input::get('CreatedBy'),
          'UpdatedOn' => Input::get('UpdatedOn'),
          'UpdatedBy' => Input::get('UpdatedBy'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
          'OperatorId' => Input::get('OperatorId'),
          'SessionFlag' => Input::get('SessionFlag'),
          'CASStatus' => Input::get('CASStatus'),
          'IsAutoRenew' => Input::get('IsAutoRenew'),
        );
        PrpAccounttransaction::where('id', '=', $id)->update($data);
        return redirect('prp_accounttransaction')->with('message', 'PrpAccounttransaction Updated successfully');
    }

    public function changeStatus($id)
    {
        $PrpAccounttransaction = PrpAccounttransaction::find($id);
        $PrpAccounttransaction->status = !$PrpAccounttransaction->status;
        $PrpAccounttransaction->save();
        return redirect('prp_accounttransaction')->with('message', 'Change PrpAccounttransaction status successfully');
    }

    public function view($id)
    {
        $data['PrpAccounttransaction'] = PrpAccounttransaction::find($id);
        return view('prp_accounttransaction/view', $data);
    }

    // Add other methods here...
}
