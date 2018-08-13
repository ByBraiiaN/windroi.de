{include file='sections/main_header.tpl'}
<img style="width:100%;max-height:320px" src="{$tsPost.post_imgport}" />
<section style="margin-top:-10%" class="content">
{if $tsPost.post_status > 0 || $tsAutor.user_activo != 1}

<div class="alert alert-danger alert-dismissable">
                    <h4><i class="icon fa fa-ban"></i> Atenci&oacute;n!</h4>
                  	Este post se encuentra {if $tsPost.post_status == 2}
                    eliminado{elseif $tsPost.post_status == 1} 
                    inactivo por acomulación de denuncias{elseif $tsPost.post_status == 3} 
                    en revisi&oacute;n{elseif $tsPost.post_status == 3} 
                    en revisi&oacute;n{elseif $tsAutor.user_activo != 1} 
                    oculto porque pertenece a una cuenta desactivada{/if}, 
                    t&uacute; puedes verlo porque {if $tsUser->is_admod == 1}
                    eres Administrador{elseif $tsUser->is_admod == 2}
                    eres Moderador{else}tienes permiso{/if}.
                  </div>
{/if}
<div class="col-md-9" style="padding-right: 0px;padding-left: 0px;">
{include file='modules/posts/m.posts_content.tpl'}
{include file='modules/posts/m.posts_metadata.tpl'}
<div class="center">{include file="modules/global/m.global_ads_728.tpl"}</div><br>

				<div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a>
                            Comentarios {$tsPost.post_comments}
                          </a>
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in" aria-expanded="true">
                        <div class="box-body" id="comentarios-abajo">
                         {include file='modules/posts/m.posts_comments.tpl'}
                        </div>
                      </div>
                    </div>
</div>
 
<aside>
<div class="row">
<div class="col-md-3">
{include file='modules/posts/m.posts_autor.tpl'}
</div>

<div class="col-md-3"><div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title">
                        
                            Anuncio
                         
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in" aria-expanded="true">
                        <div class="box-body">
{include file='modules/global/m.global_ads_300.tpl'}
                        </div>
                      </div>
                    </div></div> 
                    
<div class="col-md-3"><div class="panel box box-primary">
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" class="">
                            Posts Relacionados
                          </a>
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in" aria-expanded="true">
                        <div class="box-body">
{include file='modules/posts/m.posts_related.tpl'}
                        </div>
                      </div>
                    </div></div>
</div></aside></section>

{if !$tsUser->is_member}
<section class="content" style="min-height:0px;">
<div class="row">
<div class="col-md-12">
<div class="callout callout-danger">
                    <h4>Para poder comentar necesitas estar </h4>
                    <p> <a onclick="registro_v5_toup(); return false" href="/registro/">Registrado.</a> O.. ya tienes usuario? </p>
                    <p>  <a onclick="open_login_box('open')" href="/login/">Logueate!</a></p>
                  </div>
{elseif $tsPost.block > 0}
<p class="emptyData">
	Te has portado mal? {$tsPost.user_name} te ha bloqueado y no podrás comentar sus post.
</p>
{/if}
</div></div></section>
{include file='sections/main_footer.tpl'}