<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsBroadcaster extends Eloquent
{
    protected $table = 'sms_broadcaster';
	// const CREATED_AT = 'CreatedOn';

	public function packages()
    {
        return $this->hasMany(SmsPackage::class, 'broadcaster_id', 'ID');
    }
	public function channels()
    {
        return $this->hasMany(SmsChannel::class, 'BroadcasterId', 'ID');
    }
}
