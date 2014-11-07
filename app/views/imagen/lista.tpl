{capture assign="content"}

 Album: {$album->nombre}
 
 
 
 <h3>Agegar foto</h3>
 {Form::open(['url' => 'imagen/guardar'])}
  Nombre:  <input name='titulo' type='text' required><br>
  Descripción: <textarea name='descripcion' required></textarea>
  <input type="hidden" name="album" value="{$album->id}">
  <input type='submit'>
  
 {Form::close()}
 
 <hr>
 <table border="1">
     <thead>
       <tr>
         <td>Titulo</td>
         <td>Descripción</td>
         <td>Opciones</td>
       </tr>
     </thead>
     <tbody>
       {foreach $imagenes as $imagen}
       <tr>
         <td>{$imagen->titulo}</td>
         <td>{$imagen->descripcion}</td>
         <td><a href='{url('/imagen/eliminar/')}/{$imagen->id}'>[Eliminar]</a> - <a href='{url('/imagen/editar/')}/{$imagen->id}'>[Editar]</a></td>
       </tr>
       {/foreach}
     </tbody>
   </table>
 

 
 
{/capture}

{include file='templates/template.tpl' layout='main' title=''}