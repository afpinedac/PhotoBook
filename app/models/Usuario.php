<?php

class Usuario extends LaraFotosModel {

  protected $table = 'usuario';

  
  public static function get_numero_albumes(){
    return DB::table('album')
            ->where('usuario',Auth::user()->id)
            ->count();
  }
  public static function get_numero_otros_albumes(){
    return count(Album::get_otros_albumes());
  }
  

}
