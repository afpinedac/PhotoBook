<?php

class AlbumController extends FotosController {

  public function getIndex() {
    return Redirect::to("album/lista");
  }

  //función que muestra la lista
  public function getLista() {
    $albumes = Album::all();
    return View::make('album.lista')
            ->with('albumes', $albumes);
  }

  //función que guarda en la bd
  public function postGuardar() {

    $album = [
        'nombre' => Input::get('nombre'),
        'descripcion' => Input::get('descripcion'),
        'usuario' => Auth::user()->id
    ];

    Album::create($album);
    return Redirect::to("/album/lista");
  }

}
