<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UsuarioMigration extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('usuario', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('nickname');
			$table->string('avatar');
			$table->string('password');
			$table->timestamps();
      $table->rememberToken();
      $table->integer('persona')->unsigned();
      $table->foreign('persona')->references('id')->on('persona')->onDelete('cascade');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('usuario');
	}

}
