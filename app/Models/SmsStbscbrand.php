<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsStbscbrand extends Eloquent
{
    protected $table = 'sms_stbscbrand';

    public static function list()
    {
        $sms_stbscbrand = self::all()->toArray();
        $res = array();
        foreach ($sms_stbscbrand as $sms_stbscbrand)
        {
            $res[$sms_stbscbrand['id']] = $sms_stbscbrand;
        }
        return $res;
    }
}
