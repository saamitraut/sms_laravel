<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsOperator extends Eloquent
{
    protected $table = 'sms_operator';

    public static function list()
    {
        $sms_operator = self::all()->toArray();
        $res = array();
        foreach ($sms_operator as $sms_operator)
        {
            $res[$sms_operator['ID']] = $sms_operator;
        }
        return $res;
    }
}
