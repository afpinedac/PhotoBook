{capture assign="left"}


  <h2>Crear Album</h2>
  <br>

  {Form::open(['url' => '/album/guardar','class'=> 'form-horizontal'])}
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Nombre</label>
    <div class="col-sm-10">
      <input type="textt" name="nombre" class="form-control" id="inputEmail3" placeholder="Nombre">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Descripción</label>
    <div class="col-sm-10">
      <textarea type="password" rows="4" name='descripcion' class="form-control" id="inputPassword3" placeholder="Descripción"></textarea>
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-8">
      <button type="submit" class="btn btn-success">Crear</button>
    </div>
  </div>
  {Form::close()}
{/capture}




{capture assign="right"}
<h2>Mi Lista de álbumes ({Usuario::get_numero_albumes()})</h2>
  {if count($albumes)>0}

    <hr>
    <table border='1' class='table-responsive table-condensed table-bordered' width='100%'>
      <thead>
        <tr>
          <td>Nombre</td>
          <td>Descripción</td>
          <td>Ver imágenes</td>
          <td width="2%">Opciones</td>
        </tr>
      </thead>
      <tbody>
        {foreach $albumes as $album}
          <tr>
            <td>{$album->nombre}</td>
            <td>{$album->descripcion}</td>


            <td><a href="{url('/album/imagenes/')}/{$album->id}">ver imagenes</a> ({Album::get_numero_de_imagenes($album->id)})</td>
            <td>
              <div class="btn-group">
                <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                  Opciones <span class="caret"></span>
                </button>
                <ul class="dropdown-menu dropdown-menu-right" role="menu">
                  <li><a href='{url('/album/editar/')}/{$album->id}'>Editar</a></li>
                  <li><a href='{url('/album/eliminar/')}/{$album->id}'>Eliminar</a></li>
                </ul>
              </div>

              {*  <a href='{url('/album/eliminar/')}/{$album->id}'>[Eliminar]</a> - <a href='{url('/album/editar/')}/{$album->id}'>[Editar]</a>*}


            </td>


          </tr>
        {/foreach}
      </tbody>
    </table>

  {else}
    <div class="alert alert-danger fade in">
      <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <center>No tiene albumes creados</center>
    </div>
  {/if}
  
  <!----lista de otros usuarios--------->
  <hr>
  <h2>Álbumes de otros usuarios ({Usuario::get_numero_otros_albumes()})</h2>
  
  {if count($otrosalbumes)>0}
    <hr>
    <table border='1' class='table-responsive table-condensed table-bordered' width='100%'>
      <thead>
        <tr>
          <td>Nombre</td>
          <td>Propietario</td>
          <td>Descripción</td>
          <td>Ver imágenes</td>
        </tr>
      </thead>
      <tbody>
        {foreach $otrosalbumes as $album}
          <tr>
            <td>{$album->album}</td>
            <td>{$album->persona}</td>
            <td>{$album->descripcion}</td>
            <td><a href="{url('/album/imagenes/')}/{$album->id}">ver imagenes</a> ({Album::get_numero_de_imagenes($album->id)})</td>
          </tr>
        {/foreach}
      </tbody>
    </table>

  {else}
    <br>
    <div class="alert alert-danger fade in">
      <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <center>No existen otros álbumes</center>
    </div>
  {/if}
  
  
  
  
{/capture}















{include file='templates/template.tpl' layout='two' title=''}