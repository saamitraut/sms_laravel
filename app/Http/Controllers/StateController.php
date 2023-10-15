<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\State as State;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class StateController extends Controller {

    public function index(Request $request)
    {
        $data['states'] = State::all();
        $data['states'] = State::paginate($request->get('pagination_limit', 5));
        $data['columnNames'] = ['name'];
        return view('states/index', $data);
    }

    public function add()
    {
        return view('states/add');
    }

    public function addPost()
    {
        $State_data = array(
             'name' => Input::get('name'),
        );
        $State_id = State::insert($State_data);
        return redirect('states')->with('message', 'State successfully added');
    }

    public function delete($id)
    {
        $State = State::find($id);
        $State->delete();
        return redirect('states')->with('message', 'State deleted successfully.');
    }

    public function edit($id)
    {
        $data['states'] = State::find($id);
        return view('states/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('states_id');

        $data = array(
          'name' => Input::get('name'),
        );
        State::where('id', '=', $id)->update($data);
        return redirect('states')->with('message', 'State Updated successfully');
    }

    public function changeStatus($id)
    {
        $State = State::find($id);
        $State->status = !$State->status;
        $State->save();
        return redirect('states')->with('message', 'Change State status successfully');
    }

    public function view($id)
    {
        $data['State'] = State::find($id);
        return view('states/view', $data);
    }

    // Add other methods here...
}
