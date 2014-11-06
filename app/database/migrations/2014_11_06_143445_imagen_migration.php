<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ImagenMigration extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('imagen', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('foto');
			$table->string('descripcion');
			$table->string('titulo');
      $table->integer('album')->unsigned();
      $table->foreign('album')->references('id')->on('album')->onDelete('cascade');
      $table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('imagen');
	}

}
