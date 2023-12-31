<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsAreacode extends Eloquent
{
    protected $table = 'sms_areacode';

    public static function list()
    {
        $sms_areacodes = self::all()->toArray();
        $res = array();
        
		foreach ($sms_areacodes as $sms_areacode)
        {
            $res[$sms_areacode['id']] = $sms_areacode;
        }
        return $res;
    }
}
