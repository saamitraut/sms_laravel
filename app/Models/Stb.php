<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class Stb extends Eloquent
{
    // protected $table = 'stbs';

    public static function list()
    {
        $stbs = self::all()->toArray();
        $res = array();
        foreach ($stbs as $stb)
        {
            $res[$stb['id']] = $stb;
        }
        return $res;
    }
}
