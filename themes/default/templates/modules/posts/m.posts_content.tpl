<div class="panel box box-primary">
                      <div class="box-header with-border anuncio">
                          
                        <article>
                        <h1 class="box-title">
                          <a class="qtip" title="{$tsPost.post_title}">
                            {$tsPost.post_title|truncate:60}
                          </a>
                        </h1>
                        
                           <div class="pull-right">                       
     {if $tsUser->is_admod || $tsUser->permisos.most}
            | <a href="#" onclick="mod.reboot({$tsPost.post_id}, 'posts', 'sticky', false); if($(this).text() == 'Poner Sticky') $(this).text('Quitar Sticky'); else $(this).text('Poner Sticky'); return false;">{if $tsPost.post_sticky == 1}Quitar{else}Poner{/if} Sticky</a> | {/if}
            {if $tsUser->is_admod || $tsUser->permisos.moayca}
            <a href="#" onclick="mod.reboot({$tsPost.post_id}, 'posts', 'openclosed', false); if($(this).text() == 'Cerrar Post') $(this).text('Abrir Post'); else $(this).text('Cerrar Post'); return false;">{if $tsPost.post_block_comments == 1}Abrir{else}Cerrar{/if} Post</a> | {/if}
            {if $tsUser->is_admod || $tsUser->permisos.moop}
            <a id="desaprobar" href="#" onclick="$('#desapprove').slideToggle(); $(this).fadeOut().remove();">Ocultar Post</a> | {/if}
            {if $tsUser->is_admod || $tsUser->permisos.moedpo || $tsAutor.user_id == $tsUser->uid}
            <a href="{$tsConfig.url}/posts/editar/{$tsPost.post_id}">Editar</a> | {/if}
            {if $tsUser->is_admod || $tsUser->permisos.moep || $tsAutor.user_id == $tsUser->uid}
            <a href="#" onclick="{if $tsAutor.user_id != $tsUser->uid}mod.posts.borrar({$tsPost.post_id}, 'posts', null);{else}borrar_post();{/if} return false;">Borrar</a> | {/if}

                            </div>
                      </div>
                      <br/>{include file="modules/global/m.global_ads_728.tpl"}
                      <div id="collapseOne" class="panel-collapse collapse in" aria-expanded="true">
                        <div class="box-body"><div class="post-contenido">
                         <p>{$tsPost.post_body}</p>
                        </article>
                         
						 <div style="float:left;margin-top:16px">
                                    <span >Compartir en:</span>

									<a href="{if !$tsUser->is_member}javascript:registro_load_form(); return false{else}javascript:notifica.sharePost({$tsPost.post_id}){/if}" class="btn btn-primary btn-sm qtip" title="Compartir en {$tsConfig.titulo}"><i class="fa fa-cube"></i></a>
										<a class="btn btn-danger btn-sm qtip"  title="Compartir via Google+" href="https://plus.google.com/share?url={$tsConfig.url}/posts/{$tsPost.categoria.c_seo}/{$tsPost.post_id}/{$tsPost.post_title|seo}.html" onclick="javascript:window.open(this.href,'','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;"><i class="fa fa-google"></i></a>      
										<a class="btn btn-info btn-sm qtip"  title="Compartir via Twitter" href="javascript:void(0)" onClick=" window.open('https://twitter.com/share?url={$tsConfig.url}/posts/{$tsPost.categoria.c_seo}/{$tsPost.post_id}/{$tsPost.post_title|seo}.html&text=Viendo... {$tsPost.post_title}','1379507726816','width=580,height=325,toolbar=0,menubar=0,location=0,status=0,scrollbars=0,resizable=0,left=0,top=0');return false;"><i class="fa fa-twitter"></i></a>
										<a class="btn btn-primary btn-sm qtip" title="Compartir via Facebook" id="fb-share" style='text-decoration:none;' type="icon_link" onClick="window.open('https://www.facebook.com/sharer.php?s=100&amp;p[title]={$tsPost.post_title}&amp;p[summary]=Se el primero en entrar!&amp;p[url]={$tsConfig.url}/posts/{$tsPost.categoria.c_seo}/{$tsPost.post_id}/{$tsPost.post_title|seo}.html&amp;p[images][0]=','sharer','toolbar=0,status=0,width=580,height=325');" href="javascript:void(0)"><i class="fa fa-facebook"></i></a>
								</div></div>
                          <div class="pull-right">
                         	<strong id="ft">Categor&iacute;a:</strong>  <a id="ft" href="{$tsConfig.url}/posts/{$tsPost.categoria.c_seo}/">{$tsPost.categoria.c_nombre}</a> 
    	<strong id="ft">Creado:</strong><span id="ft"> {$tsPost.post_date}.</span>
       
                      <a class="qtip" title="Anterior" href="{$tsConfig.url}/posts/prev?id={$tsPost.post_id}"><button class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button></a>
                      <a class="qtip" title="Siguiente" href="{$tsConfig.url}/posts/next?id={$tsPost.post_id}"><button class="btn btn-default btn-sm"><i class="fa fa-share"></i></button></a>
                      <a class="qtip" title="Aleratorio"  href="{$tsConfig.url}/posts/fortuitae"><button class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button></a>
                    </div>
                    
                    </div>
                
                      
                       {if $tsPost.user_firma && $tsConfig.c_allow_firma}
                             <hr />
<div class="box-body">
                  <div class="row">
                    <div class="col-xs-12">
                       <span class="contPost">
            {$tsPost.user_firma}
        </span>
                    </div>  
                  </div>
                </div>
      <br /> 
        {/if}                  
                     
	<section>

    {*if $tsPost.post_user == $tsUser->uid && $tsUser->is_admod == 0 && $tsUser->permisos.most == false && $tsUser->permisos.moayca == false && $tsUser->permisos.moo == false && $tsUser->permisos.moep ==  false && $tsUser->permisos.moedpo == false}
        <div class="floatR">
            <a title="Borrar Post" onclick="borrar_post(); return false;" href="" class="btnActions">
            <img alt="Borrar" src="{$tsConfig.images}/borrar.png"/> Borrar</a>
            <a title="Editar Post" onclick="location.href='{$tsConfig.url}/posts/editar/{$tsPost.post_id}'; return false" href="" class="btnActions">
            <img alt="Editar" src="{$tsConfig.images}/editar.png"/> Editar</a>
        </div>
        {elseif ($tsUser->is_admod && $tsPost.post_status == 0) || $tsUser->permisos.most || $tsUser->permisos.moayca || $tsUser->permisos.moop || $tsUser->permisos.moep || $tsUser->permisos.moedpo}
      
        <div id="desapprove" style="display:none;">
            <span style="display: none;" class="errormsg"></span>
            <input class="form-control" type="text" id="d_razon" name="d_razon" maxlength="150" size="60" class="text-inp" placeholder="Raz&#243;n de la revisi&#243;n" required />
            <input type="button" class="mBtn btnDelete" name="desapprove" value="Continuar" href="#" onclick="mod.posts.ocultar('{$tsPost.post_id}'); return false;"/>
        </div>
        {/if*}
       
        
        
    </section>	
                     
    </div>
</div>