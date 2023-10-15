<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class PrpAccounttransaction extends Eloquent
{
    protected $table = 'prp_accounttransaction';

    public static function list()
    {
        $prp_accounttransaction = self::all()->toArray();
        $res = array();
        foreach ($prp_accounttransaction as $prp_accounttransaction)
        {
            $res[$prp_accounttransaction['Id']] = $prp_accounttransaction;
        }
        return $res;
    }
}
