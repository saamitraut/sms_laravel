<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class PrpOperatorCredit extends Eloquent
{
	protected $table = 'PRP_OPERATOR_CREDIT';
	
	public static function list(){
		$prp_operator_credit = self::all()->toArray();
		$res = array();
		
		foreach($prp_operator_credit as $prp_operator_credit){
			$res[$prp_operator_credit['id']] = $prp_operator_credit;
		}
		
		return $res;
	}
}