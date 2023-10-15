<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsSubscriberaccount extends Eloquent
{
    // protected $table = 'sms_subscriberaccounts';

    public static function list()
    {
        $sms_subscriberaccounts = self::all()->toArray();
        $res = array();
        foreach ($sms_subscriberaccounts as $sms_subscriberaccount)
        {
            $res[$sms_subscriberaccount['Id']] = $sms_subscriberaccount;
        }
        return $res;
    }
}
