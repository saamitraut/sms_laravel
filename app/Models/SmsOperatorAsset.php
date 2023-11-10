<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsOperatorAsset extends Eloquent
{
    // protected $table = 'sms_operator_assets';

    public static function list()
    {
        $sms_operator_assets = self::all()->toArray();
        $res = array();
        foreach ($sms_operator_assets as $sms_operator_asset)
        {
            $res[$sms_operator_asset['id']] = $sms_operator_asset;
        }
        return $res;
    }
	public function bouquet()
    {
        return $this->belongsTo(PrpBouque::class,'BouqueId', 'Id');
    }
}
