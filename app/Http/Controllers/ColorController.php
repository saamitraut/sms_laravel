<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Color as Color;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class ColorController extends Controller {

    public function index(Request $request)
    {
        $data['colors'] = Color::all();
        $data['colors'] = Color::paginate($request->get('pagination_limit', 5));
        $data['columnNames'] = ['name'];
        return view('colors/index', $data);
    }

    public function add()
    {
        return view('colors/add');
    }

    public function addPost()
    {
        $Color_data = array(
             'name' => Input::get('name'),
        );
        $Color_id = Color::insert($Color_data);
        return redirect('colors')->with('message', 'Color successfully added');
    }

    public function delete($id)
    {
        $Color = Color::find($id);
        $Color->delete();
        return redirect('colors')->with('message', 'Color deleted successfully.');
    }

    public function edit($id)
    {
        $data['colors'] = Color::find($id);
        return view('colors/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('colors_id');

        $data = array(
          'name' => Input::get('name'),
        );
        Color::where('id', '=', $id)->update($data);
        return redirect('colors')->with('message', 'Color Updated successfully');
    }

    public function changeStatus($id)
    {
        $Color = Color::find($id);
        $Color->status = !$Color->status;
        $Color->save();
        return redirect('colors')->with('message', 'Change Color status successfully');
    }

    public function view($id)
    {
        $data['Color'] = Color::find($id);
        return view('colors/view', $data);
    }

    // Add other methods here...
}
