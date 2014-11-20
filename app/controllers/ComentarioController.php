<?php

class ComentarioController extends FotosController {

  public function getIndex() {
    return Redirect::to("");
  }
  
  
  public function postGuardar(){
    $imagen = Input::get('imagen');
    
    $comentario = [
        'texto'=> Input::get('texto'),
        'imagen'=> $imagen,
        'usuario'=> Auth::user()->id,
    ];
    
    Comentario::create($comentario);
    return Redirect::to("/album/imagen/{$imagen}");
    
  }

  
  
}
