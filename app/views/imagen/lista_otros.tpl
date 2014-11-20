{capture assign="left"}
 
  <h3 class='pull-right'>Lista de Álbumes</h3>
  <br>
  <hr>
  
   
    <ul class="nav nav-pills nav-stacked" style="max-width: 300px;">
      {foreach $otrosalbumes as $otroalbum}
        <li role="presentation" {if $otroalbum->id==$album->id}class="active"{/if}><a href="{url('/')}/album/imagenes/{$otroalbum->id}">{$otroalbum->album|capitalize}</a></li>
    {/foreach}
    </ul>
{/capture}
{capture assign="right"}
 <span class='pull-right'><a href='{url('/album')}'>[Volver]</a></span>
  <h1 class="">Album: <span class="badge">{$album->nombre|capitalize}</span></h1>
  
  
  <hr>

  {if count($imagenes)>0}
    <h2>Lista de Fotos</h2>

    <table border='1' class='table-responsive table-condensed table-bordered' width='100%'>
      <thead>
        <tr>
          <td>Titulo</td>
          <td>Descripción</td>
          <td style='width: 1px;'>Comentarios</td>
          
          <td width="2%">Opciones</td>
        </tr>
      </thead>
      <tbody>

        {foreach $imagenes as $imagen}
          <tr>
            <td><a href='{url('album/imagen/')}/{$imagen->id}'>{$imagen->titulo}</a></td>
            <td>{$imagen->descripcion}</td>
            <td><center>{Imagen::get_numero_comentarios($imagen->id)}</center></td>
            <td>
              <div class="btn-group">
                <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                  Opciones <span class="caret"></span>
                </button>
                <ul class="dropdown-menu dropdown-menu-right" role="menu">
                  <li><a href='{url('/imagen/editar/')}/{$imagen->id}'>Editar</a></li>
                  <li><a href='{url('/imagen/eliminar/')}/{$imagen->id}'>Eliminar</a></li>
                </ul>
              </div>

            </td>
          </tr>
        {/foreach}
      </tbody>
    </table>

  {else}
    <div class="alert alert-danger fade in">
      <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <center>No tiene fotos en este álbum</center>
    </div>
  {/if}
  
{/capture}

{include file='templates/template.tpl' layout='two' title=''}