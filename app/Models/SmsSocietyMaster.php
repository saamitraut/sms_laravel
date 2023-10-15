<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsSocietyMaster extends Eloquent
{
    protected $table = 'sms_society_master';

    public static function list()
    {
        $sms_society_master = self::all()->toArray();
        $res = array();
        foreach ($sms_society_master as $sms_society_master)
        {
            $res[$sms_society_master['Id']] = $sms_society_master;
        }
        return $res;
    }
	public function area()
    {
         return $this->belongsTo(SmsAreacode::class, 'AreaId', 'Id'); 
    }
}
