{capture assign="content"}

 
  
  {Form::open(['url' => '/login'])}

  Nickname: <input name='nickname'>
  Password: <input name='password' type='password'>
   <input  type='submit'>
   
  {Form::close()}
  
  
  
  
{/capture}

{include file='templates/template.tpl' layout='main' title=''}