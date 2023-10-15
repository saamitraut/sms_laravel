<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\PrpBouqueAsset as PrpBouqueAsset;
use App\Models\PRPBOUQUE as PRPBOUQUE;
use App\Models\SMSCHANNEL as SMSCHANNEL;
use App\Models\SMSPACKAGE as SMSPACKAGE;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class PrpBouqueAssetController extends Controller {

    public function index(Request $request)
    {
        $data['prp_bouque_assets'] = PrpBouqueAsset::all();
        $data['prp_bouque_assets'] = PrpBouqueAsset::paginate($request->get('pagination_limit', 5));
    $data['PRP_BOUQUE'] = PRPBOUQUE::list();
    $data['SMS_CHANNEL'] = SMSCHANNEL::list();
    $data['SMS_PACKAGE'] = SMSPACKAGE::list();
        $data['columnNames'] = ['Id','BouqueId','PackageId','ChannelId','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark','RioCntType'];
        return view('prp_bouque_assets/index', $data);
    }

    public function add()
    {
        return view('prp_bouque_assets/add');
    }

    public function addPost()
    {
        $PrpBouqueAsset_data = array(
             'Id' => Input::get('Id'),
             'BouqueId' => Input::get('BouqueId'),
             'PackageId' => Input::get('PackageId'),
             'ChannelId' => Input::get('ChannelId'),
             'CreatedOn' => Input::get('CreatedOn'),
             'CreatedBy' => Input::get('CreatedBy'),
             'UpdatedOn' => Input::get('UpdatedOn'),
             'UpdatedBy' => Input::get('UpdatedBy'),
             'Deleted' => Input::get('Deleted'),
             'Remark' => Input::get('Remark'),
             'RioCntType' => Input::get('RioCntType'),
        );
        $PrpBouqueAsset_id = PrpBouqueAsset::insert($PrpBouqueAsset_data);
        return redirect('prp_bouque_assets')->with('message', 'PrpBouqueAsset successfully added');
    }

    public function delete($id)
    {
        $PrpBouqueAsset = PrpBouqueAsset::find($id);
        $PrpBouqueAsset->delete();
        return redirect('prp_bouque_assets')->with('message', 'PrpBouqueAsset deleted successfully.');
    }

    public function edit($id)
    {
        $data['prp_bouque_assets'] = PrpBouqueAsset::find($id);
        return view('prp_bouque_assets/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('prp_bouque_assets_id');

        $data = array(
          'Id' => Input::get('Id'),
          'BouqueId' => Input::get('BouqueId'),
          'PackageId' => Input::get('PackageId'),
          'ChannelId' => Input::get('ChannelId'),
          'CreatedOn' => Input::get('CreatedOn'),
          'CreatedBy' => Input::get('CreatedBy'),
          'UpdatedOn' => Input::get('UpdatedOn'),
          'UpdatedBy' => Input::get('UpdatedBy'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
          'RioCntType' => Input::get('RioCntType'),
        );
        PrpBouqueAsset::where('id', '=', $id)->update($data);
        return redirect('prp_bouque_assets')->with('message', 'PrpBouqueAsset Updated successfully');
    }

    public function changeStatus($id)
    {
        $PrpBouqueAsset = PrpBouqueAsset::find($id);
        $PrpBouqueAsset->status = !$PrpBouqueAsset->status;
        $PrpBouqueAsset->save();
        return redirect('prp_bouque_assets')->with('message', 'Change PrpBouqueAsset status successfully');
    }

    public function view($id)
    {
        $data['PrpBouqueAsset'] = PrpBouqueAsset::find($id);
        return view('prp_bouque_assets/view', $data);
    }

    // Add other methods here...
}
