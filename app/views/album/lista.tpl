{capture assign="content"}

 
  Crear Album
  <br>
  
  {Form::open(['url' => '/album/guardar'])}
  Nombre:  <input name='nombre' type='text' required><br>
  Descripción: <textarea name='descripcion' required></textarea>
  
  
  <input type='submit'>
  
  {Form::close()}

  
  
  
  <hr>
  <h3>Lista</h3>
  
  
    <table border='1'>
      <thead>
        <tr>
          <td>Nombre</td>
          <td>Descripción</td>
        </tr>
      </thead>
      <tbody>
        {foreach $albumes as $album}
        <tr>
          <td>{$album->nombre}</td>
          <td>{$album->descripcion}</td>
        </tr>
        {/foreach}
      </tbody>
    </table>
  

  
  
  
  
  
  
  
  
{/capture}

{include file='templates/template.tpl' layout='main' title=''}