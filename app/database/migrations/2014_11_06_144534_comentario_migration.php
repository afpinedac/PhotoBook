<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ComentarioMigration extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('comentario', function(Blueprint $table)
		{
			$table->increments('id');
			$table->text('texto');
      $table->integer('imagen')->unsigned();
      $table->foreign('imagen')->references('id')->on('imagen')->onDelete('cascade');
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
		Schema::drop('comentario');
	}

}
