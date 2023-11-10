<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class PackageType extends Eloquent
{
    // protected $table = 'package_types';

    public static function list()
    {
        $package_types = self::all()->toArray();
        $res = array();
        foreach ($package_types as $package_type)
        {
            $res[$package_type['id']] = $package_type;
        }
        return $res;
    }
}
