<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsChannel extends Eloquent
{
    protected $table = 'sms_channel';

    public static function list()
    {
        $sms_channel = self::all()->toArray();
        $res = array();
        foreach ($sms_channel as $sms_channel)
        {
            $res[$sms_channel['Id']] = $sms_channel;
        }
        return $res;
    }
}
