<?php

class ImagenController extends FotosController {

  public function getIndex() {
    return Redirect::to("");
  }

  public function postGuardar() {

    $file = Input::file('foto');

    $album = Input::get('album');


    $imagen = [
        'album' => $album,
        'titulo' => Input::get('titulo'),
        'descripcion' => Input::get('descripcion')
    ];

    $image = Imagen::create($imagen);

    $filename = "{$image->id}.{$file->getClientOriginalExtension()}";
    $image->foto = $filename;
    $image->save();

    $file->move(public_path() . '/assets/img/', $filename);

    return Redirect::to("album/imagenes/{$album}");
  }

  public function getEliminar($id) {
    $imagen = Imagen::find($id);
    Imagen::destroy($id);
    return Redirect::to("/album/imagenes/{$imagen->album}");
  }

}
