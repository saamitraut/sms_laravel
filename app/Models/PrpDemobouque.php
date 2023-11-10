<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class PrpDemobouque extends Eloquent
{
    protected $table = 'prp_demobouque';

    public static function list()
    {
        $prp_demobouque = self::all()->toArray();
        $res = array();
        foreach ($prp_demobouque as $prp_demobouque)
        {
            $res[$prp_demobouque['id']] = $prp_demobouque;
        }
        return $res;
    }
}
