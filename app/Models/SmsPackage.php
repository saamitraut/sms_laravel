<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsPackage extends Eloquent
{
    protected $table = 'sms_package';

    public static function list()
    {
        $sms_package = self::all()->toArray();
        $res = array();
        foreach ($sms_package as $sms_package)
        {
            $res[$sms_package['Id']] = $sms_package;
        }
        return $res;
    }
}
