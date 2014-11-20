 <html>

   <head>
      <link rel="stylesheet" type="text/css" media="screen" href="{url('/')}/assets/libs/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" type="text/css" media="screen" href="{url('/')}/assets/css/photos.css">
   </head> 
   
  <body>
      {capture assign='layout'}../layouts/{$layout|default:'main'}.tpl{/capture}     
  </body>

  <footer>
     <script src="{url('/')}/assets/libs/jquery/jquery-2.0.2.min.js"></script>
    <script src="{url('/')}/assets/libs/bootstrap/js/bootstrap.min.js"></script>
  </footer>

{include file=$layout}
</html>

    