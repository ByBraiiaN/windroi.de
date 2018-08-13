1:
<li>
	<div class="contMensajeAutor">
		<div class="autorMensaje">
			<a href="{$tsConfig.url}/perfil/{$tsUser->nick}" class="autor-name">{$tsUser->nick}</a> 
			{if $tsUser->is_admod}
            <a href="{$tsConfig.url}/moderacion/buscador/1/1/{$mp.mp_ip}">
			<span class="mp-date">{$mp.mp_ip}</span>
            </a> 
            {/if} 
            <span class="mp-date">{$mp.mp_date|hace:true}</span>
		</div>
		<p>{$mp.mp_body|nl2br}</p>
	</div>
</li>