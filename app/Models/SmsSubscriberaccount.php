<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsSubscriberaccount extends Eloquent
{
    // protected $table = 'sms_subscriberaccounts';

    public function createdby()
    {
         return $this->belongsTo(SmsAcces::class, 'CreatedBy', 'Id');
    }
	
	public function pairing()
    {
         return $this->belongsTo(SmsPairing::class, 'PairingId', 'Id');
    }
	
	public function transactions()
    {
        return $this->hasMany(PrpAccounttransaction::class, 'AccountId', 'Id');
    }
	public function subscriber()
    {
         return $this->belongsTo(SmsSubscriber::class, 'SubscriberId', 'Id');
    }

}
