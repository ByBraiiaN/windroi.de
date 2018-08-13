<script type="text/javascript">
muro.maxWidth = 400;
muro.stream.total = {$tsMuro.total};
</script>				
<section id="portal_news" class="showHide portalNoticias" status="activo">
    <div id="info" pid="{$tsInfo.uid}"></div>
	<section id="perfil-news">
		<section id="news-content">
			<section id="wall-content">
				{include file='modules/perfil/m.perfil_muro_story.tpl'} 
			</section>
		</section>
	</section>
	<!-- more -->
	{if $tsMuro.total >= 10}
	<a class="more-pubs  btn btn-danger btn-block margin-bottom" href="#" onclick="muro.stream.loadMore('news'); return false;" class="a_blue">Publicaciones más antiguas</a>
	{elseif $tsMuro.total == 0}
	<p class="emptyData">Hola <u>{$tsUser->nick}</u> que te parece si empiezas a seguir usuarios.</p>
	{/if}
</section>