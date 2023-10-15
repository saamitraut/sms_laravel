<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSTBsTable extends Migration
{
    public function up()
    {
        Schema::create('STBs', function (Blueprint $table) {
            $table->increments('id');
            $table->string('STBNo');
            $table->string('SmartcardNo');
            $table->integer('amount');
            $table->string('DeactivationDate');
            $table->integer('accountid');
            $table->boolean('status')->default(false);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('STBs');
    }
}