<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsSmartcard extends Eloquent
{
    // protected $table = 'sms_smartcards';

    public static function list()
    {
        $sms_smartcards = self::all()->toArray();
        $res = array();
        foreach ($sms_smartcards as $sms_smartcard)
        {
            $res[$sms_smartcard['Id']] = $sms_smartcard;
        }
        return $res;
    }
}
