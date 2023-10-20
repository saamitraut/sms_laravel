<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class PrpBouque extends Eloquent
{
    protected $table = 'PRP_BOUQUE';

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
	public function createdby()
    {
         return $this->belongsTo(SmsAcces::class, 'CreatedBy', 'Id');
    }
	public function packagetype()
    {
         return $this->belongsTo(PackageType::class, 'PackageTypeId', 'id');
    }
}
