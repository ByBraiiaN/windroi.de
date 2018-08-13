<div class="box box-success">                
<section class="perfil-user">
   <div class="box-body">
	<div class="perfil-data">
    <div class="col-md-3">
		<div class="perfil-avatar rotate">
			<a href="{$tsConfig.url}/perfil/{$tsInfo.nick}"><img alt="" src="{$tsConfig.url}/files/avatar/{if $tsInfo.p_avatar}{$tsInfo.uid}_120{else}avatar{/if}.jpg"/></a>
		</div><br />
               {if $tsUser->uid != $tsInfo.uid && $tsUser->is_member}
            <a class="btn btn-danger unfollow_user_post" onclick="notifica.unfollow('user', {$tsInfo.uid}, notifica.userInPostHandle, $(this).children('span'))" {if $tsInfo.follow == 0}style="display: none;"{/if}>
            <span class="icons unfollow ">Dejar de seguir</span></a>
            <a class="btn btn-warning follow_user_post" onclick="notifica.follow('user', {$tsInfo.uid}, notifica.userInPostHandle, $(this).children('span'))" {if $tsInfo.follow == 1}style="display: none;"{/if}>
            <span class="icons follow ">Seguir Usuario</span></a>
			{/if}
        
        </div>
        <div class="col-md-9">
		<header class="perfil-info">
			<h3 class="text-light-blue"><i style="margin-right: 5px;" class="fa fa-user"></i>{$tsInfo.nick}</h3>
           
            <span class="realname">{$tsInfo.p_nombre}</span>
			<span class="frase-personal">{$tsInfo.p_mensaje}</span>
			<p class="text-muted">
            	<span>
            	{if $tsInfo.p_nombre != ''}{$tsInfo.p_nombre} es {else}Es {/if}
                {if $tsInfo.user_sexo == 1}un hombre{else}una mujer{/if}. </p>
                </span>
                    <p  class="text-muted">
                <span>Vive en </span>
            
                <span id="info_pais"> {$tsInfo.user_pais}</span>
                <span> 
                    y se unió a la familia de {$tsConfig.titulo} 
                    el {$tsInfo.user_registro|fecha:true}. 
                    {if $tsInfo.p_empresa}Trabaja en {$tsInfo.p_empresa}{/if}
                </span>
			</p>
 
      
            {if $tsUser->uid != $tsInfo.uid && $tsUser->is_member}
            <span class="ex_opts">
                <a href="javascript:bloquear({$tsInfo.uid}, {if $tsInfo.block.bid}false{else}true{/if}, 'perfil')" id="bloquear_cambiar">
                {if $tsInfo.block.bid}Desbloquear{else}Bloquear{/if}</a>
                <a href="#" onclick="denuncia.nueva('usuario',{$tsInfo.uid}, '', '{$tsInfo.nick}'); return false">Denunciar</a>
                {if ($tsUser->is_admod || $tsUser->permisos.mosu) && !$tsInfo.user_baneado}
                    <a href="#" onclick="mod.users.action({$tsInfo.uid}, 'ban', true); return false;">Suspender</a>
                    {/if}
                    {if !$tsInfo.user_activo || $tsInfo.user_baneado}
                    <span class="baneado">Cuenta {if !$tsInfo.user_activo}desactivada{else}baneada
                    {/if}
                {/if}
            </span></span>
			{/if}
		</header></div>
	</div></div>
</section>   </div>