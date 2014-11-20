<?php

class Imagen extends LaraFotosModel {

  protected $table = 'imagen';

  public function get_comentarios() {
    return DB::table('imagen')
                    ->join('comentario', 'comentario.imagen', '=', 'imagen.id')
                    ->where('imagen.id', $this->id)
                    ->get();
  }

}
 