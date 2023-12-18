<?php 
namespace App\Http\Controllers\API;
use Illuminate\Http\Request;
use App\Models\SmsSubscriber as SmsSubscriber;
use App\Models\SMSOPERATOR as SMSOPERATOR;
use App\Models\SMSSOCIETYMASTER as SMSSOCIETYMASTER;
// use Illuminate\Support\Carbon;

use App\Http\Controllers\Controller as Controller;
class SmsSubscriberController extends Controller {

    public function index(Request $request)
    {
		$sms_subscribers = SmsSubscriber::all();
        
        $res=[];

        foreach ($sms_subscribers as $sms_subscriber) {
            $row=$sms_subscriber;
            $row->subscriber_deatils=$sms_subscriber->subscriber_deatils;
            $row->createdby=$sms_subscriber->createdby;
            $operator=$sms_subscriber->operator;
            $operator->operatorbalance=round($sms_subscriber->operator->operatorbalance(),2);
            $row->operator=$operator;
            $row->society=$sms_subscriber->society;
            
            $accounts=[];
            $Accounts= $sms_subscriber->accounts;
            foreach($Accounts as $account){
                $createdby=$account->createdby->NAME;
                $STBNo=$account->pairing->stb->STBNo;
                $SmartcardNo=$account->pairing->smartcard->SmartcardNo;
                $BrandTitle=$account->pairing->stb->brand->BrandTitle;
                $BoxType=$account->pairing->stb->brand->BoxType?'HD':'SD';

                $transactions = $account->transactions->map(function ($transaction) {
                    $transaction->BouqueName = $transaction->bouque->BouqueName;
                    
                    $assets=$transaction->bouque->assets->where('ChannelId', '<>', null);
                    
                    $channels=[];
                    foreach($assets as $asset){
                        $channels[]=$asset->channel->ChannelName;
                    }
					$transaction->channels=$channels;	

                    $assets=$transaction->bouque->assets->where('PackageId', '<>', null);
                    
                    $packages=[];
                    foreach($assets as $asset){
                        $packages[]=$asset->package->PackageName;
                    }
					
                    $transaction->packages=$packages;	

                    return $transaction;
                  });
                
                $account->STBNo=$STBNo;
                $account->SmartcardNo=$SmartcardNo;
                $account->BrandTitle=$BrandTitle;
                $account->BoxType=$BoxType;
                $account->transactions=$transactions;
                $account->createdby=$createdby;

                $account->type=$account->IsPrimary?'Primary':'Secondary';

                // GET Bouque Details

                // $counter=1;	$group_number=0;
                      
				// $transactions = $account->transactions;
					
				// // Group the transactions by AddedBy and CreatedOn.
                // $rows = $transactions->groupBy('ActivationDate');
                
                // $groupedtransactions=[];
                
                // foreach($rows as $Row){
                //     $groupedTransactions = $Row->groupBy('DeActivationDate');
                //     foreach($groupedTransactions as $group){
                //         $groupedtransaction=(object)[];
                        
                //         $groupedtransaction->Addedby=$group->first()->createdby->NAME;
                //         $groupedtransaction->CreatedOn=$group->first()->CreatedOn;
                //         $groupedtransaction->ActivationDate=$group->first()->ActivationDate;
                //         $groupedtransactions[]=$groupedtransaction;

                //     }
                // }

				
                $accounts[]=$account;
            }
            
            $row->accounts=$accounts;
            // $row->groupedtransactions=$groupedtransactions;
            // $row->transactions=$transactions;
            $res[]=$row;
        }
		
        $data['sms_subscribers']=$res;
		// $data['SMS_OPERATOR'] = SMSOPERATOR::list();
		// $data['SMS_SOCIETY_MASTER'] = SMSSOCIETYMASTER::list();
		
        // $data['columnNames'] = ['Id','FormNo','CustomerId','OperatorId','SocietyId','MobileNo','Status','ProspectId','PCustomerId','OpTobeBilled','CreatedOn','CreatedBy','UpdatedOn','UpdatedBy','Deleted','Remark','sms_id'];
        
		return $data;
    }

    public function add()
    {
        return view('sms_subscribers/add');
    }

    public function addPost()
    {
        $SmsSubscriber_data = array(
             'Id' => Input::get('Id'),
             'FormNo' => Input::get('FormNo'),
             'CustomerId' => Input::get('CustomerId'),
             'OperatorId' => Input::get('OperatorId'),
             'SocietyId' => Input::get('SocietyId'),
             'MobileNo' => Input::get('MobileNo'),
             'Status' => Input::get('Status'),
             'ProspectId' => Input::get('ProspectId'),
             'PCustomerId' => Input::get('PCustomerId'),
             'OpTobeBilled' => Input::get('OpTobeBilled'),
             'CreatedOn' => Input::get('CreatedOn'),
             'CreatedBy' => Input::get('CreatedBy'),
             'UpdatedOn' => Input::get('UpdatedOn'),
             'UpdatedBy' => Input::get('UpdatedBy'),
             'Deleted' => Input::get('Deleted'),
             'Remark' => Input::get('Remark'),
             'sms_id' => Input::get('sms_id'),
        );
        $SmsSubscriber_id = SmsSubscriber::insert($SmsSubscriber_data);
        return redirect('sms_subscribers')->with('message', 'SmsSubscriber successfully added');
    }

    public function delete($id)
    {
        $SmsSubscriber = SmsSubscriber::find($id);
        $SmsSubscriber->delete();
        return redirect('sms_subscribers')->with('message', 'SmsSubscriber deleted successfully.');
    }

    public function edit($id)
    {
        $data['sms_subscribers'] = SmsSubscriber::find($id);
        return view('sms_subscribers/edit', $data);
    }

    public function editPost()
    {
        $id = Input::get('sms_subscribers_id');

        $data = array(
          'Id' => Input::get('Id'),
          'FormNo' => Input::get('FormNo'),
          'CustomerId' => Input::get('CustomerId'),
          'OperatorId' => Input::get('OperatorId'),
          'SocietyId' => Input::get('SocietyId'),
          'MobileNo' => Input::get('MobileNo'),
          'Status' => Input::get('Status'),
          'ProspectId' => Input::get('ProspectId'),
          'PCustomerId' => Input::get('PCustomerId'),
          'OpTobeBilled' => Input::get('OpTobeBilled'),
          'CreatedOn' => Input::get('CreatedOn'),
          'CreatedBy' => Input::get('CreatedBy'),
          'UpdatedOn' => Input::get('UpdatedOn'),
          'UpdatedBy' => Input::get('UpdatedBy'),
          'Deleted' => Input::get('Deleted'),
          'Remark' => Input::get('Remark'),
          'sms_id' => Input::get('sms_id'),
        );
        SmsSubscriber::where('id', '=', $id)->update($data);
        return redirect('sms_subscribers')->with('message', 'SmsSubscriber Updated successfully');
    }

    public function changeStatus($id)
    {
        $SmsSubscriber = SmsSubscriber::find($id);
        $SmsSubscriber->status = !$SmsSubscriber->status;
        $SmsSubscriber->save();
        return redirect('sms_subscribers')->with('message', 'Change SmsSubscriber status successfully');
    }

    public function view($id)
    {
        $data['SmsSubscriber'] = SmsSubscriber::find($id);
        return view('sms_subscribers/view', $data);
    }

    // Add other methods here...
}