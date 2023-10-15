<?php 

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\SmsChannel as SmsChannel;
use App\Models\SMSBROADCASTER as SMSBROADCASTER;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Hash;

class SmsChannelController extends Controller {

    public function index(Request $request)
    {
        $data['sms_channel'] = SmsChannel::all();
        $data['sms_channel'] = SmsChannel::paginate($request->get('pagination_limit', 5));
    $data['SMS_BROADCASTER'] = SMSBROADCASTER::list();
        $data['columnNames'] = ['Id','ChannelName','CasCodeGospel','CasCode','LogoExt','Price','Price2','BillingCycle','BroadcasterId','BRate','CategoryId','ChannelType','IsAlacarte','Description','Status','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark','sms_id','TSIDGospel','TSID','CasCodeTelelynx','PcrId','ComponentPidAudio','ComponentPidVideo','SymbolRate','EcmPidAudio','EcmPidVideo','QAM','Serviceid','Frequency','CasCodeNSTV','CasCodeKingvon','CasCodeCatVision','CasCodeBCas','LCNNO'];
        return view('sms_channel/index', $data);
    }

    public function add()
    {
        return view('sms_channel/add');
    }

    public function addPost()
    {
        $SmsChannel_data = array(
             'Id' => Input::get('Id'),
             'ChannelName' => Input::get('ChannelName'),
             'CasCodeGospel' => Input::get('CasCodeGospel'),
             'CasCode' => Input::get('CasCode'),
             'LogoExt' => Input::get('LogoExt'),
             'Price' => Input::get('Price'),
             'Price2' => Input::get('Price2'),
             'BillingCycle' => Input::get('BillingCycle'),
             'BroadcasterId' => Input::get('BroadcasterId'),
             'BRate' => Input::get('BRate'),
             'CategoryId' => Input::get('CategoryId'),
             'ChannelType' => Input::get('ChannelType'),
             'IsAlacarte' => Input::get('IsAlacarte'),
             'Description' => Input::get('Description'),
             'Status' => Input::get('Status'),
             'CreatedOn' => Input::get('CreatedOn'),
             'CreatedBy' => Input::get('CreatedBy'),
             'UpdatedOn' => Input::get('UpdatedOn'),
             'UpdatedBy' => Input::get('UpdatedBy'),
             'Deleted' => Input::get('Deleted'),
             'Remark' => Input::get('Remark'),
             'sms_id' => Input::get('sms_id'),
             'TSIDGospel' => Input::get('TSIDGospel'),
             'TSID' => Input::get('TSID'),
             'CasCodeTelelynx' => Input::get('CasCodeTelelynx'),
             'PcrId' => Input::get('PcrId'),
             'ComponentPidAudio' => Input::get('ComponentPidAudio'),
             'ComponentPidVideo' => Input::get('ComponentPidVideo'),
             'SymbolRate' => Input::get('SymbolRate'),
             'EcmPidAudio' => Input::get('EcmPidAudio'),
             'EcmPidVideo' => Input::get('EcmPidVideo'),
             'QAM' => Input::get('QAM'),
             'Serviceid' => Input::get('Serviceid'),
             'Frequency' => Input::get('Frequency'),
             'CasCodeNSTV' => Input::get('CasCodeNSTV'),
             'CasCodeKingvon' => Input::get('CasCodeKingvon'),
             'CasCodeCatVision' => Input::get('CasCodeCatVision'),
             'CasCodeBCas' => Input::get('CasCodeBCas'),
             'LCNNO' => Input::get('LCNNO'),
        );
        $SmsChannel_id = SmsChannel::insert($SmsChannel_data);
        return redirect('sms_channel')->with('message', 'SmsChannel successfully added');
    }

    public function delete($id)
    {
        $SmsChannel = SmsChannel::find($id);
        $SmsChannel->delete();
        return redirect('sms_channel')->with('message', 'SmsChannel deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_channel'] = SmsChannel::find($id);
        return view('sms_channel/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_channel_id');

        $data = array(
          'Id' => Input::get('Id'),
          'ChannelName' => Input::get('ChannelName'),
          'CasCodeGospel' => Input::get('CasCodeGospel'),
          'CasCode' => Input::get('CasCode'),
          'LogoExt' => Input::get('LogoExt'),
          'Price' => Input::get('Price'),
          'Price2' => Input::get('Price2'),
          'BillingCycle' => Input::get('BillingCycle'),
          'BroadcasterId' => Input::get('BroadcasterId'),
          'BRate' => Input::get('BRate'),
          'CategoryId' => Input::get('CategoryId'),
          'ChannelType' => Input::get('ChannelType'),
          'IsAlacarte' => Input::get('IsAlacarte'),
          'Description' => Input::get('Description'),
          'Status' => Input::get('Status'),
          'CreatedOn' => Input::get('CreatedOn'),
          'CreatedBy' => Input::get('CreatedBy'),
          'UpdatedOn' => Input::get('UpdatedOn'),
          'UpdatedBy' => Input::get('UpdatedBy'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
          'sms_id' => Input::get('sms_id'),
          'TSIDGospel' => Input::get('TSIDGospel'),
          'TSID' => Input::get('TSID'),
          'CasCodeTelelynx' => Input::get('CasCodeTelelynx'),
          'PcrId' => Input::get('PcrId'),
          'ComponentPidAudio' => Input::get('ComponentPidAudio'),
          'ComponentPidVideo' => Input::get('ComponentPidVideo'),
          'SymbolRate' => Input::get('SymbolRate'),
          'EcmPidAudio' => Input::get('EcmPidAudio'),
          'EcmPidVideo' => Input::get('EcmPidVideo'),
          'QAM' => Input::get('QAM'),
          'Serviceid' => Input::get('Serviceid'),
          'Frequency' => Input::get('Frequency'),
          'CasCodeNSTV' => Input::get('CasCodeNSTV'),
          'CasCodeKingvon' => Input::get('CasCodeKingvon'),
          'CasCodeCatVision' => Input::get('CasCodeCatVision'),
          'CasCodeBCas' => Input::get('CasCodeBCas'),
          'LCNNO' => Input::get('LCNNO'),
        );
        SmsChannel::where('id', '=', $id)->update($data);
        return redirect('sms_channel')->with('message', 'SmsChannel Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsChannel = SmsChannel::find($id);
        $SmsChannel->status = !$SmsChannel->status;
        $SmsChannel->save();
        return redirect('sms_channel')->with('message', 'Change SmsChannel status successfully');
    }

    public function view($id)
    {
        $data['SmsChannel'] = SmsChannel::find($id);
        return view('sms_channel/view', $data);
    }

    // Add other methods here...
}
