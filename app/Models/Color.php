<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class Color extends Eloquent
{
    // protected $table = 'colors';

    public static function list()
    {
        $colors = self::all()->toArray();
        $res = array();
        foreach ($colors as $color)
        {
            $res[$color['id']] = $color;
        }
        return $res;
    }
}
