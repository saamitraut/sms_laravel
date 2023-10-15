<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;

class SmsSubscriber extends Eloquent
{
	// protected $table = 'sms_subscriberaccounts';
	
	public function accounts()
    {
        return $this->hasMany(SmsSubscriberaccount::class, 'SubscriberId', 'Id');
    }
	
	public function subscriber_deatils()
    {
         return $this->hasOne(SmsSubscribersDetail::class, 'SubscriberId', 'Id');
    }
	public function operator()
    {
         return $this->belongsTo(SmsOperator::class, 'OperatorId', 'Id');
    }
	
	public function createdby()
    {
         return $this->belongsTo(SmsAcces::class, 'CreatedBy', 'Id');
    }
	public function society()
    {
         return $this->belongsTo(SmsSocietyMaster::class, 'SocietyId', 'Id');
    }
}