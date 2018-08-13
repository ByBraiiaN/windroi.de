<div class="content-tabs bloqueados" style="display:none">
	<fieldset>
		{if $tsBlocks}
		<ul>
			{foreach from=$tsBlocks item=b}
			<li>
                <a href="{$tsConfig.url}/perfil/{$b.user_name}">{$b.user_name}</a>
                <a title="Desbloquear Usuario" href="javascript:bloquear('{$b.b_auser}', false, 'mis_bloqueados')" class="boton desbloqueadosU bloquear_usuario_{$b.b_auser}">Desbloquear</a>
            </li>
			{/foreach}
		</ul>
		{else}
		<p class="emptyData">No hay usuarios bloqueados</p>
		{/if}
	</fieldset>
</div>