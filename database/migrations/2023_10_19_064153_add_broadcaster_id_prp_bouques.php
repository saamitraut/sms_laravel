<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddBroadcasterIdPrpBouques extends Migration
{
    public function up()
    {
        Schema::table('PRP_BOUQUE', function (Blueprint $table) {
             $table->bigInteger('broadcaster_id')->default(0);
			//$table->foreign('broadcaster_id')->references('ID')->on('SMS_BROADCASTER');
        });
    }

    public function down()
    {
        Schema::table('PRP_BOUQUE', function (Blueprint $table) {
            //$table->dropForeign(['broadcaster_id']);
			 $table->dropColumn('broadcaster_id');
        });
    }
}
