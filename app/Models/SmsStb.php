<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsStb extends Eloquent
{
    // protected $table = 'sms_stbs';

    public static function list()
    {
        $sms_stbs = self::all()->toArray();
        $res = array();
        foreach ($sms_stbs as $sms_stb)
        {
            $res[$sms_stb['Id']] = $sms_stb;
        }
        return $res;
    }
}
