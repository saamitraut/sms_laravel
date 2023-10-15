<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class PrpBouqueAsset extends Eloquent
{
    // protected $table = 'prp_bouque_assets';

    public static function list()
    {
        $prp_bouque_assets = self::all()->toArray();
        $res = array();
        foreach ($prp_bouque_assets as $prp_bouque_asset)
        {
            $res[$prp_bouque_asset['id']] = $prp_bouque_asset;
        }
        return $res;
    }
	public function channel()
    {
         return $this->belongsTo(SmsChannel::class, 'ChannelId', 'Id');
    }
	public function package()
    {
         return $this->belongsTo(SmsPackage::class, 'PackageId', 'Id');
    }
}
