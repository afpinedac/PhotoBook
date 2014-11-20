{capture assign="left"}

  
  {foreach $comentarios as $comentario}
   
  
  {/foreach}

  
  
 
  
{/capture}

{capture assign="right"}

  <h3>{$imagen->titulo}</h3>
  
  <img src='{url('/')}/assets/imgs/{$imagen->foto}'>
  
  
  <p class="text-justify">{$imagen->descripcion}</p>
  
  
  {Form::open(['url'=>'comentario/guardar'])}
  
  <textarea name='texto' class='col-sm-12' rows='2' placeholder='Escribe tu comentario'></textarea>
  <input type='hidden' name='imagen' value='{$imagen->id}'>
  
  
  <input type='submit' value='Guardar'>
  
  {Form::close()}
  
  
 
{/capture}


{include file='templates/template.tpl' layout='two' title=''}