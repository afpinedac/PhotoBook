<?php

class ImagenController extends FotosController {

  public function getIndex() {
    return Redirect::to("");
  }

  public function postGuardar() {

    $album = Input::get('album');
    $imagen = [
        'album' => $album,
        'titulo' => Input::get('titulo'),
        'descripcion' => Input::get('descripcion')
    ];

    Imagen::create($imagen);
    return Redirect::to("album/imagenes/{$album}");
  }

}
