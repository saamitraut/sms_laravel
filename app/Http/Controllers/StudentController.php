<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Student as Student;
use App\Models\Color as Color;
use App\Models\State as State;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class StudentController extends Controller {

    public function index(Request $request)
    {
        $data['students'] = Student::all();
        $data['students'] = Student::paginate($request->get('pagination_limit', 5));
    $data['colors'] = Color::list();
    $data['states'] = State::list();
        $data['columnNames'] = ['name','state_id','color_id'];
        return view('students/index', $data);
    }

    public function add()
    {
        return view('students/add');
    }

    public function addPost()
    {
        $Student_data = array(
             'name' => Input::get('name'),
             'state_id' => Input::get('state_id'),
             'color_id' => Input::get('color_id'),
        );
        $Student_id = Student::insert($Student_data);
        return redirect('students')->with('message', 'Student successfully added');
    }

    public function delete($id)
    {
        $Student = Student::find($id);
        $Student->delete();
        return redirect('students')->with('message', 'Student deleted successfully.');
    }

    public function edit($id)
    {
        $data['students'] = Student::find($id);
        return view('students/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('students_id');

        $data = array(
          'name' => Input::get('name'),
          'state_id' => Input::get('state_id'),
          'color_id' => Input::get('color_id'),
        );
        Student::where('id', '=', $id)->update($data);
        return redirect('students')->with('message', 'Student Updated successfully');
    }

    public function changeStatus($id)
    {
        $Student = Student::find($id);
        $Student->status = !$Student->status;
        $Student->save();
        return redirect('students')->with('message', 'Change Student status successfully');
    }

    public function view($id)
    {
        $data['Student'] = Student::find($id);
        return view('students/view', $data);
    }

    // Add other methods here...
}
