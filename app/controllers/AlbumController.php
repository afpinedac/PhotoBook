<?php

class AlbumController extends FotosController {

  public function getIndex() {
    return Redirect::to("album/lista");
  }

  //función que muestra la lista
  public function getLista() {
    $albumes = Album::all();
    $otrosalbumes = Album::get_otros_albumes();
    return View::make('album.lista')
                    ->with('albumes', $albumes)
                    ->with('otrosalbumes', $otrosalbumes);
  }

  //función que guarda en la bd
  public function postGuardar() {

    $album = [
        'nombre' => Input::get('nombre'),
        'descripcion' => Input::get('descripcion'),
        'usuario' => Auth::user()->id
    ];

    Album::create($album);
    return Redirect::to("album/lista");
  }

  public function getEliminar($id) {
    $album = Album::find($id);
    if ($album && $album->es_propiedad_de_usuario(Auth::user()->id)) {
      Album::destroy($id);
    }
    return Redirect::to("album/lista");
  }

  public function getImagenes($id) {
    $album = Album::find($id);
    if ($album && $album->es_propiedad_de_usuario(Auth::user()->id)) {
      $imagenes = $album->get_imagenes();
      return View::make('imagen.lista')
                      ->with('album', $album)
                      ->with('imagenes', $imagenes);
    }else{ // no es el dueño 
       $otrosalbumes = Album::get_otros_albumes();
      $imagenes = $album->get_imagenes();
       return View::make('imagen.lista_otros')
               ->with('otrosalbumes',$otrosalbumes)
               ->with('album',$album)
                ->with('imagenes', $imagenes);
               
    }
    return Redirect::to("album/lista");
  }

  public function getImagen($id) {
    $imagen = Imagen::find($id);
    $comentarios = Imagen::get_comentarios($id);
    return View::make('imagen.ver')
                    ->with('imagen', $imagen)
                    ->with('comentarios', $comentarios);
  }

}
