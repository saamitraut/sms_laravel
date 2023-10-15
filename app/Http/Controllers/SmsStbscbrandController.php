<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\SmsStbscbrand as SmsStbscbrand;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class SmsStbscbrandController extends Controller {

    public function index(Request $request)
    {
        $data['sms_stbscbrand'] = SmsStbscbrand::all();
        $data['sms_stbscbrand'] = SmsStbscbrand::paginate($request->get('pagination_limit', 5));
        $data['columnNames'] = ['Id','BrandTitle','Price','BoxType','TimeShift','Maxlength','SignificantDigits','CharAllowed','FORSMARTCARD','Status','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark','sms_id','CASTYPEID'];
        return view('sms_stbscbrand/index', $data);
    }

    public function add()
    {
        return view('sms_stbscbrand/add');
    }

    public function addPost()
    {
        $SmsStbscbrand_data = array(
             'Id' => Input::get('Id'),
             'BrandTitle' => Input::get('BrandTitle'),
             'Price' => Input::get('Price'),
             'BoxType' => Input::get('BoxType'),
             'TimeShift' => Input::get('TimeShift'),
             'Maxlength' => Input::get('Maxlength'),
             'SignificantDigits' => Input::get('SignificantDigits'),
             'CharAllowed' => Input::get('CharAllowed'),
             'FORSMARTCARD' => Input::get('FORSMARTCARD'),
             'Status' => Input::get('Status'),
             'CreatedOn' => Input::get('CreatedOn'),
             'CreatedBy' => Input::get('CreatedBy'),
             'UpdatedOn' => Input::get('UpdatedOn'),
             'UpdatedBy' => Input::get('UpdatedBy'),
             'Deleted' => Input::get('Deleted'),
             'Remark' => Input::get('Remark'),
             'sms_id' => Input::get('sms_id'),
             'CASTYPEID' => Input::get('CASTYPEID'),
        );
        $SmsStbscbrand_id = SmsStbscbrand::insert($SmsStbscbrand_data);
        return redirect('sms_stbscbrand')->with('message', 'SmsStbscbrand successfully added');
    }

    public function delete($id)
    {
        $SmsStbscbrand = SmsStbscbrand::find($id);
        $SmsStbscbrand->delete();
        return redirect('sms_stbscbrand')->with('message', 'SmsStbscbrand deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_stbscbrand'] = SmsStbscbrand::find($id);
        return view('sms_stbscbrand/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_stbscbrand_id');

        $data = array(
          'Id' => Input::get('Id'),
          'BrandTitle' => Input::get('BrandTitle'),
          'Price' => Input::get('Price'),
          'BoxType' => Input::get('BoxType'),
          'TimeShift' => Input::get('TimeShift'),
          'Maxlength' => Input::get('Maxlength'),
          'SignificantDigits' => Input::get('SignificantDigits'),
          'CharAllowed' => Input::get('CharAllowed'),
          'FORSMARTCARD' => Input::get('FORSMARTCARD'),
          'Status' => Input::get('Status'),
          'CreatedOn' => Input::get('CreatedOn'),
          'CreatedBy' => Input::get('CreatedBy'),
          'UpdatedOn' => Input::get('UpdatedOn'),
          'UpdatedBy' => Input::get('UpdatedBy'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
          'sms_id' => Input::get('sms_id'),
          'CASTYPEID' => Input::get('CASTYPEID'),
        );
        SmsStbscbrand::where('id', '=', $id)->update($data);
        return redirect('sms_stbscbrand')->with('message', 'SmsStbscbrand Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsStbscbrand = SmsStbscbrand::find($id);
        $SmsStbscbrand->status = !$SmsStbscbrand->status;
        $SmsStbscbrand->save();
        return redirect('sms_stbscbrand')->with('message', 'Change SmsStbscbrand status successfully');
    }

    public function view($id)
    {
        $data['SmsStbscbrand'] = SmsStbscbrand::find($id);
        return view('sms_stbscbrand/view', $data);
    }

    // Add other methods here...
}
