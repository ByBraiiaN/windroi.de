<section class="portalPostVisitados">
    <header>
        <h3>Últimos posts visitados</h3>
    </header>
    <ul>
        {if $tsLastPostsVisited}
        {foreach from=$tsLastPostsVisited item=p}
        {if $p.post_title}
        <li class="categoriaPost">
        	<img title="{$p.c_nombre}" src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}"/>
            <a class="title {if $p.post_private}categoria privado{/if}" alt="{$p.post_title}" title="{$p.post_title}" target="_self" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:90}</a>
        </li>
        {/if}
        {/foreach}
        {else}
        <li class="emptyData">No has visitado posts recientemente.</li>
        {/if}
    </ul>
</section>