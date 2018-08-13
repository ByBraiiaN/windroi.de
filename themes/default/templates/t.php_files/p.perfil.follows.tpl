1:
	<header>
        <h3>{if $tsType == 'seguidores'}Usuarios que siguen a {$tsUsername}{else}Usuarios que {$tsUsername} sigue{/if}</h3>
    </header>
    {if $tsData.data}
    <ul>
        {foreach from=$tsData.data item=u}
        <li>
			<a href="{$tsConfig.url}/perfil/{$u.user_name}">
            <img src="{$tsConfig.url}/files/avatar/{$u.user_id}_50.jpg"/></a>
        	<a href="{$tsConfig.url}/perfil/{$u.user_name}">{$u.user_name}</a>
        	<img class="bandera" src="{$tsConfig.images}/flags/{$u.user_pais|lower}.png"/>
            <span class="grey">{$u.p_mensaje}</span>
        </li>
        {/foreach}
        <li class="paginador">
    		{if $tsData.pages.prev != 0}<a href="#" onclick="perfil.follows('{$tsType}', {$tsData.pages.prev}); return false;" class="boton">Anterior</a>{/if}
    		{if $tsData.pages.next != 0}<a href="#" onclick="perfil.follows('{$tsType}', {$tsData.pages.next}); return false;" class="boton floatR">Siguiente</a>{/if}
        </li>
    </ul>
    {else}
    <p class="emptyData">{if $tsType == 'seguidores'}No tiene seguidores{else}No sigue usuarios{/if}</p>
    {/if}