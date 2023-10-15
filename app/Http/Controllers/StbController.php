<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Stb as Stb;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;
use App\Models\SmsSubscriber;
use App\Models\SMS_SUBSCRIBERACCOUNTS;
use App\Models\SMS_PAIRING;
use App\Models\SMS_STBS;
use App\Models\SMS_SMARTCARDS;
use App\Models\PRP_ACCOUNTTRANSACTION;

class StbController extends Controller {

    public function index(Request $request)
    {
        $data['stbs'] = Stb::all();
        $data['stbs'] = Stb::paginate($request->get('pagination_limit', 5));
        $data['columnNames'] = ['STBNo','SmartcardNo','amount','DeactivationDate','accountid'];
        return view('stbs/index', $data);
    }

    public function add()
    {
        return view('stbs/add');
    }

    public function addPost()
    {
        $Stb_data = array(
             'STBNo' => Input::get('STBNo'),
             'SmartcardNo' => Input::get('SmartcardNo'),
             'amount' => Input::get('amount'),
             'DeactivationDate' => Input::get('DeactivationDate'),
             'accountid' => Input::get('accountid'),
        );
        $Stb_id = Stb::insert($Stb_data);
        return redirect('stbs')->with('message', 'Stb successfully added');
    }

    public function delete($id)
    {
        $Stb = Stb::find($id);
        $Stb->delete();
        return redirect('stbs')->with('message', 'Stb deleted successfully.');
    }

    public function edit($id)
    {
        $data['stbs'] = Stb::find($id);
        return view('stbs/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('stbs_id');

        $data = array(
          'STBNo' => Input::get('STBNo'),
          'SmartcardNo' => Input::get('SmartcardNo'),
          'amount' => Input::get('amount'),
          'DeactivationDate' => Input::get('DeactivationDate'),
          'accountid' => Input::get('accountid'),
        );
        Stb::where('id', '=', $id)->update($data);
        return redirect('stbs')->with('message', 'Stb Updated successfully');
    }

    public function changeStatus($id)
    {
        $Stb = Stb::find($id);
        $Stb->status = !$Stb->status;
        $Stb->save();
        return redirect('stbs')->with('message', 'Change Stb status successfully');
    }

    public function view($id)
    {
        $data['Stb'] = Stb::find($id);
        return view('stbs/view', $data);
    }

    // Add other methods here...
}
