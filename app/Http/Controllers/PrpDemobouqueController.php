<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\PrpDemobouque as PrpDemobouque;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class PrpDemobouqueController extends Controller {

    public function index(Request $request)
    {
        $data['prp_demobouque'] = PrpDemobouque::all();
        $data['prp_demobouque'] = PrpDemobouque::paginate($request->get('pagination_limit', 5));
        $data['columnNames'] = ['Id','BouqueCode','BouqueName','Duration','BType','Status','Description','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark'];
        return view('prp_demobouque/index', $data);
    }

    public function add()
    {
        return view('prp_demobouque/add');
    }

    public function addPost()
    {
        $PrpDemobouque_data = array(
             'Id' => Input::get('Id'),
             'BouqueCode' => Input::get('BouqueCode'),
             'BouqueName' => Input::get('BouqueName'),
             'Duration' => Input::get('Duration'),
             'BType' => Input::get('BType'),
             'Status' => Input::get('Status'),
             'Description' => Input::get('Description'),
             'CreatedOn' => Input::get('CreatedOn'),
             'CreatedBy' => Input::get('CreatedBy'),
             'UpdatedOn' => Input::get('UpdatedOn'),
             'UpdatedBy' => Input::get('UpdatedBy'),
             'Deleted' => Input::get('Deleted'),
             'Remark' => Input::get('Remark'),
        );
        $PrpDemobouque_id = PrpDemobouque::insert($PrpDemobouque_data);
        return redirect('prp_demobouque')->with('message', 'PrpDemobouque successfully added');
    }

    public function delete($id)
    {
        $PrpDemobouque = PrpDemobouque::find($id);
        $PrpDemobouque->delete();
        return redirect('prp_demobouque')->with('message', 'PrpDemobouque deleted successfully.');
    }

    public function edit($id)
    {
        $data['prp_demobouque'] = PrpDemobouque::find($id);
        return view('prp_demobouque/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('prp_demobouque_id');

        $data = array(
          'Id' => Input::get('Id'),
          'BouqueCode' => Input::get('BouqueCode'),
          'BouqueName' => Input::get('BouqueName'),
          'Duration' => Input::get('Duration'),
          'BType' => Input::get('BType'),
          'Status' => Input::get('Status'),
          'Description' => Input::get('Description'),
          'CreatedOn' => Input::get('CreatedOn'),
          'CreatedBy' => Input::get('CreatedBy'),
          'UpdatedOn' => Input::get('UpdatedOn'),
          'UpdatedBy' => Input::get('UpdatedBy'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
        );
        PrpDemobouque::where('id', '=', $id)->update($data);
        return redirect('prp_demobouque')->with('message', 'PrpDemobouque Updated successfully');
    }

    public function changeStatus($id)
    {
        $PrpDemobouque = PrpDemobouque::find($id);
        $PrpDemobouque->status = !$PrpDemobouque->status;
        $PrpDemobouque->save();
        return redirect('prp_demobouque')->with('message', 'Change PrpDemobouque status successfully');
    }

    public function view($id)
    {
        $data['PrpDemobouque'] = PrpDemobouque::find($id);
        return view('prp_demobouque/view', $data);
    }

    // Add other methods here...
}
