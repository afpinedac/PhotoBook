<?php

class UsuarioController extends FotosController {

  public function getIndex() {
    return Redirect::to("");
  }

  public function getLogin() {
    
    return View::make('login');
  }

  public function postLogin() {
    if (Auth::attempt(['nickname' => Input::get('nickname'), 'password' => Input::get('password')])) {
      $persona = Persona::find(Auth::user()->id);
      
      return Redirect::to("/album/lista");
    }
  }
  
  public function getLogout(){
    Auth::logout();
    return Redirect::to("/");
  }

}
