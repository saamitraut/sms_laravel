<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsPackage extends Eloquent
{
    protected $table = 'sms_package';
	const UPDATED_AT = 'UpdatedOn';

    public function broadcaster()
    {
         return $this->belongsTo(SmsBroadcaster::class, 'broadcaster_id', 'ID');
    }
}
