<?php

class Album extends LaraFotosModel {

  protected $table = 'album';
  
  public static function all($colums =[]){
    return DB::table('album')
            ->where('usuario', Auth::user()->id)
            ->get();
  }

  public function es_propiedad_de_usuario($user) {
    return DB::table('album')
                    ->where('id', $this->id)
                    ->where('usuario', $user)
                    ->count() == 1;
  }

  public static function get_numero_de_imagenes($album) {
    return DB::table('imagen')
                    ->where('album', $album)
                    ->count();
  }

  public function get_imagenes() {
    return DB::table('imagen')
                    ->where('album', $this->id)
                    ->get();
  }
  
  
  public static function get_otros_albumes(){
    return DB::table('album')
            ->join('persona','album.usuario','=','persona.id')
            ->where('usuario','<>',Auth::user()->id)
            ->select(['persona.nombre as persona', 'album.id','album.nombre as album','album.descripcion'])
            ->get();
  }

}
