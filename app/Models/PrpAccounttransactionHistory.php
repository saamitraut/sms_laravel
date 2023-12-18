<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class PrpAccounttransactionHistory extends Eloquent
{
	protected $table = 'PRP_ACCOUNTTRANSACTION_HISTORY';
	
	public static function list(){
		$prp_accounttransaction_history = self::all()->toArray();
		$res = array();
		
		foreach($prp_accounttransaction_history as $prp_accounttransaction_history){
			$res[$prp_accounttransaction_history['id']] = $prp_accounttransaction_history;
		}
		
		return $res;
	}
}