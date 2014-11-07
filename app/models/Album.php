<?php

class Album extends LaraFotosModel {

  protected $table = 'album';

  public function es_propiedad_de_usuario($user) {
    return DB::table('album')
                    ->where('id', $this->id)
                    ->where('usuario', $user)
                    ->count() == 1;
  }

  public function get_numero_de_imagenes() {
    return DB::table('imagen')
                    ->where('album', $this->id)
                    ->count();
  }

  public function get_imagenes() {
    return DB::table('imagen')
                    ->where('album', $this->id)
                    ->get();
  }

}
