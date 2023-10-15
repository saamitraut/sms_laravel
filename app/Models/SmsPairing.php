<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsPairing extends Eloquent
{
    protected $table = 'sms_pairing';

    public static function list()
    {
        $sms_pairing = self::all()->toArray();
        $res = array();
        foreach ($sms_pairing as $sms_pairing)
        {
            $res[$sms_pairing['id']] = $sms_pairing;
        }
        return $res;
    }
	public function smartcard()
    {
         return $this->belongsTo(SmsSmartcard::class, 'SmartCardId', 'Id');
    }
	public function stb()
    {
         return $this->belongsTo(SmsStb::class, 'StbId', 'Id');
    }
}
