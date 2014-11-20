{capture assign="left"}

  <h3 class='pull-right' style='margin-top: -5px;'>Comentarios ({Imagen::get_numero_comentarios($imagen->id)})</h3>
  <br>
  <hr>
  <div style='max-height: 400px; overflow-y: scroll'>
  
  {foreach $comentarios as $comentario}
    
   <p style='font-size: 16px;'>{$comentario->texto}</p>
   <div><span class='pull-right'><small>{$comentario->nombre}</small> <br>({$comentario->fecha})</span>
   <br></div>
   <hr>
   {foreachelse}
     <div class="alert alert-danger fade in">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                   <center>No hay comentarios </center>   
   </div>
  
  {/foreach}
  
  </div>

  
  
 
  
{/capture}

{capture assign="right"}

  <h1 class='badge'>{$imagen->titulo}</h1>
  
  <center><img  class='ph-imagen img-responsive img-thumbnail' src='{url('/')}/assets/img/{$imagen->foto}'></center>
  
  
  <p class="text-justify">{$imagen->descripcion}</p>
  
  
  {Form::open(['url'=>'comentario/guardar'])}
  
  <textarea name='texto' class='col-sm-12' rows='2' placeholder='Escribe tu comentario'></textarea>
  <input type='hidden' name='imagen' value='{$imagen->id}'>
  
  
  <input type='submit' value='Guardar'>
  
  {Form::close()}
  
  
 
{/capture}


{include file='templates/template.tpl' layout='two' title=''}