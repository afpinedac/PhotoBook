<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/
Route::get('/t', function(){
  echo Hash::make('a');
});


Route::get('/', array('uses' => 'UsuarioController@getLogin'));
Route::post('/login', array('uses' => 'UsuarioController@postLogin'));
Route::get('/logout', array('uses' => 'UsuarioController@getLogout'));


Route::controller('album','albumController');
Route::controller('imagen','imagenController');
Route::controller('comentario','comentarioController');