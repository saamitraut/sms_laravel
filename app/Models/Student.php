<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class Student extends Eloquent
{
    // protected $table = 'students';

    public static function list()
    {
        $students = self::all()->toArray();
        $res = array();
        foreach ($students as $student)
        {
            $res[$student['id']] = $student;
        }
        return $res;
    }
}
