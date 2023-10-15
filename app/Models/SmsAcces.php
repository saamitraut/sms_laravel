<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsAcces extends Eloquent
{
    protected $table = 'sms_access';

    public static function list()
    {
        $sms_access = self::all()->toArray();
        $res = array();
        foreach ($sms_access as $sms_acces)
        {
            $res[$sms_acces['id']] = $sms_acces;
        }
        return $res;
    }
}
