<?php

class Imagen extends LaraFotosModel {

  protected $table = 'imagen';

  public static function get_comentarios($id) {
    return DB::table('comentario')
              ->join('imagen','imagen.id','=','comentario.imagen')
              ->join('album','album.id','=','imagen.album')
              ->join('persona','persona.id','=','album.usuario')
              ->where('imagen.id',$id)
              ->orderBy('comentario.id','desc')
              ->select(['comentario.created_at as fecha','persona.nombre','comentario.texto'])
              ->get();
  }

  public static function get_numero_comentarios($imagen){
    return DB::table('comentario')
            ->where('imagen',$imagen)
            ->count();
  }
  
}
