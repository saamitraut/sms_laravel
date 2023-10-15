<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePrpAccounttransactionTable extends Migration
{
    public function up()
    {
        Schema::table('prp_accounttransaction', function (Blueprint $table) {
			$table->foreign('Bouqueid')->references('Id')->on('prp_bouque');
		});

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('prp_accounttransaction');
    }
}
