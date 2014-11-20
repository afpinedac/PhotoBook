{capture assign="left"}

  <h2>Agregar Foto </h2>
  <br>

  {Form::open(['url' => '/imagen/guardar','class'=> 'form-horizontal'])}
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Nombre</label>
    <div class="col-sm-10">
      <input type="textt" name="titulo" class="form-control" id="inputEmail3" placeholder="Nombre">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Descripción</label>
    <div class="col-sm-10">
      <textarea type="text" rows="4" name='descripcion' class="form-control" id="inputPassword3" placeholder="Descripción"></textarea>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Archivo</label>
    <div class="col-sm-10">
      <input type="file" rows="4" name='foto' class="form-control" id="inputPassword3" placeholder="Descripción"/>
    </div>
  </div>
  <input type="hidden" name="album" value="{$album->id}">
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-8">
      <button type="submit" class="btn btn-success">Crear</button>
    </div>
  </div>
  {Form::close()}






{/capture}
{capture assign="right"}

  <h1 class="pull-right">Album: <span class="badge">{$album->nombre|capitalize}</span></h1>
  <br>
  <br>
  <hr>

  {if count($imagenes)>0}
    <h2>Lista de Fotos</h2>

    <table border='1' class='table-responsive table-condensed table-bordered' width='100%'>
      <thead>
        <tr>
          <td>Titulo</td>
          <td>Descripción</td>
          
          <td width="2%">Opciones</td>
        </tr>
      </thead>
      <tbody>

        {foreach $imagenes as $imagen}
          <tr>
            <td><a href='{url('album/imagen/')}/{$imagen->id}'>{$imagen->titulo}</a></td>
            <td>{$imagen->descripcion}</td>
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
      <center>No tiene albumes creados</center>
    </div>
  {/if}


{/capture}

{include file='templates/template.tpl' layout='two' title=''}