    <div class="box box-info">
      <div class="box-body" style="padding: 0px;">
                  <div class="row">
                    <div class="col-xs-12">
    <div class="post-metadata floatL">
    	<div style="display:none" class="mensajes"></div>
    </div>
	{if ($tsUser->is_admod || $tsUser->permisos.godp) && $tsUser->is_member == 1 && $tsPost.post_user != $tsUser->uid && $tsUser->info.user_puntosxdar >= 1}
	{if $tsPunteador.rango >= 50}
    <input type="text" id="points" value="{$tsPunteador.rango}"> 	
    <input type="submit" onclick="votar_post(document.getElementById('points').value); return false;" value="Votar" class="boton">  
    {else}
  
    <ul class="darPuntos">
      {if $tsPost.puntos && ($tsPost.post_user == $tsUser->uid || $tsUser->is_admod)}
    <div style="display:none;" id="ver_puntos" class="userPuntua">
        {foreach from=$tsPost.puntos item=p}
        <a  id="entra" href="{$tsConfig.url}/perfil/{$p.user_name}"><img src="{$tsConfig.url}/files/avatar/{$p.user_id}_50.jpg" class="qtip" title="{$p.user_name} ha dejado {$p.cant} puntos" width="32" height="32"/></a>
    	{/foreach}
    </div>
    <img class="verUserPuntua" title="Puntos entregados" onclick="$('#ver_puntos').slideToggle(); return false" src="{$tsConfig.tema.t_url}/images/markit-menu.png"/>
    {/if}
        <li class="text-muted">Dar Puntos:</li></br>
        
        {section name=puntos start=1 loop=$tsUser->info.user_puntosxdar+1 max=$tsPunteador.rango}
        
        <li><a href="#" onclick="votar_post({$smarty.section.puntos.index}); return false;">{$smarty.section.puntos.index}</a> {if $smarty.section.puntos.index < $tsPunteador.rango}{/if}</li>
        {/section}
        {/if}
        <div class="pull-right" style="margin-right: 24px;">
        <li class="text-muted">(+.. {$tsPost.post_puntos} Puntos)</li></div>
        {/if}
    </ul></div></div></div>
        <hr />
  
    <div class="box-body" style="padding: 0px;">
                  <div class="row">
                    <div class="col-xs-12">
  
    <ul class="segAgrDen">
        {if !$tsUser->is_member}
        <li>
        	<a class="btn_g follow_user_post boton2" href="#" onclick="registro_v5_toup(); return false">
        	<span class="icons follow_post follow">Seguir Post</span>
            </a>
        </li>
        {elseif $tsPost.post_user != $tsUser->uid}
        <li {if !$tsPost.follow} style="display: none;"{/if}>
        	<a class="btn_g unfollow_post  boton2" onclick="notifica.unfollow('post', {$tsPost.post_id}, notifica.inPostHandle, $(this).children('span'))">
        	<span class="icons follow_post unfollow">Dejar de seguir</span>
            </a>
        </li>
        <li {if $tsPost.follow > 0} style="display: none;"{/if}>
        	<a class="btn_g follow_post boton2" onclick="notifica.follow('post', {$tsPost.post_id}, notifica.inPostHandle, $(this).children('span'))">
        	<span class="icons follow_post follow">Seguir Post</span>
            </a>
        </li>
        <li><a href="#" class="btn_g boton2" onclick="{if !$tsUser->is_member}registro_v5_toup(){else}add_favoritos(){/if}; return false" >
        	<span class="icons agregar_favoritos">Agregar a Favoritos</span>
            </a>
        </li>
        <li>
        	<a href="#" class="btn_g boton2" onclick="denuncia.nueva('post',{$tsPost.post_id}, '{$tsPost.post_title}', '{$tsPost.user_name}'); return false;">
            <span class="icons denunciar_post">Denunciar</span>
            </a>
        </li>
        {/if}
    </ul></div></div></div>
   <hr />
       <div class="box-body" style="padding: 0px;">
                  <div class="row">
                    <div class="col-xs-6">
                    <div class="pull-left">
    <ul class="tagPost">
    	<li class="text-muted">Tags:</li><br />
    	{foreach from=$tsPost.post_tags key=i item=tag}
    		<li><a rel="tag" href="{$tsConfig.url}/buscador/?q={$tag|seo}&e=tags">{$tag}</a></li> 
        	{if $i < $tsPost.n_tags}{/if}
    	{/foreach}
    </ul></div></div>
    
    <div class="row">
      <div class="col-md-6">
    <div class="pull-right">
      <ul class="postEstadisticas">
        <!--<li><header>Medalla{if $tsPost.m_total != 1}s{/if}</header><span>{$tsPost.m_total}</span></li>-->
        <li>Favoritos<span><span style="margin-left:4px;" class="label label-primary ">{$tsPost.post_favoritos}</span></span></li>
        <li>Visitas<span style="margin-left:4px;" class="label label-primary ">{$tsPost.post_hits}</span></li>
       
        <li>Seguidores<span style="margin-left:4px;" class="label label-primary ">{$tsPost.post_seguidores}</span></li>
    </ul></div></div></div></div></div><br />
    
    </div>
    
