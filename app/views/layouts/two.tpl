{include file='./inc/header.tpl'}

<div class="container-fluid" >
  <div class="row col-xs-10 col-xs-offset-1" style="background-color: white">

    <div class="col-xs-12 col-sm-4 well" >

      {if isset($left)}
        {$left}
      {/if}
    </div>
    <div class="col-xs-12 col-sm-8">


      {if isset($right)}
        {$right}
      {/if}

    </div>
  </div>

</div>











