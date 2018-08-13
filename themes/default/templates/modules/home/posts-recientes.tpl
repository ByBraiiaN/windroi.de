<div class="col-md-8">
<section class="postHome">
  {if $tsPosts}
    <div class="box box-info">
                <div class="box-header with-border">
                  <h1 class="box-title">&Uacute;ltimos Posts</h1>
                  <div class="box-tools pull-right">
                    <span class="pull-right">  {include file='sections/head_categorias.tpl'}</span>
                  </div>
                </div>
                <div class="box-body">
                  <div class="table-responsive">
                    <table class="table no-margin">
                      {if $tsPostsStickys}<tbody>
                                   {foreach from=$tsPostsStickys item=p} 
                                  <tr>
                <td{if $p.post_status == 3} style="background-color:coral;"{elseif $p.post_status == 2}style="background-color:rosyBrown;"{elseif $p.user_activo == 0}style="background-color:burlyWood;"{elseif $p.user_baneado == 1}style="background-color:orange;"{/if}><img style=" margin-right: 7px;"  src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}" alt="icono {$p.c_nombre}" />
                    <a {if $p.post_status == 3} class="qtip" title="El post está en revisión" {elseif $p.post_status == 1} class="qtip" title="El post se encuentra en revisión por acumulación de denuncias" {elseif $p.post_status == 2} class="qtip" title="El post está eliminado" {elseif $p.user_activo == 0} class="qtip" title="La cuenta del usuario está desactivada" {/if} class="qtip" title="{$p.post_title}" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html" target="_self">{$p.post_title|truncate:40}</a>
                </td> 
                  <td><span><a href="{$tsConfig.url}/posts/{$p.c_seo}/" title="{$p.c_nombre}" class="k c{$p.post_category}">{$p.c_nombre}</a></span></td>
                       
                </tr>
                {/foreach}{/if}  </tbody>
                      {foreach from=$tsPosts item=p}
                      <tbody>
                        <tr>
                        
                          <td><img style="margin-right: 7px;" src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}" alt="icono {$p.c_nombre}" />
                          
                          <a {if $p.post_status == 3} class="qtip" title="El post est&aacute; en revisi&oacute;n" {elseif $p.post_status == 1} class="qtip" title="El post se encuentra en revisi&oacute;n por acumulaci&oacute;n de denuncias" {elseif $p.post_status == 2} class="qtip" title="El post est&aacute; eliminado" {elseif $p.user_activo == 0} class="qtip" title="La cuenta del usuario est&aacute; desactivada" {elseif $p.user_baneado == 1} class="qtip" title="La cuenta del usuario est&aacute; suspendida">{/if} </a> {if $p.post_private}<a class="pull-right qtip" title="{if $p.post_private}categoria privado{/if}"><i class="fa fa-lock text-muted"></i></a>{/if}<a class="qtip" title="{$p.post_title}" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:45}</a></td>
                          <td><span><a href="{$tsConfig.url}/posts/{$p.c_seo}/" title="{$p.c_nombre}" class="k c{$p.post_category}">{$p.c_nombre}</a></span></td>
                        </tr>
                        
                      </tbody>{/foreach}
                    </table>
                  </div>
                </div>
  {include file="modules/global/m.global_ads_728.tpl"}
                <div class="box-footer clearfix">
                  <div class="paginador">
    {if $tsPages.prev > 0 && $tsPages.max == false}
    <a class="btn bg-navy margin" href="pagina{$tsPages.prev}">Anterior</a>
    {/if}
    {if $tsPages.next <= $tsPages.pages}
    <a class="btn bg-olive margin" href="pagina{$tsPages.next}">Siguiente</a>
    {elseif $tsPages.max == true}
    <a class="btn bg-orange margin" href="pagina2">Siguiente</a>
    {/if}
    </div>
            
                </div>
              </div>
              
		{else}
        <div class="box box-danger direct-chat direct-chat-danger">
            <div class="box-header with-border">
                  <h3 class="box-title">&Uacute;ltimos Posts</h3>
                  <div class="box-tools pull-right">
                    <span class="pull-right">  {include file='sections/head_categorias.tpl'}</span>
                  </div>
                </div>
        <div class="table-responsive">
                    	<div style="padding:8px;margin-left:40%;">No hay posts aquí</div>
                  </div>
		
		{/if}
  
</section>

</div>
                