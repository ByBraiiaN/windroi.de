{include file='sections/main_header.tpl'}

<section class="content">
<div class="row">
	<!---header>
		<h3>Mensajes</h3>
		<form method="get" action="{$tsConfig.url}/mensajes/search/">
			<input type="text" name="qm" placeholder="Buscar en Mensajes" title="Buscar en Mensajes" value="{$tsMensajes.texto}" class="search_mp onblur_effect"/>
		</form>
	</header--->
    <div class="col-md-3">
	{include file='modules/mensajes/m.mensajes_menu.tpl'}</div>
	<div style="display: none;" id="m-mensaje"></div>
      <div class="col-md-9">
	<div class="contMensajes" id="mensajes">
		{if $tsAction == '' || $tsAction == 'enviados' || $tsAction == 'respondidos' || $tsAction == 'search'}
		{include file='modules/mensajes/m.mensajes_list.tpl'}
		{elseif $tsAction == 'leer'}
		{include file='modules/mensajes/m.mensajes_leer.tpl'}
		{elseif $tsAction == 'avisos'}
		{include file='modules/mensajes/m.mensajes_avisos.tpl'}
		{/if}
	</div></div>
</div></section>

{include file='sections/main_footer.tpl'}