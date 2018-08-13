<div class="col-md-4">
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">&Uacute;ltimos comentarios</h3>
                  <div class="box-tools pull-right">
                    <button data-widget="collapse" class="btn btn-box-tool"><i class="fa fa-minus"></i></button>
                    <button data-widget="remove" class="btn btn-box-tool"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                <div class="box-body" style="  margin-top: -22px;">
                  <ul class="products-list product-list-in-box" style="margin-left: -97px;">
<ol id="filterByTodos" class="filterBy cleanlist" style="display:block;">
	{foreach from=$tsComments key=i item=c}
	<li>
		{if $i+1 < 10}0{/if}{$i+1}.
		{if $c.post_status != 0 || $c.user_activo == 0 || $c.user_baneado || $c.c_status != 0}
        <a href="{$tsConfig.url}/perfil/{$c.user_name}/">
		<strong style="color: {if $c.post_status == 3} #BBB {elseif $c.post_status == 1} purple {elseif $c.post_status == 2} rosyBrown {elseif $c.c_status == 1} coral{elseif $c.user_activo == 0} brown {elseif $c.user_baneado == 1} orange {/if};" class="qtip" title="{if $c.post_status == 3} El post se encuentra en revisi&oacute;n{elseif $c.post_status == 1} El post se encuentra oculto por acumulaci&oacute;n de denuncias {elseif $c.post_status == 2} El post se encuentra eliminado {elseif $c.c_status == 1} El comentario est&aacute; oculto{elseif $c.user_activo == 0}El autor del comentario tiene la cuenta desactivada{elseif $c.user_baneado == 1}El autor del comentario tiene la cuenta suspendida{/if}">{$c.user_name}</strong></a>
		{else}
		<a href="{$tsConfig.url}/perfil/{$c.user_name}/"><strong>{$c.user_name}</strong></a> 
		{/if}
		<a href="{$tsConfig.url}/posts/{$c.c_seo}/{$c.post_id}/{$c.post_title|seo}.html#comentarios-abajo" class="size10">
		{$c.post_title|truncate:45}</a> <br /> <br />
	</li>
	{/foreach}
</ol>

                  </ul>
                </div>
              </div>
              
              </div>