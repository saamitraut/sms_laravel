<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class State extends Eloquent
{
    // protected $table = 'states';

    public static function list()
    {
        $states = self::all()->toArray();
        $res = array();
        foreach ($states as $state)
        {
            $res[$state['id']] = $state;
        }
        return $res;
    }
}
