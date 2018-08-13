<div class="box box-primary">
    <div class="box-header with-border "><h2 class="box-title">Autor del post</h2></div>
	<div class="box-body text-center">
		<a href="{$tsConfig.url}/perfil/{$tsAutor.user_name}">
			<img class="img-circle" src="{$tsConfig.url}/files/avatar/{$tsAutor.user_id}_120.jpg" alt="Imagen del autor">
			</a>
			<a href="{$tsConfig.url}/perfil/{$tsAutor.user_name}">
				<h3 title="Nombre">{$tsAutor.user_name}</h3>
			</a>
			
				<h5 title="Rango"><img src="{$tsConfig.default}/images/icons/ran/{$tsAutor.rango.r_image}" class="qtip" title="{$tsAutor.rango.r_name}" /> {$tsAutor.rango.r_name}</h5>
			
        {if !$tsUser->is_member}

                <a href="#" class="btn btn-primary" onclick="registro_load_form(); return false"><i class="com_icon icon_eye"></i>Seguir Usuario</a>

                {elseif $tsAutor.user_id != $tsUser->uid}

                <a href="#" class="btn btn-primary follow_user_post" id="follow_user" {if $tsAutor.follow > 0}style="display:none"{/if} onclick="notifica.follow('user', {$tsAutor.user_id}, notifica.userInPostHandle, $(this).children('i'))"><i class="com_icon icon_eye"></i>Seguir</a>
                <a href="#" class="btn btn-primary ibg unfollow_user_post" id="unfollow_user" style="{if !$tsAutor.follow}display: none{/if}" onclick="notifica.unfollow('user', {$tsAutor.user_id}, notifica.userInPostHandle, $(this).children('i'))" title="Dejar de seguir"><i class="com_icon icon_eye"></i>Siguiendo</a>

                {/if}
		</div> 
	</div>


{if $tsAutor.user_id == $tsUser->uid || $tsCom.mi_rango >= 4 || $tsUser->is_admod}

<div class="box box-warning">
    <div class="box-header with-border "><h2 class="box-title">Opciones</h2></div>

    <div class="box-body ">

        {if $tsTema.t_estado == 1}

        	<a href="javascript:com.reactivar_tema();" class="btn btn-primary"><i class="com_icon icon_editar"></i>Reactivar</a>

        {else}

            <a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/editar-tema/{$tsTema.t_id}/" class="btn btn-primary">Editar</a>

            {if $tsAutor.user_id == $tsUser->uid}

            <a href="javascript:com.del_tema();" class="btn btn-primary ibr">Eliminar</a>

            {else}

            <a href="javascript:com.del_mod_tema();" class="btn btn-primary ibr">Eliminar</a>

            {/if}
        {/if}
    </div>
</div>
{/if}

<div class="box box-warning">
    <div class="box-header with-border "><h4 class="box-title">Comentarios recientes</h4></div>

    <div class="box-body ">
    	{if $tsLastRespuestas}
        {foreach from=$tsLastRespuestas item=r}
        <div class="com_list_element"><a class="cle_autor" href="{$tsConfig.url}/perfil/{$r.user_name}">{$r.user_name} </a> en <a class="cle_title" href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/{$r.t_id}/{$r.t_titulo|seo}.html#coment_id_{$r.r_id}">{$r.t_titulo|limit:30}</a></div>

        {/foreach}
        {else}
        <div class="alert alert-info">No hay comentarios recientes</div>
        {/if}
    </div>
</div>

{include file='modules/global/m.global_ads_300.tpl'}

<div class="box box-warning">
    <div class="box-header with-border "><h4 class="box-title">Extras</h4></div>
    <div class="box-body ">
 <a class="btn btn-primary" href="#" onclick="denuncia.nueva('tema',{$tsTema.t_id}, '{$tsTema.t_titulo}', '{$tsAutor.user_name}'); return false;">Denunciar Tema</a>
 <a class="btn btn-primary" href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/mod-history/">Historial</a>
    </div>
</div>