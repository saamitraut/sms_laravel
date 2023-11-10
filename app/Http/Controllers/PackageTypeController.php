<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\PackageType as PackageType;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class PackageTypeController extends Controller {

    public function index(Request $request)
    {
        $data['package_types'] = PackageType::all();
        $data['package_types'] = PackageType::paginate($request->get('pagination_limit', 5));
        $data['columnNames'] = ['name'];
        return view('package_types/index', $data);
    }

    public function add()
    {
        return view('package_types/add');
    }

    public function addPost()
    {
        $PackageType_data = array(
             'name' => Input::get('name'),
        );
        $PackageType_id = PackageType::insert($PackageType_data);
        return redirect('package_types')->with('message', 'PackageType successfully added');
    }

    public function delete($id)
    {
        $PackageType = PackageType::find($id);
        $PackageType->delete();
        return redirect('package_types')->with('message', 'PackageType deleted successfully.');
    }

    public function edit($id)
    {
        $data['package_types'] = PackageType::find($id);
        return view('package_types/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('package_types_id');

        $data = array(
          'name' => Input::get('name'),
        );
        PackageType::where('id', '=', $id)->update($data);
        return redirect('package_types')->with('message', 'PackageType Updated successfully');
    }

    public function changeStatus($id)
    {
        $PackageType = PackageType::find($id);
        $PackageType->status = !$PackageType->status;
        $PackageType->save();
        return redirect('package_types')->with('message', 'Change PackageType status successfully');
    }

    public function view($id)
    {
        $data['PackageType'] = PackageType::find($id);
        return view('package_types/view', $data);
    }

    // Add other methods here...
}
