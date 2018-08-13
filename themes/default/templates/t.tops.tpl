{include file='sections/main_header.tpl'}
<section class="content">
<div class="row">
<div class="col-md-12">
	{include file='modules/top/m.top_sidebar.tpl'}</div>
    <div class="col-md-12">
    {if $tsAction == 'posts'}
    {include file='modules/top/m.top_posts.tpl'}</div> 
      <div class="col-md-12">
    {elseif $tsAction == 'usuarios'}
    {include file='modules/top/m.top_users.tpl'}
	{elseif $tsAction == 'comunidades'}
    {include file='modules/top/m.top_comunidades.tpl'}
    {elseif $tsAction == 'temas'}
    {include file='modules/top/m.top_temas.tpl'}
    {/if}   </div>   </div> </section>         
{include file='sections/main_footer.tpl'}