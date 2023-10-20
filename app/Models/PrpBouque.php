<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class PrpBouque extends Eloquent
{
    protected $table = 'PRP_BOUQUE';
	protected $primaryKey = 'Id';
	
	const UPDATED_AT = 'UpdatedOn';
    
	public static function list()
    {
        $prp_bouques = self::all()->toArray();
        $res = array();
        foreach ($prp_bouques as $prp_bouque)
        {
            $res[$prp_bouque['Id']] = $prp_bouque;
        }
        return $res;
    }
	
	public function assets()
    {
        return $this->hasMany(PrpBouqueAsset::class, 'BouqueId', 'Id');
    }
	
	public function package_assets()
    {
        return $this->hasMany(PrpBouqueAsset::class, 'BouqueId', 'Id')->where('PackageId', '<>', null);
    }
	public function channel_assets()
    {
        return $this->hasMany(PrpBouqueAsset::class, 'BouqueId', 'Id')->where('ChannelId', '<>', null);
    }

	public function createdby()
    {
         return $this->belongsTo(SmsAcces::class, 'CreatedBy', 'Id');
    }
	public function packagetype()
    {
         return $this->belongsTo(PackageType::class, 'PackageTypeId');
    }
}
