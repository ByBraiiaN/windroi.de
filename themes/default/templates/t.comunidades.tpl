{include file='sections/main_header.tpl'}
<style>
    {literal}
    /* ICONOS */
    i.com_icon {
	display: inline-block;
	margin: 0 10px 0 0;
	width: 16px;
	height: 16px;
	background: url({/literal}{$tsConfig.tema.t_url}{literal}/images/com/com_icons.png) no-repeat;
}
i.com_icon.icon_editar {background-position: -19px -101px;}
i.com_icon.icon_comment {background-position: -239px -136px;}
i.com_icon.icon_like {background-position: -153px -34px;}
i.com_icon.icon_dislike {background-position: -170px -34px;}
i.com_icon.icon_eye {background-position: -102px -35px;}
i.com_icon.icon_favs {background-position: -136px -34px;}
i.com_icon.icon_visitas {background-position: -119px -34px;}
i.com_icon.icon_hand_up {background-position: -170px -136px;}
i.com_icon.icon_denuncia {background-position: -253px -137px;}
i.com_icon.icon_reply {background-position: -139px -196px;}
i.com_icon.icon_del {background-position: -170px -102px;}
i.com_icon.icon_bloquear {background-position: -187px -102px;}
i.com_icon.icon_denunciar {background-position: -157px -196px;}
i.com_icon.icon_puntos {background-position: -85px -34px;}
i.com_icon.icon_temas {background-position: -51px -51px;}
i.com_icon.icon_comentarios {background-position: 0 -50px;}
i.com_icon.icon_eye.spinner {background: url({/literal}{$tsConfig.tema.t_url}{literal}/images/com/ajax-loader.gif) no-repeat;background-position: 0;}
i.com_icon.icon_sticky {background-position: -221px -51px;}
i.com_icon.interes-general{background-position:-153px -68px}
i.com_icon.internet-tecnologia{background-position:-169px -68px}
i.com_icon.internet-technology{background-position:-169px -68px}
i.com_icon.regiones{background-position:-186px -68px}
i.com_icon.diversion-esparcimiento{background-position:-86px -85px}
i.com_icon.musica-bandas{background-position:-153px -85px}
i.com_icon.grupos-organizaciones{background-position:-102px -85px}
i.com_icon.entretenimiento-medios,i.icon.tv-peliculas-series{background-position:-170px -85px}
i.com_icon.deportes{background-position: -119px 0;}
i.com_icon.economia-negocios{background-position: -187px 0;}
i.com_icon.arte-literatura{background-position: -34px 0;}
i.com_icon.icon_like {background-position: -153px -51px;}
i.com_icon.icon_dislike {background-position: -170px -51px;}

{/literal}
</style>
<section class="content">
	<script type="text/javascript">
    // {literal}
    var global_com = {
    // {/literal}
        comid:'{$tsCom.c_id}',
        temaid:'{$tsTema.t_id}',
    // {literal}
    };
    // {/literal}
    </script>  	
	<script type="text/javascript" src="{$tsConfig.js}/comunidades.js"></script>  
    
    {if $tsCom.c_id}
		<body style="background-color: #{$tsCom.c_back_color};background-repeat: {if $tsCom.c_back_repeat}repeat{else}no-repeat{/if};">
	{/if}
    {if $tsTema.t_estado == 1}
    <div class="alert alert-danger">Este tema est&aacute; eliminado</div>
    {/if}
    
    {if $tsAction == '' || $tsAction == 'home'}	<div class="row">
    	<div class="col-md-8">
    		{include file='comunidades/c.inicio_left.tpl'}
            
        </div>
        <div class="col-md-4">
        	{include file='comunidades/c.inicio_right.tpl'}
            <br class="spacer"/>
            {include file='modules/global/m.global_ads_160.tpl'}
        </div></div>
    {elseif $tsAction == 'crear' || $tsAction == 'editar'}    <div class="row">
		<form action="" method="post" id="add_new_com" enctype="multipart/form-data">
            <div class="col-md-8">
            	{include file='comunidades/c.crear_left.tpl'}
            </div>
            <div class="col-md-4">
            	{include file='comunidades/c.crear_right.tpl'}
            </div>
        </form></div>
    {elseif $tsAction == 'agregar' || $tsAction == 'editar-tema'}
    	{include file='comunidades/c.agregar_tema.tpl'}
    {elseif $tsAction == 'tema'}
    <script>
        {literal}
        function ontemadelfavorito() {
        mydialog.alert('No tan rapido!', 'Dirigete a tus favoritos para eliminar este tema de tus favoritos.');
        }
        
        {/literal}
    </script>
    <div class="row">
    	<div class="col-md-8">
    	    {include file='comunidades/c.com_info.tpl'}
            {include file='comunidades/c.tema_cuerpo.tpl'}
            {include file='comunidades/c.tema_comentarios.tpl'}
        </div>
        <div class="col-md-4">
                        
        	{include file='comunidades/c.tema_autor.tpl'}
        </div>
        </div>
    {elseif $tsAction == 'mis-comunidades'}
    <div class="row">
    	<div class="col-md-8">
            {include file='comunidades/c.mis-comunidades_left.tpl'}
        </div>
        <div class="col-md-4">
        	{include file='comunidades/c.mis-comunidades_right.tpl'}
        </div></div>
    
            
    {elseif $tsAction == 'miembros'}<div class="row">
    	<div class="col-md-8">
            {include file='comunidades/c.miembros_left.tpl'}
        </div>
        <div class="col-md-4">
        	{include file='comunidades/c.miembros_right.tpl'}
        </div></div>
    {elseif $tsAction == 'dir'}
    	<div class="col-md-8">
	    	{include file='comunidades/c.directorio_left.tpl'}
        </div>
        <div class="col-md-4">
	    	{include file='comunidades/c.directorio_right.tpl'}
        </div>
    {elseif $tsAction == 'mod-history'}
	    {include file='comunidades/c.historial.tpl'}
    {elseif $tsAction == 'com-mod-history'}
	    {include file='comunidades/c.com_historial.tpl'}
    {elseif $tsAction == 'buscar'}
        <div class="col-md-8">
            {include file='comunidades/c.buscar_left.tpl'}
        </div>
        <div class="col-md-4">
            {include file='comunidades/c.buscar_right.tpl'}
        </div>
	{elseif $tsAction == 'favoritos'}
    	{if $tsFavoritos.data}
        <div class="col-md-8">
            {include file='comunidades/c.favoritos_left.tpl'}
        </div>
        <div class="col-md-4">
            {include file='comunidades/c.favoritos_right.tpl'}
        </div>
        {else}
        <div class="alert alert-info">No has agregado temas a tus favoritos a&uacute;n</div>
        <br>
        {/if}
    {elseif $tsAction == 'borradores'}
    	{if $tsBorradores.data}
        <div class="col-md-8">
            {include file='comunidades/c.borradores_left.tpl'}
        </div>
        <div class="col-md-4">
            {include file='comunidades/c.borradores_right.tpl'}
        </div>
        {else}
        <div class="alert alert-info">No tienes ning&uacute;n borrador a&uacute;n</div>
        <br>
        {/if}
    {else}<div class="row">
    <section class="content-header">
      <ol class="breadcrumb">
    	<li><a href="{$tsConfig.url}/comunidades/">Comunidades</a></li>

        <li><a href="{$tsConfig.url}/comunidades/home/{$tsCom.cat.c_seo}/">{$tsCom.cat.c_nombre}</a></li>

        {if $tsTema.t_id > 0}

        <li><a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/">{$tsCom.c_nombre}</a></li>

        <li>{$tsTema.t_titulo}</li>

        {else}

        <li>{$tsCom.c_nombre}</li>

        {/if}
      </ol>
    </section>
        <div class="col-md-3">
            {include file='comunidades/c.com_info.tpl'}{include file='comunidades/c.com_right.tpl'}
        </div>
        <div class="col-md-9"> 
        {if $tsCom.c_autor == $tsUser->uid || $tsUser->is_admod}<a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/editar/" class="btn btn-primary"><i class="com_icon icon_editar"></i>Editar</a>{/if}



                {if $tsUser->is_member}
{if $tsCom.es_miembro && $tsCom.mi_rango > 2}<a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/agregar/" class="btn btn-primary ibg">Nuevo tema</a>{/if}

                <a href="#" class="btn btn-primary" id="follow_com" {if $tsCom.es_seguidor}style="display:none"{/if} onclick="com.seguir_com();return false;"><i class="com_icon icon_eye"></i>Seguir</a>

                <a href="#" class="btn btn-success ibg" id="unfollow_com" style="{if !$tsCom.es_seguidor}display:none{/if}" onclick="com.seguir_com();return false;"><i class="com_icon icon_eye"></i>Siguiendo</a>

                <a href="#" class="btn btn-danger ibr" id="unfollow_comr" style="display:none" onclick="com.seguir_com();return false;">Dejar de seguir</a>

                <a class="btn btn-danger" href="#" onclick="denuncia.nueva('comunidad',{$tsCom.c_id}, '{$tsCom.c_nombre}', ''); return false;">Denunciar Comunidad</a>
                
                <a class="btn btn-primary" href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/mod-history/">Historial</a>
                {/if}
        	{include file='comunidades/c.com_temas.tpl'}
        </div>
    </div>{/if}
    </section>
	{include file='sections/main_footer.tpl'}