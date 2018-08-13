<div class="box box-warning">

    <div class="box-header with-border "><h2 class="box-title">{$tsTema.t_titulo} ({$tsTema.t_fecha|hace})</h2></div>


<div class="box-body">

{$tsTema.t_cuerpo}
<hr>
<div class="postEstadisticas">
 Visitas: <span class="label label-primary" style="margin-right:5px">{$tsTema.t_visitas|number_format:0:',':'.'} </span>
 Favoritos: <span class="label label-primary" style="margin-right:5px">{$tsTema.t_favoritos|number_format:0:',':'.'} </span>
 Seguidores: <span class="label label-primary" style="margin-right:5px">{$tsTema.t_seguidores|number_format:0:',':'.'} </span>
 Calificaci&oacute;n: <span style="color:{if $tsTema.t_votos_pos-$tsTema.t_votos_neg > 0}green{elseif $tsTema.t_votos_pos-$tsTema.t_votos_neg < 0}red{else}#222{/if}">{$tsTema.t_votos_pos-$tsTema.t_votos_neg|number_format:0:',':'.'}</span>
</div>
<div style="float:right">
    <span >Compartir en:</span>
        <a href="{if !$tsUser->is_member}javascript:registro_load_form(); return false{else}javascript:notifica.sharePost({$tsTema.t_id}){/if}" class="btn btn-primary btn-sm qtip" title="Compartir en {$tsConfig.titulo}"><i class="fa fa-cube"></i></a>
		<a class="btn btn-danger btn-sm qtip"  title="Compartir via Google+" href="https://plus.google.com/share?url={$tsConfig.url}/comunidades/{$tsTema.c_nombre_corto}/{$tsTema.t_id}/{$tsTema.t_titulo|seo}.html" onclick="javascript:window.open(this.href,'','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;"><i class="fa fa-google"></i></a>      
	    <a class="btn btn-info btn-sm qtip"  title="Compartir via Twitter" href="javascript:void(0)" onClick=" window.open('https://twitter.com/share?url={$tsConfig.url}/comunidades/{$tsTema.c_nombre_corto}/{$tsTema.t_id}/{$tsTema.t_titulo|seo}.html&text=Viendo... {$tsPost.post_title}','1379507726816','width=580,height=325,toolbar=0,menubar=0,location=0,status=0,scrollbars=0,resizable=0,left=0,top=0');return false;"><i class="fa fa-twitter"></i></a>
	    <a class="btn btn-primary btn-sm qtip" title="Compartir via Facebook" id="fb-share" style='text-decoration:none;' type="icon_link" onClick="window.open('http://www.facebook.com/sharer.php?s=100&amp;p[title]={$tsTema.t_titulo|seo}&amp;p[summary]=Se el primero en entrar!&amp;p[url]={$tsConfig.url}/comunidades/{$tsTema.c_nombre_corto}/{$tsTema.t_id}/{$tsTema.t_titulo|seo}.html&amp;p[images][0]=','sharer','toolbar=0,status=0,width=580,height=325');" href="javascript:void(0)"><i class="fa fa-facebook"></i></a>
</div>   
</div>
</div>


{if $tsUser->is_member && $tsTema.t_autor != $tsUser->uid}
<div class="box box-danger">
            <div class="box-header with-border">
              <h3 class="box-title">Interactuar con el post</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="">

	

	<a href="javascript:com.votar_tema('pos');"  class="btn btn-success">+1</a>

    <a href="javascript:com.votar_tema('neg');"  class="btn btn-danger">-1</a>

    <a href="javascript:com.seguir_tema();"  class="btn btn-success" id="follow_tema" {if $tsTema.es_seguidor}style="display:none"{/if}>Seguir</a>

    <a href="javascript:com.seguir_tema();"  class="btn btn-success ibg" id="unfollow_tema" style="{if !$tsTema.es_seguidor}display:none{/if}">Siguiendo</a>

    <a href="javascript:com.seguir_tema();"  class="btn btn-danger ibr" id="unfollow_temar" style="display:none;padding: 7px 10px;">Dejar de seguir</a>

    <a href="javascript:com.add_favorito();"  class="btn btn-warning add_favorito" {if $tsTema.mi_fav}style="display:none;"{/if} title="A&ntilde;adir a mis favoritos">+FAV</a>

    <a onclick="ontemadelfavorito();"  class="btn btn-warning ibg add_favorito" {if !$tsTema.mi_fav}style="display:none;"{/if} title="Lo tienes en tus favoritos">Quitar de favoritos</a>

    
            </div>
            <!-- /.box-body -->
          </div>{/if}





