<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsSubscribersDetail extends Eloquent
{
    // protected $table = 'sms_subscribers_details';

    public static function list()
    {
        $sms_subscribers_details = self::all()->toArray();
        $res = array();
        foreach ($sms_subscribers_details as $sms_subscribers_detail)
        {
            $res[$sms_subscribers_detail['id']] = $sms_subscribers_detail;
        }
        return $res;
    }
}
