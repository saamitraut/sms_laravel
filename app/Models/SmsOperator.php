<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Eloquent;


class SmsOperator extends Eloquent
{
    protected $table = 'sms_operator';

    public static function list()
    {
        $sms_operator = self::all()->toArray();
        $res = array();
        foreach ($sms_operator as $sms_operator)
        {
            $res[$sms_operator['ID']] = $sms_operator;
        }
        return $res;
    }
	public function assets()
    {
        return $this->hasMany(SmsOperatorAsset::class, 'OperatorId', 'ID');
    }
	
	public function operatorcredit(){
		return $this->hasMany(PrpOperatorCredit::class,'OperatorId','ID');
	}
	
	public function operatordebit()
	{
		return $this->hasMany(PrpAccounttransactionHistory::class,'OperatorId','ID');
	}
	
	public function operatorbalance(){
		$credits=$this->operatorcredit;
		$total_credit=0;
		
		$debits=$this->operatordebit;
		$total_debit=0;
		$NCFDebitAmount=0;
		
		$LCOSharing=0;
		$NCF_LCOSharing=0;
		$TotalLCOSharing=0;
		
		foreach($credits as $credits){
			if($credits->TransType==1){
				$total_credit=$total_credit+$credits->Amount;
			}
		}
		
		foreach($debits as $debits){
			if ($debits->DMLAction==1){
				$total_debit=$total_debit+$debits->Amount;
				$NCFDebitAmount=$NCFDebitAmount+$debits->NCFAmount;
				$LCOSharing=$LCOSharing+$debits->LCOSharing;
				$NCF_LCOSharing=$NCF_LCOSharing+$debits->NCF_LCOSharing;
			}	
		}

		$operatorbalance=($total_credit+$LCOSharing+$NCF_LCOSharing+0)-($total_debit+$NCFDebitAmount);	
		
		return $operatorbalance;
		
	}
}
